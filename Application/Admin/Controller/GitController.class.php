<?php
namespace Admin\Controller;

use Think\Controller;

Class GitController extends Controller
{
	public function indexAction()
	{
		$this->display();
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
		echo "<br />$resetCommand";
		passthru("$resetCommand");
		echo "<br />Done <br />";

		$this->display();
	}
}