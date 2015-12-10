<?php
namespace Yunzhi\Controller;

use Think\Controller;

class UeditorController extends Controller{
	public function indexAction()
	{
		$userId = I('session.userId');
		$data = new \Org\Util\Ueditor($userId, $config);
		echo $data->output();
	}
}