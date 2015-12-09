<?php
namespace Admin\Controller;

Class GitController
{
	public function indexAction()
	{
		$path = "/mengyunzhi/www/Ethan-Wechat";
		chdir($path);
		passthru("git config --global user.name 'myskies'");
		passthru("git config --global user.email 3792535@qq.com");
		passthru("git pull https://mskies:Liuyan7@github.com/yunzhiclub/Ethan-Wechat.git git");
		echo "done";
	}
}