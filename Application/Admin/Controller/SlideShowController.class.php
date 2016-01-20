<?php
/**
 *幻灯片后台管理模块
 * 完成人：魏静云
 */
namespace Admin\Controller;

use SlideShow\Logic\SlideShowLogic;

use SlideShow\Model\SlideShowModel;//SlideShow
  
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
        //传js
        $this->assign("js",$this->fetch("addJs"));
        //显示 display
        $this->display('add');
    }

    public function saveAction(){
         //获取post数据
        $data = I('post.');
        $slideshowModel = new SlideShowModel();
        $state = $slideshowModel->saveSlideShow($data);
        if($state == "success"){
            $this->success('新增成功', U('index',I('get.')));
        }

       //  //取用户信息
       //  $slideshow = I('post.');
       // //dump(I('get.'));
       //  //添加 add()
       //  $SlideShowL = new SlideShowLogic();
       //  $SlideShowL->addList($slideshow);

       //  //判断异常
       //  if(count($errors=$SlideShowL->getErrors())!==0)
       //  {
       //      //数组变字符串
       //      $error =implode('<br/>', $errors);
       //      //显示错误
       //      $this->error("添加失败，原因：".$error,U('Admin/SlideShow/index',I('get.')));
            
       //  }
       //  $this->success("操作成功" , U('Admin/SlideShow/index',I('get.')));    
    }

    public function editAction(){
        //获取用户ID
        $slideshowId = I('get.id');
        // dump(I('get.'));
        //取用户信息 getListById()
        
        $SlideShowL = new SlideShowLogic();
        $slideshow = $SlideShowL->getListbyId($slideshowId);

        //传给前台
        $this->assign('slideshow',$slideshow);
        //传js
        $this->assign("js",$this->fetch("addJs"));
        
        $this->display('add'); 
    }

    // public function updateAction(){
    //     //取用户信息
    //     $data = I('post.');
    //     dump(I('get.'));
    //     //exit();
    //     //传给M层
    //     $SlideShowL = new SlideShowLogic();
    //     $SlideShowL->saveList($data);

    //     //判断异常
    //     if(count($errors=$SlideShowL->getErrors())!==0)
    //     {
    //         //数组变字符串
    //         $error =implode('<br/>', $errors);
    //         //显示错误
    //         $this->error("添加失败，原因：".$error,U('Admin/SlideShow/index',I('get.')));

    //          return false;
            
    //     }
    //         $this->success("操作成功" , U('Admin/SlideShow/index',I('get.')));
    // }

    public function deleteAction(){

        $userId = I('get.id');

        $SlideShowL = new SlideShowLogic();
        $status = $SlideShowL->deleteInfo($userId);

        if($status！==false){
           $this->success("删除成功", U('Admin/SlideShow/index',I('get.'))); 
        }
        else{
            $this->error("删除失败" , U('Admin/SlideShow/index',I('get.')));
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