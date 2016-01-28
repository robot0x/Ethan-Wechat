<?php
/**
 * 订单
 */
namespace Api\Controller;

class OrderController extends ApiController
{
    public function addListAction()
    {
        $return = array();
        $return['statue'] = "success";
        $return['order_id'] = "1";
        echo json_encode($return);
    }
}