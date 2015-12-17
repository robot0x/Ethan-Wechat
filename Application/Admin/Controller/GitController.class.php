<?php
/**
 * 利用PHP利行LINUX脚本输入，以达到更新服务器代码的目的。
 * 前提：
 * 1。用whoami查看当前用户
 * 2。将文件夹的拥有者改为变当前用户
 * 注意：正式上线后，一定要将文件夹拥有权限改回
 * 同时，更改其777权限为正常权限。
 */
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