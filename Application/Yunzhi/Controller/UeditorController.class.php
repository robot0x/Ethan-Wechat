<?php
namespace Yunzhi\Controller;

use Think\Controller;

class UeditorController extends Controller{
	public function indexAction()
	{
		$userId = I('session.userId');
		$configFile = APP_PATH . "Yunzhi/Conf/ueditor.json";
		$data = new \Org\Util\Ueditor($userId, $configFile);
		echo $data->output(); 
	}
}