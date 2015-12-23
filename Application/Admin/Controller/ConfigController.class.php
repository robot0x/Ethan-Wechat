<?php
namespace Admin\Controller;

use Think\Controller;
use Config\Model\ConfigModel;
use Config\Logic\ConfigLogic;
/**
*
*/
class ConfigController extends Controller
{

    public function indexAction()
    {
        //获取列表
        $ConfigL = new ConfigLogic;
        $config = $ConfigL->getLists();
        //sq语句
        // echo $SlideShowL->getLastSql();
        $this->assign('config',$config);
        $this->display();
    }
}
