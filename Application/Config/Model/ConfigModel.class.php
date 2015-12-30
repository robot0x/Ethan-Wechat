<?php
namespace Config\Model;

use Yunzhi\Model\YunzhiModel;

class ConfigModel extends YunzhiModel
{
    protected $orderBys     = array("sort"=>"asc");      //排序字段方式
    protected $keywords     = "I('get.keywords')";        //查询关键字
    protected $field        = "name";              //查询字段
    //自动验证
    protected $_validate = array(
        // 在新增的时候验证
        array('name','require','必须输入配置名称'),
        array('type','require','必须输入配置类型'),
        array('status','require','必须输入状态'),
        array('value','require','必须输入配置值'),
        array('sort','require','必须输入排序大小'),
        array('remark','require','必须输入配置说明'),
        //
   );
}
