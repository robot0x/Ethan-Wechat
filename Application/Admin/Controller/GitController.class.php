<?php
namespace Admin\Controller;

Class GitController
{
	public function indexAction()
	{
		passthru("/mengyunzhi/www/Ethan-wechat/restDev.sh");
	}
}