<?php
namespace Admin\Controller;

Class GitController
{
	public function indexAction()
	{
		echo "hello git";
		$path = "/mengyunzhi/www/Ethan-Wechat";
		chdir($path);
		passthru("pwd");
		passthru("git pull https://github.com/yunzhiclub/Ethan-Wechat.git master");
		passthru("pwd");
	}
}