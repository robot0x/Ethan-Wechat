<?php
namespace Admin\Git;

Class GitController
{
	public function indexAction()
	{
		passthru("/mengyunzhi/www/Ethan-wechat/restDev.sh");
	}
}