<?php
namespace Admin\Controller;

use Activity\Logic\ActivityLogic;

class ActivityController extends AdminController
{
	public function indexAction()
	{
		//获取列表信息
		$ActivityL = new ActivityLogic();
		$activities = $ActivityL->getLists();
		
		//向V层复制
		$this->assign('activities',$activities);
		$this->display();
	}
	public function addAction()
	{
		//显示添加页面
		$this->display('edit');
	}
	public function saveAction()
	{
		//获取添加活动信息
		$activity = I('post.');
		//添加活动信息
		$ActivityL = new ActivityLogic();
		$ActivityL->addList($activity);

		if(count($errors=$ActivityL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            
            
            //显示错误
             $this->error("添加失败，原因：".$error,U('Activity/Index/index?p='.I('get.p')));
            
        }
        $this->success("操作成功" , U('Activity/Index/index?p='.I('get.p'))); 
	}
	public function editAction()
	{
		//获取编辑的id
		$activityId=I('get.id');
		//取信息
		$ActivityL = new ActivityLogic();
		$activity = $ActivityL->getListById($activityId);
		//向V层赋值
		$this->assign('activity',$activity);
		$this->display();
	}
	public function updateAction()
	{
		//获取更新活动信息
		$activity = I('post.');
		dump($activity);
		//存更新活动信息
		$ActivityL = new ActivityLogic();
		$ActivityL->saveList($activity);

		if(count($errors=$ActivityL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            
            
            //显示错误
             $this->error("添加失败，原因：".$error,U('Activity/Index/index?p='.I('get.p')));

             return false;
            
        }
            $this->success("操作成功" , U('Activity/Index/index?p='.I('get.p')),20);
	}
	public function deleteAction()
	{
		//取删除的活动id
		$activityId = I('get.id');
		//删除活动信息
		$ActivityL = new ActivityLogic();
		$ActivityL->deleteInfo($activityId);

		if($status！==false){
           $this->success("删除成功", U('Activity/Index/index?p='.I('get.p'))); 
        }
        else{
            $this->error("删除失败" , U('Activity/Index/index?p='.I('get.p')));
        }
	}
	public function detailAction()
	{
		//取查看的id
		$activityId = I('get.id');
		//获取活动信息
		$ActivityL = new ActivityLogic();
		$activity=$ActivityL->getListById($activityId);
		//向V层赋值
		$this->assign('activity',$activity);
		$this->display();
	}
	   

}