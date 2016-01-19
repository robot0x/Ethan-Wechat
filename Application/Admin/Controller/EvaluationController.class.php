<?php
/**
 * 评价管理
 * panjie 
 * 2016-01-15
 */
namespace Admin\Controller;

use EvaluationView\Logic\EvaluationViewLogic; //评价视图
use Evaluation\Logic\EvaluationLogic;			//评价
use Customer\Logic\CustomerLogic;			//客户表

class EvaluationController extends AdminController
{
	public function indexAction()
	{
		//实例化，取出数据
		$EvaluationViewL = new EvaluationViewLogic();
		$evaluationView = $EvaluationViewL->getLists();

		//传值，显示
		$this->assign("lists" , $evaluationView);
		$this->display();
	}

	/**
	 * 评价状态冻结，或是解冻
	 * 评价只能新增，不能删除
	 * 原因：涉及到订单的状态，你一旦删除了评价信息。
	 * 要么就要重置订单为未评价，那么用户还可以继续评价。
	 * 要么你就不重置订单状态，那么默认就会以为有了评价信息，而此时数据库中已经删除了，查询时会出错。
	 * 重要的是：如果按照上面的假设处理，那么以后维护时候，你还不知道错误在哪。
	 * 所以，评价信息一旦生成，绝对不能删除
	 * panjie
	 * 3792535@qq.com
	 * @return  
	 */
	public function freezeAction()
	{	
		//实例化
		$EvaluationL = new EvaluationLogic();

		//进行冻结\解冻操作
		if (count($EvaluationL->freezeListById(I('get.id'))->getErrors()) > 0)
		{
			$this->error("数据处理错误,错误信息:" . $EvaluationL->getError(), U('index', I('get.')));
			return;
		}

		$this->success("操作成功", U('index?id=', I('get.')));
	}

	public function editAction()
	{
		$EvaluationViewL = new EvaluationViewLogic();
		$evaluation = $EvaluationViewL->getListById(I('get.id'));

		$this->assign("list", $evaluation);
		$this->display();
	}

	public function saveAction()
	{
		$EvaluationL = new EvaluationLogic();
		if (!$EvaluationL->saveList(I('post.')))
		{
			$this->error("数据处理错误，错误信息:" . $EvaluationL->getError(), U('index?id=', I('get.')));
			return;
		}

		$this->success("操作成功", U('index?id=', I('get.')));

	}

	public function getCustomerInfoByCustomerIdAjaxAction()
	{
		$customerId = I('get.customer_id');
		$CustomerL = new CustomerLogic();
		if (!$customer = $CustomerL->getListById($customerId))
		{
			$data['status'] = "error";
			$data['message'] = "error: ". $CustomerL->getError();
		}
		else
		{
			$data['status'] = "success";
			$data['data'] = $customer;
		}
		$this->ajaxReturn($data);
	}
}