<?php
/**
 * 活动管理
 * panjie
 */
namespace Api\Controller;

use Activity\Logic\ActivityLogic;

class ActivityController extends ApiController
{
	/**
	 * 获取活动列表
	 * @return jsonLists
	 */
	public function getActivitysAction()
	{
		$this->ajaxReturn($this->getActivitys());
	}

	/**
	 * 获取活动列表
	 * @return lists
	 */
	public function getActivitys()
	{
		$ActivityL = new ActivityLogic();

		//设置查询条件
		$maps = array("status"=>"0");
		$ActivityL->setMaps($maps);

		//设置取回字段
		$fields = array("id","end_time","title","thumbnails_url"=>"url");
		$ActivityL->setFields($fields);

		//取LISTS
		$activeties = $ActivityL->getLists(); 

		//拼接返回数据
		$data = array("status"=>"success");
		$data["data"] = $activeties;

		//返回值
		return $data;
	}

	/**
	 * 获取活动详情
	 * panjie
	 * @return ajaxList 
	 */
	public function getActivityDetailAction()
	{
		$this->ajaxReturn($this->getActivityDetail());
	}

	/**
	 * 获取活动详情
	 * panjie
	 * @return list 
	 */
	public function getActivityDetail()
	{
		//返回值初始化
		$data = array("status"=>"error");

		//获取传入关键字
		$id = (int)I('get.id');

		//实例化
		$ActivityL = new ActivityLogic();
		$activity = $ActivityL->getListById($id);

		//排错
		if(count($ActivityL->getErrors()) > 0)
		{
			$data["message"] = "activityConError: " . $ActivityL->getError();
			return $data;
		}

		//去除记录为空或状态为冻结的记录
		if($activity === null || $activity['status'] == '1')
		{
			$data['message'] = "activityConError: the list of $id is not exist, or the list is freezed!";
			return $data;
		}

		//返回数据
		$data['data'] = $activity;
		return $data;

	}
}