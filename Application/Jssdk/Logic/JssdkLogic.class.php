<?php
/**
 * 微信JSSDK
 * panjie
 * 2016.01.31
 */
namespace Jssdk\Logic;
use WechatInterface\Logic\wechatInterfaceapiLogic;   //微信接口
use Think\Upload\Driver\Local;                          //Thinkphp内置检测文件夹类
class JssdkLogic
{
    private $appId;
    private $appSecret;
    private $error = "";

    public function setError($error)
    {
        $this->error = $error;
    }
    public function getError()
    {
        return $this->error;
    }
    static public function sessionUrl()
    {
        $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $url =  $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        session("url", $url);
    }

    public function __construct($appId, $appSecret) {
        $this->appId        = $appId;
        $this->appSecret    = $appSecret;
    }

    public function getSignPackage() {
        $jsapiTicket = $this->getJsApiTicket();
        // 注意:一般的调用,由于URL不固定,所以要动态获取
        // 不能 hardcode.
        // 但在这里,由于是单入口, 所以进行了hardcode
        // $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        // $url =  $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REDIRECT_URL'];
        $url = session("url");
        if ($url == null)
        {
            $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
            $url =  $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        }

        $timestamp = time();
        $nonceStr = $this->createNonceStr();

        // 这里参数的顺序要按照 key 值 ASCII 码升序排序
        $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

        $signature = sha1($string);

        $signPackage = array(
            "jsapiTicket" => $jsapiTicket,
            "appId"     => $this->appId,
            "nonceStr"  => $nonceStr,
            "timestamp" => $timestamp,
            "signature" => $signature,
            "rawString" => $string,
            "url"       => $url,
        );

        return $signPackage; 
    }

    private function createNonceStr($length = 16) {
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $str = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }

    private function getJsApiTicket() {
        // jsapi_ticket 应该全局存储与更新，以下代码以写入到文件中做示例
        $data = json_decode($this->get_php_file("jsapi_ticket.php"));
        if ($data->expire_time < time()) {
            $accessToken = $this->getAccessToken();
            // 如果是企业号用以下 URL 获取 ticket
            // $url = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=$accessToken";
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$accessToken";
            $res = json_decode($this->httpGet($url));
            $ticket = $res->ticket;
            if ($ticket) { 
                $data->expire_time = time() + 7000;
                $data->jsapi_ticket = $ticket;
                $this->set_php_file("jsapi_ticket.php", json_encode($data));
            }
        } else {
            $ticket = $data->jsapi_ticket;
        }

        return $ticket;
    }

    private function getAccessToken() {
        // access_token 应该全局存储与更新，以下代码以写入到文件中做示例
        $data = json_decode($this->get_php_file("access_token.php"));
        if ($data->expire_time < time()) {
            // 如果是企业号用以下URL获取access_token
            // $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$this->appId&corpsecret=$this->appSecret";
            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$this->appId."&secret=".$this->appSecret;
            $res = json_decode($this->httpGet($url));
            $access_token = $res->access_token;
            if ($access_token) {
                $data->expire_time = time() + 7000;
                $data->access_token = $access_token;
                $this->set_php_file("access_token.php", json_encode($data));
            }

        } else {
            $access_token = $data->access_token;
        }
        return $access_token;
    }

    private function httpGet($url) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

        $res = curl_exec($curl);
        curl_close($curl);

        return $res;
    }

    private function get_php_file($filename) {
        return trim(substr(file_get_contents($filename), 15));
    }

    private function set_php_file($filename, $content) {
        $fp = fopen($filename, "w");
        fwrite($fp, "<?php exit();?>" . $content);
        fclose($fp);
    }

    /**
     * 通过微信上传图片返回的serverId，进行图片的抓取，并存在服务器
     * @param  array $serverIds 
     * @return array 图片在服务器存的URL信息（不包含域名的根路径）
     */
    public function saveImageByserverIds($serverIds)
    {
        $urls = array();        //返回的图片地址
        if (!is_array($serverIds))
        {
            $this->setError("JssdkL:saveImageByserverIds.The input type is not array.传入的变量类型不是数组");
            return false;
        }
        foreach ($serverIds as $key => $mediaId) {
            if (!is_string($mediaId))
            {
                $this->setError("JssdkL:saveImageByserverIds.The value of item type is not string.数组变量类型必须为字符串.");
                return false;
            }
            if (!$url = $this->getAndUploadWxImage($mediaId))
            {
                return false;
            }
            $urls[] = $url;
        }
        return $urls;
    }

/*
     * 获取微信服务器上传的图片
     * 1.取得当前access_token()
     * 2.下载图片
     * 3.将图片信息存入附件表(todo)
     * 4.上传图片
     * 5.返回图片根目录
     */
    public function getAndUploadWxImage($mediaId)
    {
        //获取accessToken
        $wechatInterfaceapiL = new wechatInterfaceapiLogic;
        $access_token = $wechatInterfaceapiL->getAccessToken(); 
        
        //下载图片,并抓取图片
        $url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=$access_token&media_id=$mediaId";
        $fileInfo = $this->downloadWeixinFile($url);
        $filecontent = $fileInfo["body"];
        $header = $fileInfo["header"];
        if ($header['content_type'] == 'text/plain')
        {
            $this->setError("JssdkL,gAU:fetch image from weixin error.获取图片出错。msg:" . $filecontent);        
            return false;
        }

        //未设置路径给默认值
        if (C("YNNZHI_UPLOAD_DIR") == "")
        {
            C("YNNZHI_UPLOAD_DIR", "/uploads");
        }

        //设置上传文件路径
        $rootPath = I('server.DOCUMENT_ROOT') . C("YNNZHI_UPLOAD_DIR");
        $savePath = "/winxin/images/" . date("Ymd");

        //较验上传文夹
        $Local = new Local();
        if (!$Local->checkRootPath($rootPath) || !$Local->checkSavePath($savePath))
        {
            $this->setError("JssdkL,gAU:" . $Local->getError());
            return false;
        }

        //拼接文件上传路径
        $url = $savePath . '/' . uniqid() . '.jpeg';
        $fileName = $rootPath . $url ;
        
        //存文件
        $local_file = fopen($fileName, 'w');
        if (false !== $local_file){
            if (false !== fwrite($local_file, $filecontent)) {
                fclose($local_file);
            }
            else
            {
                $this->setError("JssdkL,gAU:Write file failed(文件写入失败)");
                return false;
            }
        }
        else
        {
            $this->setError("JssdkL,gAU:Open file failed(文件打开失败)");
            return false;
        }
        return C("YNNZHI_UPLOAD_DIR") . $url;
    }
    
    /**
     * 下载微信服务器的资源
     * @param  string $url 微信图片暂存服务器API地址
     * @return array  带有头信息与文件主体的数组
     */
    function downloadWeixinFile($url)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HEADER, 0);    
        curl_setopt($ch, CURLOPT_NOBODY, 0);    //只取body头
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $package = curl_exec($ch);
        $httpinfo = curl_getinfo($ch);
        curl_close($ch);
        $imageAll = array_merge(array('header' => $httpinfo), array('body' => $package)); 
        return $imageAll;
    }
}