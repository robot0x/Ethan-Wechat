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
		passthru("git config --global user.name 'myskies'");
		passthru("git config --global user.email 3792535@qq.com");
		passthru("git config --list");
		passthru("git fetch https://github.com/yunzhiclub/Ethan-Wechat.git git");
		passthru("pwd");
	}
}