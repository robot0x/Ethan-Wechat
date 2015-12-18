<?php
namespace Admin\Controller;

use SlideShow\Logic\SlideShowLogic;
use Think\Controller;
use Yunzhi\Model\UserModel;
use SlideShow\Model\SlideShowModel;  


class SlideShowController extends Controller
{
	public function indexAction(){
		 //获取列表
        $SlideShowL = new SlideShowLogic();
        $slideshows = $SlideShowL->getLists();

        $SlideShowM = new SlideShowModel();
        echo $SlideShowM->getLastSql();
		//dump($slideshows);

		$this->assign('slideshows',$slideshows);
        $this->display();
    }
}