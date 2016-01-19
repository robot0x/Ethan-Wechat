<?php
/**
 * 评价视图表MODEL
 * user用户表
 * Evaluationg 评价表
 * order 订单表
 * room 房型表
 * customer 客户表
 * panjie
 * 2016-01-15
 */
namespace EvaluationView\Model;

use Yunzhi\Model\YunzhiModel;

class EvaluationViewModel extends YunzhiModel
{
	protected $orderBys     = array("update_time" => "desc");  //排序字段方式
	protected $field        = "customer-nickname";              //查询字段
}