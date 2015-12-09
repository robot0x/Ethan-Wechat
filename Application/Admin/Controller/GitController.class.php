<?php
namespace Admin\Controller;

use Think\Controller;

Class GitController extends Controller
{
	public function indexAction()
	{
		$this->display();
		passthru("whoami");
	}

	public function resetAction()
	{
		$path = "/mengyunzhi/www/Ethan-Wechat";
		$branch = I("get.branch");
		$remote = I("get.remote") === "" ? "origin" : I("get.remote");
		$resetCommand = "git reset --hard $remote/$branch";

		chdir($path);
		echo "git fetch --all <br />";
		passthru("git fetch --all");
		echo "<br />$resetCommand<br />";
		passthru("$resetCommand");

		$wwwPath = "/mengyunzhi/www";
		chdir($wwwPath);
		$chmod = "chmod -R 777 Ethan-Wechat/";
		echo "<br />$chmod</br>";
		passthru("$chmod");
		echo "<br />Done <br />";

		echo "<a href='{:U('index')}'>返回...</a>";
	}
}