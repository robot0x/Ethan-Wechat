<?php
/**
 * 前台微信支付模块
 * denghaoyang
 */
namespace Trade\Model;

use Yunzhi\Model\YunzhiModel;
use Order\Logic\OrderLogic;         //订单

class TradeModel extends YunzhiModel
{
    public function getListByOutTradeId($outTradeId)
    {
        $map['out_trade_id'] = $outTradeId;
        return $this->where($map)->find();
    }

    public function saveList($data)
    {
        if(array_key_exists("return_code", $data)
            && array_key_exists("result_code", $data)
            && $data["return_code"] == "SUCCESS"
            && $data["result_code"] == "SUCCESS")
        {
            $OrderL = new OrderLogic();
            $OrderL->setIsPayById($data['order_id']);
        }
        parent::saveList($data);
        return ;
    }
}