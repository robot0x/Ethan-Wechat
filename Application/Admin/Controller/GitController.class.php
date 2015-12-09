<?php
namespace Admin\Controller;

Class GitController
{
	public function indexAction()
	{
		passthru("/mengyunzhi/www/Ethan-Wechat/restDev.sh");
		passthru("pwd");
	}
}