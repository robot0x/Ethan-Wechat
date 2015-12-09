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
		passthru("git fetch --all");
		echo "<br />";
		passthru("$resetCommand");
		echo "<br />";
		echo "Done";

		$this->display();
	}
}