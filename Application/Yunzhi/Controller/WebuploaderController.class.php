<?php
namespace Yunzhi\Controller;

use Think\Controller;

class WebuploaderController extends Controller
{
    public function configAction() {
        $this->display("config.js");
    }
    
    public function uploadAction() 
    {   
		$userId 	= I('session.userId');
		$configFile = APP_PATH . "Yunzhi/Conf/ueditor.json";
		$data 		= new \Org\Util\Ueditor($userId, $configFile);
		$return 	= $data->outputArray();
		// dump($return);
        // Return Success JSON-RPC response
        die('{"jsonrpc" : "2.0", "result" : null, "id" : "id"}');
    }
}
