<?php
namespace Admin\Controller;

use Introduction\Logic\IntroductionLogic;//Introduction
  
class IntroductionController extends AdminController

{
    public function editAction(){
        
        //实例化
        $IntroductionL = new IntroductionLogic();
        $introduction = $IntroductionL->getList();

        //传值
        $this->assign('introduction',$introduction);
        
        //显示 
        $this->display('edit'); 
    }


    /**
     * 数据保存
     * @return  跳转至editAction
     */
    public function saveAction(){
        
        //更新数据
        $IntroductionL = new IntroductionLogic();
        $IntroductionL->saveList(I('post.'));

        //判断异常
        if(count($errors=$IntroductionL->getErrors())!==0)
        {
            //数组变字符串
            $error =implode('<br/>', $errors);
            
            
            //显示错误
             $this->error("添加失败，原因：".$error,U('edit'));
            
        }
        $this->success("操作成功" , U('edit'));    
    }

}