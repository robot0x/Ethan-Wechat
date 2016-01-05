<?php
/**
 * 现场出房
 */
namespace Admin\Controller;

use Sale\Logic\SaleLogic;       //出房
use Admin\Model\Sale\EditModel; //
  
class SaleController extends AdminController
{
	public function indexAction(){

		//获取指定日期内的房型列表
        $SaleL = new SaleLogic();
        $sales = $SaleL->getReminingListsInRange(I('get.begin_time'), I('get.end_time'));

		$this->assign('sales',$sales);
        $this->display();
    }


    /**
     * 获取房型剩余可售卖的信息
     * @return ajaxReturn 
     */
    public function getRemainingRoomsAjaxAction()
    {
        //实例化，获取指定日期内的房型信息
        $SaleL = new SaleLogic();
        $sales = $SaleL->getReminingListsInRange(I('post.begin_time'), I('post.end_time'));

        //去除数量为0的房间
        $sales = $SaleL->removeZeroRooms($sales);
        
        //组装返回状态码
        $data = array("status"=>"success");
        $data['data'] = $sales;

        $this->ajaxReturn($data);
    }
    /**
     * 保存信息
     * @return 
     */
    public function saveAction(){

        //取传入信息并格式化json类型
        $sale = remove_json_formart(I('post.'));
        
        //实例化：
        //判断传入的日期、房型、间数是否可用
        //存定单信息
        //存支付信息
        $SaleL = new SaleLogic();
        if (count($SaleL->checkAvailabe($sale)->addOrder($sale)->addPay($sale)->getErrors()) > 0)
        {
            $errors = explode(",", $SaleL->getErrors());
            $this->error("系统错误：SaleController:$errors", U("index?id=",I("get.")));
        }

        $this->success("操作成功" , U('index?id=',I('get.')));
    }

    /**
     * 编辑
     * @return [type] [description]
     */
    public function editAction(){
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