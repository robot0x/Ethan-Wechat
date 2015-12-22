<?php
namespace Admin\Controller;

use Activity\Logic\ActivityLogic;

class ActivityController extends AdminController
{
	public function indexAction()
	{
		$ActivityL = new ActivityLogic();
		$activities = $ActivityL->getLists();
		

		$this->assign('activities',$activities);
		$this->display();
	}
	public function addAction()
	{
		$this->display('edit');
	}
	public function saveAction()
	{
		$activity = I('post.');

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
		$activityId=I('get.id');

		$ActivityL = new ActivityLogic();
		$activity = $ActivityL->getListById($activityId);

		$this->assign('activity',$activity);

		$this->display();
	}
	public function updateAction()
	{
		$activity = I('post.');
		dump($activity);

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
		$activityId = I('get.id');

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
		$activityId = I('get.id');

		$ActivityL = new ActivityLogic();
		$activity=$ActivityL->getListById($activityId);

		$this->assign('activity',$activity);

		$this->display();
	}
	   

}