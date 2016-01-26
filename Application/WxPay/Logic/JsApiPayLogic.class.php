<?php
namespace WxPay\Logic;
use Think\Controller;
/**
 * 
 * JSAPI支付实现类
 * 该类实现了从微信公众平台获取code、通过code获取openid和access_token、
 * 生成jsapi支付js接口所需的参数、生成获取共享收货地址所需的参数
 * 
 * 该类是微信支付提供的样例程序，商户可根据自己的需求修改，或者使用lib中的api自行开发
 * 
 * @author widy
 *
 */
class JsApiPayLogic extends Controller
{
    /**
     * 
     * 网页授权接口微信服务器返回的数据，返回样例如下
     * {
     *  "access_token":"ACCESS_TOKEN",
     *  "expires_in":7200,
     *  "refresh_token":"REFRESH_TOKEN",
     *  "openid":"OPENID",
     *  "scope":"SCOPE",
     *  "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
     * }
     * 其中access_token可用于获取共享收货地址
     * openid是微信支付jsapi支付接口必须的参数
     * @var array
     */
    public $data = null;
    
    /**
     * update:2016.1.26
     * 对单页面的锚点问题进行了处理
     * 
     * 通过跳转获取用户的openid，跳转流程如下：
     * 1、设置自己需要调回的url及其其他参数，跳转到微信服务器https://open.weixin.qq.com/connect/oauth2/authorize
     * 2、微信服务处理完成之后会跳转回用户redirect_uri地址，此时会带上一些参数，如：code
     * TODO：获取OPENID后，拉取服务器信息，生成当前用户信息，并更新用户信息
     * @return 用户的openid
     */
    public function sessionOpenid()
    {
        //如果存在openId,证明该用户已经认证。
        //直接返回seesion,同时再次seesion一次
        if (session("openId") !== null)
        {
            session("openId", session("openId"));
            return;
        }

        //通过code获得openid
        if (!isset($_GET['code'])){
            //触发微信返回code码.由于我们现在是单页面程序,所以,不需要query做为参数
            // $baseUrl = urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].$_SERVER['QUERY_STRING']);
            $baseUrl = urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF']);
            $url = $this->__CreateOauthUrlForCode($baseUrl);

            //调用模板进行跳转,目的是为了转存cooker.
            //将跳转的信息放在js中,这样实现了存cookie的目的.
            $this->assign("url", $url);
            $this->display("WxPay@JsApiPay/getOpenId");
            exit();
        } else {
            //获取code码，以获取openid
            $code = $_GET['code'];
            $openid = $this->getOpenidFromMp($code);

            //如果获取到了openid,则进行seesion,未获取到
            //则重新获取code.
            if ($openid == "")
            {
                $this->sessionOpenid();
                return;
            }

            //session
            session("openId", $openid);

            //按cookie拼接URL,将锚点信息加入
            $url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
            $anchor = cookie('anchor');
            if ($anchor && $anchor != "undefined")
            {
                $url = $url . "#" . $anchor;
            }
            Header("Location: $url");
        }
    }
    
    /**
     * 
     * 获取jsapi支付的参数
     * @param array $UnifiedOrderResult 统一支付接口返回的数据
     * @throws WxPayException
     * 
     * @return json数据，可直接填入js函数作为参数
     */
    public function GetJsApiParameters($UnifiedOrderResult)
    {
        if(!array_key_exists("appid", $UnifiedOrderResult)
        || !array_key_exists("prepay_id", $UnifiedOrderResult)
        || $UnifiedOrderResult['prepay_id'] == "")
        {
            E("参数错误");
        }
        $jsapi = new WxPayJsApiPayLogic();
        $jsapi->SetAppid($UnifiedOrderResult["appid"]);
        $timeStamp = time();
        $jsapi->SetTimeStamp("$timeStamp");
        $jsapi->SetNonceStr(ApiLogic::getNonceStr());
        $jsapi->SetPackage("prepay_id=" . $UnifiedOrderResult['prepay_id']);
        $jsapi->SetSignType("MD5");
        $jsapi->SetPaySign($jsapi->MakeSign());
        // $parameters = json_encode($jsapi->GetValues());
        $parameters = $jsapi->GetValues();
        return $parameters;
    }
    
    /**
     * 
     * 通过code从工作平台获取openid机器access_token
     * @param string $code 微信跳转回来带上的code
     * 
     * @return openid
     */
    public function GetOpenidFromMp($code)
    {
        $url = $this->__CreateOauthUrlForOpenid($code);
        //初始化curl
        $ch = curl_init();
        //设置超时
        curl_setopt($ch, CURLOPT_TIMEOUT, $this->curl_timeout);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        if(C("CURL_PROXY_HOST") != "0.0.0.0" 
            && C("CURL_PROXY_PORT") != 0){
            curl_setopt($ch,CURLOPT_PROXY, C("CURL_PROXY_HOST"));
            curl_setopt($ch,CURLOPT_PROXYPORT, C("CURL_PROXY_PORT"));
        }
        //运行curl，结果以jason形式返回
        $res = curl_exec($ch);
        curl_close($ch);
        //取出openid
        $data = json_decode($res,true);
        $this->data = $data;
        if ($data['errcode'] !== null)
        {
            E("网页授权失败,错误代码" . $data['errcode'] . ".信息:" . $data['errmsg']);
        }
        $openid = $data['openid'];
        return $openid;
    }
    
    /**
     * 
     * 拼接签名字符串
     * @param array $urlObj
     * 
     * @return 返回已经拼接好的字符串
     */
    private function ToUrlParams($urlObj)
    {
        $buff = "";
        foreach ($urlObj as $k => $v)
        {
            if($k != "sign"){
                $buff .= $k . "=" . $v . "&";
            }
        }
        
        $buff = trim($buff, "&");
        return $buff;
    }
    
    /**
     * 
     * 获取地址js参数
     * 
     * @return 获取共享收货地址js函数需要的参数，json格式可以直接做参数使用
     */
    public function GetEditAddressParameters()
    {   
        $getData = $this->data;
        $data = array();
        $data["appid"] = C("APPID");
        $data["url"] = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $time = time();
        $data["timestamp"] = "$time";
        $data["noncestr"] = "1234568";
        $data["accesstoken"] = $getData["access_token"];
        ksort($data);
        $params = $this->ToUrlParams($data);
        $addrSign = sha1($params);
        
        $afterData = array(
            "addrSign" => $addrSign,
            "signType" => "sha1",
            "scope" => "jsapi_address",
            "appId" => C("APPID"),
            "timeStamp" => $data["timestamp"],
            "nonceStr" => $data["noncestr"]
        );
        $parameters = json_encode($afterData);
        return $parameters;
    }
    
    /**
     * 
     * 构造获取code的url连接
     * @param string $redirectUrl 微信服务器回跳的url，需要url编码
     * 
     * @return 返回构造好的url
     */
    private function __CreateOauthUrlForCode($redirectUrl)
    {
        $urlObj["appid"] = C("APPID");
        $urlObj["redirect_uri"] = "$redirectUrl";
        $urlObj["response_type"] = "code";
        $urlObj["scope"] = "snsapi_base";
        $urlObj["state"] = "STATE"."#wechat_redirect";
        $bizString = $this->ToUrlParams($urlObj);
        return "https://open.weixin.qq.com/connect/oauth2/authorize?".$bizString;
    }
    
    /**
     * 
     * 构造获取open和access_toke的url地址
     * @param string $code，微信跳转带回的code
     * 
     * @return 请求的url
     */
    private function __CreateOauthUrlForOpenid($code)
    {
        $urlObj["appid"] = C("APPID");
        $urlObj["secret"] = C("APPSECRET");
        $urlObj["code"] = $code;
        $urlObj["grant_type"] = "authorization_code";
        $bizString = $this->ToUrlParams($urlObj);
        return "https://api.weixin.qq.com/sns/oauth2/access_token?".$bizString;
    }
}