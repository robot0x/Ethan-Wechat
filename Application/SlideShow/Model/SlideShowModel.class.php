<?php
namespace SlideShow\Model;

use Yunzhi\Model\YunzhiModel;

class SlideShowModel extends YunzhiModel
{

 	protected $orderBys     = array("weight"=>"desc");      //排序字段方式
	protected $keywords     = "I('get.keywords')";                   //查询关键字
    protected $field        = "title";              //查询字段
}