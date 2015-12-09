<?php
namespace Admin\Controller;

Class GitController
{
	public function indexAction()
	{
		passthru("/mengyunzhi/www/Ethan-Wechat/resetDev.sh");
		passthru("pwd");
	}
}