<?php
namespace Admin\Controller;

use Introduction\Logic\IntroductionLogic;//Introduction
  
class IntroductionController extends AdminController

{
        public function editAction(){
        //获取用户ID
        $introductionId = I('get.id');
        //dump($introductionId);
        //取用户信息 getListById()
 
        $IntroductionL = new IntroductionLogic();
        $introduction = $IntroductionL->getList();
        //dump($introduction);
        //传给前台
        $this->assign('introduction',$introduction);
        
        $this->display('edit'); 
    }

    public function saveAction(){
        //取用户信息
        $introduction = I('post.');

        //添加 add()
        $IntroductionL = new IntroductionLogic();
        $IntroductionL->addList($introduction);

        //判断异常
        if(count($errors=$IntroductionL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            
            
            //显示错误
             $this->error("添加失败，原因：".$error,U('Introduction/Index/index?p='.I('get.p')));
            
        }
        $this->success("操作成功" , U('Introduction/Index/index?p='.I('get.p')));    
    }
    public function updateAction(){
        //取用户信息
        $data = I('post.');

        //传给M层
        $IntroductionL = new IntroductionLogic();
        $IntroductionL->saveList($data);

        //判断异常
        if(count($errors=$IntroductionL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            
            
            //显示错误
             $this->error("添加失败，原因：".$error,U('Introduction/Index/index?p='.I('get.p')));

             return false;
            
        }
            $this->success("操作成功" , U('Introduction/Index/index?p='.I('get.p')));
    }
    public function indexAction(){
        //取用户ID

        //抓取用户信息
        $IntroductionL = new IntroductionLogic();
        $introduction = $IntroductionL->getList();
        //传值
        $this->assign('introduction',$introduction);
        dump($introduction);
        $this->display();
    }

}