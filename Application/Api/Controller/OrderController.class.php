<?php
/**
 * 订单
 */
namespace Api\Controller;

use Room\Logic\RoomLogic;
use Order\Logic\OrderLogic;

class OrderController extends ApiController
{
    public function addListAction()
    {
        $roomId         = I('get.room_id');         //房型ID
        $beginTime      = I('get.begin_time');      //入住时间
        $endTime        = I('get.end_time');        //离店时间
        $count          = (int)I('get.count');      //数量
        $customerName   = I('get.customer_name');   //用户姓名
        $customerPhone  = I('get.customer_phone');  //用户电话号
        $return         = array("status"=>"error"); //返回数组

        if (!validateDate($beginTime))
        {
            $return['message'] = "0.1:入住日期格式不正确";
            echo json_encode($return);
            return;
        }

        $time = strtotime(date("Y-m-d"));
        if ($time > strtotime($beginTime))
        {
            $return['message'] = "0.3:入住日期小于当前日期";
            echo json_encode($return);
            return;
        }

        if (!validateDate($endTime))
        {
            $return['message'] = "0.0:退房日期格式不正确";
            echo json_encode($return);
            return;
        }

        $RoomL = new RoomLogic();
        if (!$room = $RoomL->getListById($roomId))
        {
            $return['message'] = "1:当前选择的房型不存在或已取消";
            echo json_encode($return);
            return;
        }

        $rooms = $RoomL->getAllListsWithTimeRange($beginTime, $endTime);
        foreach($rooms as $key => $room)
        {
            if ($room['id'] == $roomId)
            {
                break;
            }
        }

        if ($room['id'] != $roomId)
        {
            $return['message'] = "2:当前选择的房型已取消";
            echo json_encode($return);
            return;
        }

        //如果没有传入数量，则将房数至为1
        $count = $count ? $count : 1;
        if ($room['remaining_count'] < $count)
        {
            $return['message'] = '3:房间当前剩余' . $room['remaining_count'] . '间。';
            echo json_encode($return);
            return;
        }

        $data                   = I('get.');
        $data['count']          = $count;
        $data['customer_id']    = (session("openId") === null) ? "" : session("openId");
        $data['price']          = $room['price'];
        $data['begin_time']     = strtotime($data['begin_time']);
        $data['end_time']       = strtotime($data['end_time']);
        $data['type']           = "online";

        $OrderL = new OrderLogic();
        if (!$orderId = $OrderL->saveList($data))
        {
            $return['message'] = '4:数据保存错误：' . $OrderL->getError() . $OrderL->getLastSql();
            echo json_encode($return);
            return;
        }

        $return['status'] = "success";
        $return['order_id'] = $orderId;
        echo json_encode($return);
    }

    public function getRecentListsBySessionOpenIdAction()
    {
        $OrderL = new OrderLogic();
        $orders = $OrderL->getListsByCustomerId(session("openId"));
        foreach ($orders as $key => $value)
        {
            $orders["$key"]['begin_time_str'] = date("Y-m-d",$value["begin_time"]);
            $orders["$key"]['end_time_str'] = date("Y-m-d",$value["end_time"]);
        }
        $return = array("status"=>"success");
        $return['data'] = $orders;
        echo json_encode($return) ;
    }
}