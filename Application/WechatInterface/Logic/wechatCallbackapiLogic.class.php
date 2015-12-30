<?php
namespace WechatInterface\Logic;

use WechatInterface\Controller\IndexController;
use WechatInterface\Logic\CustomMenuLogic;
use Customer\Logic\CustomerLogic;

class wechatCallbackapiLogic extends IndexController {
	//初始化
    public function valid()
    {
        $echoStr = $_GET['echostr'];
        if($this->checkSignature()){
        	echo $echoStr;
            exit();
        }
    }
    
    //教研签名
    private function checkSignature()
    {
    	$signature = $_GET['signature'];
        $timestamp = $_GET['timestamp'];
        $nonce = $_GET['nonce'];

        $token = C("TOKEN");
        $tmpArr =  array($token, $timestamp,$nonce);
        sort($tmpArr);
        $tmpStr = implode($tmpArr);
        $tmpStr = sha1($tmpStr);
        
        if( $tmpStr == $signature){
        	return true;
        }else{
        	return false;
        }
    }
    
    //返回消息
    public function responseMsg()
    {
        $postStr = $GLOBALS['HTTP_RAW_POST_DATA'];

        if(!empty($postStr)){
			$postObj = simplexml_load_string($postStr,'SimpleXMLElement',LIBXML_NOCDATA);

           	$RX_TYPE = trim($postObj->MsgType);
            
            switch($RX_TYPE)
            {
                case "text":
                	$result = $this->receiveText($postObj);
                	break;
                case "event":
                	$result = $this->receiveEvent($postObj);
                	break;
            }
            echo $result;
        }else{
        	echo "";
            exit();
        }
    }
    
    //接收文本消息
    private function receiveText($object)
    {

        $keyword = trim($object->Content);
        
        if($keyword ==  "图文"){
        	$content = array();
            $content[] = array("Title"=>"标题",
                               "Description"=>"description",
                               "PicUrl"=>"http://edu.yuhua.gov.cn/yey2/t2/201211/W020121112691543225302.jpg",
                               "Url"=>"http://baidu.com");

            $result = $this->transmitNews($object, $content);
        
        }else{
        	$result = $this->transmitText($object, $keyword);
        }
       
        return $result;
    }
    
    //接收事件消息
    private function receiveEvent($object)
    {
    	switch($object->Event)
        {
            case "subscribe":
                $CustomerL = new CustomerLogic;
                $CustomerL->saveCustomerInfo($object);
            	$content = "邓浩洋测试";
            	break;
            case "unsubscribe":
           		$content = "你真的不爱我么?";
                break;
            case "CLICK":
            	$menuL = new CustomMenuLogic();
                $menuL->setEventKey($object->EventKey);
            	$content = $menuL->getContent();
                break;
        }
        if(is_array($content)){
        	$result = $this->transmitNews($object, $content);
        }else{
        	$result = $this->transmitText($object, $content);
        }
        return $result;
    }
    
    //发送图文消息
    private function transmitText($object , $content)
    {
    	$textTpl = "<xml>
        			<ToUserName><![CDATA[%s]]></ToUserName>
        			<FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[text]]></MsgType>
                    <Content><![CDATA[%s]]></Content>
					</xml>";
		$result = sprintf($textTpl, $object->FromUserName, $object->ToUserName,time(),$content);
		return $result;                                         
    }
    
    public function transmitNews($object, $arr_item){
        if(!is_array($arr_item)){
        	return;
        }
        $itemTpl = "<item>
        			<Title><![CDATA[%s]]></Title>
                    <Description><![CDATA[%s]]></Description>
                    <PicUrl><![CDATA[%s]]></PicUrl>
                    <Url><![CDATA[%s]]></Url>
                    </item>";
        
        $item_str = "";

        foreach ($arr_item as $item){
            $item_str .= sprintf($itemTpl, $item['Title'], $item['Description'], $item['PicUrl'], $item['Url']);
            
        }
        
        $newsTpl = "<xml>
        			<ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[news]]></MsgType>
                    <ArticleCount>%s</ArticleCount>
                    <Articles>
                    $item_str
                    </Articles>
                    </xml>";
        
        $result = sprintf($newsTpl, $object->FromUserName, $object->ToUserName, time(), count($arr_item));
        return $result;
    }
}