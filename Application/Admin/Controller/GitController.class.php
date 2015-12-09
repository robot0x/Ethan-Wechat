<?php
namespace Admin\Controller;

Class GitController
{
	public function indexAction()
	{
		$path = "/mengyunzhi/www/Ethan-Wechat";
		chdir($path);
		passthru("pwd");
	}
}