<?php
/**
 * 订单管理
 * panjie
 */
namespace Admin\Controller;

use Order\Logic\OrderLogic; 		//订单
use Admin\Model\Order\IndexModel;	//index数据模型
use Admin\Model\Order\DetailModel;	//detail模型

class OrderController extends AdminController
{
	public function indexAction()
	{
		$M 		= new IndexModel();
		$OrderL = new OrderLogic();

		//显示近90天的订单信息
		$beginTime 	= date_to_int(date("Y-m-d"));
		$endTime 	= date_to_int(date("Y-m-d", time()+90*24*60*60));

		$M->orders 	= $OrderL->getOrderedListsInDateRange($beginTime, $endTime);
		
		$this->assign("M", $M);

		$this->display();
	}

	public function detailAction()
	{	
		$M 			= new DetailModel();
		$OrderL 	= new OrderLogic();
		$M->order 	= $OrderL->getListById(I('get.id'));

		$this->assign("M", $M);
		$this->display();
	}

	/**
	 * 取消订单
	 * @return [type] [description]
	 */
	public function cancelAction()
	{
		$OrderL = new OrderLogic();
		if (count($OrderL->cancelListById(I('get.id'))->getErrors()) === 0 )
		{
			$this->success("操作成功", U("index?id=", I('get.')));
		}
		else
		{
			$this->error("操作失败，原因：" . $OrderL->getError(), U("index?id=", I('get.')));
		}
	}
}