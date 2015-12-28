<?php
/**
 *幻灯片后台管理模块
 * 完成人：魏静云
 */
namespace Admin\Controller;

use Room\Logic\RoomLogic;//Room
  
class RoomController extends AdminController

{
	public function indexAction(){
		 //获取列表
        $RoomL = new RoomLogic();
        $Rooms = $RoomL->getLists();
        //echo $RoomL->getLastSql();

		$this->assign('Rooms',$Rooms);
        $this->display();
    }

    public function addAction(){
        //显示 display
        $this->display('edit');
    }

    public function saveAction(){

        //取用户信息
        $Room = I('post.');
       //dump(I('get.'));
        //添加 add()
        $RoomL = new RoomLogic();
        $RoomL->addList($Room);

        //判断异常
        if(count($errors=$RoomL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            //显示错误
            $this->error("添加失败，原因：".$error,U('Room/Index/index?id=',I('get.p')));
            
        }
        $this->success("操作成功" , U('Room/Index/index?id=',I('get.p')));    
    }

    public function editAction(){
        //获取用户ID
        $RoomId = I('get.id');
        // dump(I('get.'));
        //取用户信息 getListById()
        $RoomL = new RoomLogic();
        $Room = $RoomL->getListbyId($RoomId);

        //传给前台
        $this->assign('Room',$Room);
        
        $this->display('edit'); 
    }

    public function updateAction(){
        //取用户信息
        $data = I('post.');
        dump(I('get.'));
        //exit();
        //传给M层
        $RoomL = new RoomLogic();
        $RoomL->saveList($data);

        //判断异常
        if(count($errors=$RoomL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            //显示错误
            $this->error("添加失败，原因：".$error,U('Room/Index/index',I('get.')));

             return false;
            
        }
            $this->success("操作成功" , U('Room/Index/index',I('get.')));
    }

    public function deleteAction(){

        $userId = I('get.id');

        $RoomL = new RoomLogic();
        $status = $RoomL->deleteInfo($userId);

        if($status！==false){
           $this->success("删除成功", U('Room/Index/index'.I('get.'))); 
        }
        else{
            $this->error("删除失败" , U('Room/Index/index?id='.I('get.')));
        }
    }

    public function detailAction(){
    	//取用户ID
    	$RoomId = I('get.id');

    	//抓取用户信息
    	$RoomL = new RoomLogic();
    	$Room = $RoomL->getListById($RoomId);

        //传值
        $this->assign('Room',$Room);

    	$this->display();
    }
}