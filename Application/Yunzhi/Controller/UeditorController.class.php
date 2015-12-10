<?php
namespace Yunzhi\Controller;

use Think\Controller;

class UeditorController extends Controller{
	public function indexAction()
	{
		//改变模板界面符号（由于json对象以{}开对结尾）
		C("TMPL_L_DELIM", "<{");
		C("TMPL_L_DELIM", "}>");
		$userId = I('session.userId');
		$config = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", $this->fetch("config")), true);
		$data = new \Org\Util\Ueditor($userId, $config);
		echo $data->output();
	}
}