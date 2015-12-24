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
    public function saveAction()
    {
        //取用户信息
        $config = I('post.');
       //dump(I('get.'));
        //添加 add()
        $ConfigL = new ConfigLogic();
        $ConfigL->addList($config);

        //判断异常
        if(count($errors=$ConfigL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            //显示错误
            $this->error("添加失败，原因：".$error,U('Config/Index/index?id=',I('get.p')));

        }
        $this->success("操作成功" , U('Config/Index/index?id=',I('get.p')));
    }
    public function updateAction(){
        //取用户信息
        $data = I('post.');
        // dump(I('get.'));
        $ConfigL = new ConfigLogic();
        $ConfigL->saveList($data);

        //判断异常
        if(count($errors=$ConfigL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            //显示错误
            $this->error("添加失败，原因：".$error,U('Config/Index/index',I('get.')));

             return false;

        }
            $this->success("操作成功" , U('Config/Index/index',I('get.')));
    }
}
