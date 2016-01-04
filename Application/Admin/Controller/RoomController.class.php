<?php
/**
 *幻灯片后台管理模块
 * 完成人：魏静云
 */
namespace Admin\Controller;

use Room\Logic\RoomLogic;//Room
  
class RoomController extends AdminController

{
	public function indexAction(){

		//获取列表
        $RoomL = new RoomLogic();
        $rooms = $RoomL->getLists();

		$this->assign('rooms',$rooms);
        $this->display();
    }

    /**
     * 处理用户添加信息
     * @return string 
     */
    public function saveAction(){

        //取用户信息
        $room = I('post.');

        $RoomL = new RoomLogic();
        $RoomL->saveList($room);

        //判断异常
        if(count($errors = $RoomL->getErrors()) !== 0)
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
        
        if($id = (int)I('get.id'))
        {
            $RoomL = new RoomLogic();
            if(!$room = $RoomL->getListbyId($id))
            {
                $this->error("Sorry, the record not exist or deleted." , U('index?id=', I('get.')));
                return;
            }

            //传给前台
            $this->assign('room',$room);
        }

        $this->display(); 
    }

    public function deleteAction(){

        $id = I('get.id');

        $RoomL = new RoomLogic();
        $status = $RoomL->deleteList($id);

        if($status！==false){
           $this->success("删除成功", U('index?id=', I('get.'))); 
           return;
        }
        else{
            $this->error("删除失败" , U('index?id=', I('get.')));
            return;
        }
    }

    /**
     * 获取剩余房间
     * @return [type] [description]
     */
    public function getRemainderRoomsAjaxAction()
    {
        $RoomL = new RoomLogic();
        $lists = $RoomL->getAllLists();
        $i = 1;
        foreach($lists as $key => $list)
        {
            $lists["$key"]["count"] = $i++;
        }

        $datas = array("status"=>"success");
        $datas["lists"] = $lists;
        $this->ajaxReturn($datas);
    }

}