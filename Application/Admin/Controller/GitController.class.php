<?php
namespace Admin\Controller;

Class GitController
{
	public function indexAction()
	{
		$path = "/mengyunzhi/www/Ethan-Wechat";
		chdir($path);
		passthru("git fetch --all");
		echo "<br />";
		passthru("git reset --hard origin/git");
		echo "<br />";
		echo "Done";
	}
}