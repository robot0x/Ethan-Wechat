<?php
/**
 * 活动管理
 * panjie
 */
namespace Activity\Model;

use Yunzhi\Model\YunzhiModel;

class ActivityModel extends YunzhiModel
{
protected $keywords     = "I('get.keywords')";        //查询关键字
    protected $field        = "title";              //查询字段
}