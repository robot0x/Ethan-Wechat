<?php
namespace Admin\Controller;

use User\Logic\UserLogic;

class UserController extends AdminController
{
    //用户列表显示
    public function indexAction()
    {
        //获取用户列表
        $UserL = new UserLogic();
        $users = $UserL -> getLists();
        //echo $UserL->getLastSql();
        //dump($users);

        //获取搜索结果
        $search = $UserL -> getSearchLists();

        //传入列表
        $this->assign('users',$users);

        //传入搜索结果
        $this->assign('search',$search);

        //调用V层
        $this->display();

    }

    public function detailAction()
    {
        //获取用户Id
        $userId = I('get.id');
        //取用户信息getListById()
        $UserL = new UserLogic;
        $user = $UserL -> getListbyId($userId);

        //传值
        $this -> assign('user',$user);
        //显示
        $this -> display();
    }

    public function addAction()
    {
        //显示display()
        $this -> display();
    }

    public function saveAction()
    {
        //取用户信息
        $user =I('post.');
        //添加add()
        $UserL = new UserLogic();
        $UserL->addList($user);

        //echo $this->getlastsql();

        //判断异常
        if(count($errors = $UserL->getErrors())!==0)
        {
            //dump($errors);
            //exit();
            //数组变字符串
            $error = implode('<br/>',$errors);

            //显示错误
            $this->error("添加失败，原因：".$error,U('Admin/User/index?p ='.I('get.p')));
        }
        else
        {
            $this->success("操作成功",U('Admin/User/index?p ='.I('get.p')));
        }
    }

    public function editAction()
    {
        //获取用户Id
        $userId = I('get.id');
        //取用户信息getListById()
        $UserL = new UserLogic;
        $user = $UserL -> getListbyId($userId);

        //传值给前台
        $this -> assign('user',$user);
        //显示display('add')
        $this -> display('add');
    }

    public function updateAction()
    {
        //取用户信息
        $data = I('post.');
        //保存修改save()
        $UserL = new UserLogic();
        $UserL->saveList($data);

        //判断异常
        if(count($errors = $UserL->getErrors())!==0)
        {
            //数组变字符串
            $error = implode('<br/>',$errors);

            //显示错误
            $this->error("添加失败，原因：".$error,U('Admin/User/index?p='.I('get.p')));
        }
        else
        {
            //保存成功success()
            $this->success("操作成功",U('Admin/User/index?p='.I('get.p')));
        }
    }

    public function deleteAction()
    {
        //取id
        $userId= I('get.id');
        //删除deleteInfo($Id)
        $UserL = new UserLogic();
        $status = $UserL->deleteInfo($userId);
        //判断是否删除成功
        if($status!==false)
        {
            $this->success("删除成功",U('Admin/User/index?p='.I('get.p')));
        }
        else
        {
            $this->error("删除失败",U('Admin/User/index?p='.I('get.p')));
        }
    }

}

