<?php
/**
 *幻灯片后台管理模块
 * 完成人：魏静云
 */
namespace Admin\Controller;

use Sale\Logic\SaleLogic;   //Sale
use Admin\Model\Sale\EditModel; //
  
class SaleController extends AdminController

{
	public function indexAction(){

		//获取列表
        $SaleL = new SaleLogic();
        $sales = $SaleL->getLists();

		$this->assign('sales',$sales);
        $this->display();
    }

    /**
     * 处理用户添加信息
     * @return string 
     */
    public function saveAction(){

        //取用户信息
        $sale = I('post.');

        $SaleL = new SaleLogic();
        $SaleL->saveList($sale);

        //判断异常
        if(count($errors = $SaleL->getErrors()) !== 0)
        {
            //数组变字符串
            $error = implode('<br/>', $errors);
            //显示错误
            $this->error("添加失败，原因：". $error, U('index?id=',I('get.')));
            return;
        }

        $this->success("操作成功" , U('index?id=',I('get.')));    
    }

    /**
     * 编辑
     * @return [type] [description]
     */
    public function editAction(){
        C("TMPL_L_DELIM", '<{');
        C("TMPL_R_DELIM", '}>');
        $M = New EditModel();
        $this->assign("M", $M);
        $this->display(); 
    }

    public function deleteAction(){

        $id = I('get.id');

        $SaleL = new SaleLogic();
        $status = $SaleL->deleteList($id);

        if($status！==false){
           $this->success("删除成功", U('index?id=', I('get.'))); 
           return;
        }
        else{
            $this->error("删除失败" , U('index?id=', I('get.')));
            return;
        }
    }

}