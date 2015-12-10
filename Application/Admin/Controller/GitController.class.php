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
		echo "<br />$resetCommand<br />";
		passthru("$resetCommand");

		$wwwPath = "/mengyunzhi/www";
		chdir($wwwPath);
		$chmod = "chmod -R 777 Ethan-Wechat/";
		echo "<br />$chmod</br>";
		passthru("$chmod");
		echo "<br />Done <br /><br />";

		echo "<a href=" . U('index') . ">Back</a>";
	}

	public function statusAction()
	{
		$cmd = "git status";
		echo $cmd;
		passthru($cmd);
		echo "<p>Done</p><br />";
		echo "<a href=" . U('index') . ">Back</a>";
	}
}