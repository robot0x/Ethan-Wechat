<?php

namespace User\Model;

use Yunzhi\Model\YunzhiModel;

class UserModel extends YunzhiModel
{
    protected $orderBys     = array("username"=>"asc"); //排序字段方式
    protected $keywords     = "I('get.keywords')"; //查询关键字
    protected $field        = "name"; //查询字段

    //自动验证
	protected $_validate = array(
    array('username', 'require', 'username cannot be empty', 0, 'regex', 1),
    //用户名不能为空
    array('username','','Account name already exists！',0,'unique',1),
    // 在新增的时候验证name字段是否唯一

    array('name', 'require', 'name cannot be empty', 0, 'regex', 1),
    //姓名不能为空
    array('name','','name already exists！',0,'unique',1),
    // 在新增的时候验证name字段是否唯一

    array('phonenumber','/^1[3|4|5|8][0-9]\d{4,8}$/','phonenumber is wrong','0','regex',3),
   
    // array('repassword','password','Incorrect password confirmation',0,'confirm'), 
    // 验证确认密码是否和密码一致
 
    array('email','email','email format is not correct',0,''), 
    // 验证邮箱格式是否正确
   );
}