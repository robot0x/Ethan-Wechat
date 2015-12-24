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
        // dump($config);
        //sq语句
        // echo $SlideShowL->getLastSql();
        $this->assign('config',$config);
        $this->display();
    }
    public function addAction()
    {
        $this->display();
    }
    public function editAction()
    {
        //取用户ID
        $configId=I('get.id');
        // dump($configId);
        //取用户信息
        $ConfigL = new ConfigLogic();
        $config = $ConfigL->getListById($configId);
        // dump($config);
        //传值
        $this->assign('config',$config);

        //显示页面
        $this->display('add');
    }
}
