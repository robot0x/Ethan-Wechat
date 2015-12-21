<?php
namespace Admin\Controller;

use SlideShow\Logic\SlideShowLogic;
//use Think\Controller;
  
class SlideShowController extends AdminController

{
	public function indexAction(){
		 //获取列表
        $SlideShowL = new SlideShowLogic();
        $slideshows = $SlideShowL->getLists();
        //echo $SlideShowL->getLastSql();

		$this->assign('slideshows',$slideshows);
        $this->display();
    }
    public function addAction(){
        //显示 display
        $this->display('edit');
    }
    public function saveAction(){
        //取用户信息
        $slideshow = I('post.');

        //添加 add()
        $SlideShowL = new SlideShowLogic();
        $SlideShowL->addList($slideshow);

        //判断异常
        if(count($errors=$SlideShowL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            
            
            //显示错误
             $this->error("添加失败，原因：".$error,U('SlideShow/Index/index?p='.I('get.p')));
            
        }
        $this->success("操作成功" , U('SlideShow/Index/index?p='.I('get.p')));    
    }
    public function editAction(){
        //获取用户ID
        $slideshowId = I('get.id');
        //dump($slideshowId);
        //取用户信息 getListById()
 
        $SlideShowL = new SlideShowLogic();
        $slideshow = $SlideShowL->getListbyId($slideshowId);
        //dump($slideshow);
        //传给前台
        $this->assign('slideshow',$slideshow);
        
        $this->display('edit'); 
    }
    public function updateAction(){
        //取用户信息
        $data = I('post.');

        //传给M层
        $SlideShowL = new SlideShowLogic();
        $SlideShowL->saveList($data);

        //判断异常
        if(count($errors=$SlideShowL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            
            
            //显示错误
             $this->error("添加失败，原因：".$error,U('SlideShow/Index/index?p='.I('get.p')));

             return false;
            
        }
            $this->success("操作成功" , U('SlideShow/Index/index?p='.I('get.p')));
    }
    public function deleteAction(){

        $userId = I('get.id');

        $SlideShowL = new SlideShowLogic();
        $status = $SlideShowL->deleteInfo($userId);

        if($status！==false){
           $this->success("删除成功", U('SlideShow/Index/index?p='.I('get.p'))); 
        }
        else{
            $this->error("删除失败" , U('SlideShow/Index/index?p='.I('get.p')));
        }
    }
    public function detailAction(){
    	//取用户ID
    	$slideshowId = I('get.id');

    	//抓取用户信息
    	$SlideShowL = new SlideShowLogic();
    	$SlideShow = $SlideShowL->getListById($slideshowId);

        //传值
        $this->assign('SlideShow',$SlideShow);

    	$this->display();
    }
}