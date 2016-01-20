<?php 
/**
 *用户积分管理模块
 * J
 *data：10:00 2016/1/12
 */
namespace Admin\Controller;

use Credit\Logic\CreditLogic;


class CreditController extends AdminController
{

/**
*积分管理首页
*/
	public function indexAction(){

		//获取列表
		$CreditL = new CreditLogic(); 
		$credit = $CreditL->getFirstLists();
		$this->assign('credit',$credit);
        $this->display();
	}
/**
 * 查看用户具体积分信息
 */
	public function detailAction(){
		
		$id =I('get.id');
		$CreditL = new CreditLogic(); 
		$detail = $CreditL ->getListbyCustomerId($id);
		$this ->assign('detail',$detail);
		$this ->display();
	}

	public function editAction(){
		
		if($id = I('get.id'))
		
        {
            $CreditL = new CreditLogic();
            if(!$Credit = $CreditL->getElembyId($id))
            {
                $this->error("Sorry, the record not exist or deleted." , U('index?id=', I('get.')));
                return;
            }
            //传给前台
            $this->assign('credit',$Credit);
        }
        $this->display(); 
        

	}

	public function saveAction()
	{
		 //取用户信息
        $credit = I('post.');

        $CreditL = new CreditLogic();
        $CreditL->saveList($credit);

        //判断异常
        if(count($errors = $CreditL->getErrors()) !== 0)
        {
            //数组变字符串
            $error = implode('<br/>', $errors);
            //显示错误
            $this->error("添加失败，原因：". $error, U('index?id=',I('get.')));
            return;
        }

        $this->success("操作成功" , U('index?id=',I('get.')));    
	 }
	

}
 ?>