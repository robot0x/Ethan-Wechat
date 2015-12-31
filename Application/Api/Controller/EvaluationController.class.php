<?php
/**
 * 用户评价信息
 * panjie
 */
namespace Api\Controller;

use EvaluationCustom\Logic\EvaluationCustomLogic;

class EvaluationController extends ApiController
{
	/**
	 * 获取评论信息
	 * panjie
	 * @return jsonLists 
	 */
	public function getEvaluationsAction()
	{
		$this->ajaxReturn($this->getEvaluations());
	}

	/**
	 * 获取评论信息
	 * panjie
	 * @return list 
	 */
	public function getEvaluations()
	{
		//实例化
		$EvaluationCustomL = new EvaluationCustomLogic();
		$evaluationCustoms = $EvaluationCustomL->getLists();
		foreach($evaluationCustoms as $key => $value)
		{
			$evaluationCustoms["$key"]["url"] = explode(",", $value["url"]);
		}

		//返回
		$data = array("status"=>"success");
		$data['data'] = $evaluationCustoms;

		return $data;
	}
}