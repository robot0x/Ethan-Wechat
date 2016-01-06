<extend name="Base:index" />
<block name="body">
    <div class="row" ng-app="order" ng-controller="detail">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    订单详情
                </div>
                <div class="panel-body">
                    <php> $value = $M->order; </php>
                    <form ng-submit="processForm()" role="form" action="{:U('save',I('get.'))}" method="post">
                        <div class="col-xs-12">
                            <p>
                                <label>订单编号:</label>&nbsp;&nbsp;{$value["id"]}</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>入住日期:</label>&nbsp;&nbsp;{$value["begin_time"] | date="Y-m-d", ###}</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>退房日期:</label>&nbsp;&nbsp;{$value["end_time"] | date="Y-m-d", ###}</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>房　　型:</label>&nbsp;&nbsp;{$value["room_id"]}</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>单　　价:</label>&nbsp;&nbsp;{$value["price"] | format_money}元</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>间　　数:</label>&nbsp;&nbsp;{$value["count"]}</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>总　　价:</label>&nbsp;&nbsp;{$value["price"]*$value["count"] | format_money}元</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>入住人　:</label>&nbsp;&nbsp;{$value["customer_name"]}</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>联系方式:</label>&nbsp;&nbsp;{$value["customer_phone"]}</p>
                        </div>
                        <div class="col-xs-12">
                            <p>
                                <label>预订类型:</label>&nbsp;&nbsp;
                                <eq name="value.type" value="offline"><span class="badge">{$value["type"]}</span>
                                    <else />{$value["type"]}</eq>
                            </p>
                        </div>
                        <eq name="value['type']" value="offline">
                            <div class="col-xs-12">
                                <p>
                                    <label>操作人　:</label>&nbsp;&nbsp;{$value["user_id"]}</p>
                                <p>
                                    <label>操作时间:</label>&nbsp;&nbsp;{$value["order_time"] | date="Y-m-d", ###}</p>
                            </div>
                            <else />
                            <div class="col-xs-12">
                                <p>
                                    <label>支付编号:</label>&nbsp;&nbsp;{$value["pay_id"]}</p>
                                <p>
                                    <label>用户id　:</label>&nbsp;&nbsp;{$value["customer_id"]}</p>
                                <p>
                                    <label>昵　　称:</label>&nbsp;&nbsp;{$value["customer_id"]}</p>
                                <p>
                                    <label>下单时间:</label>&nbsp;&nbsp;{$value["order_time"] | date="Y-m-d", ###}</p>
                                <p>
                                    <label>支付时间:</label>&nbsp;&nbsp;{$value["pay_time"] | date="Y-m-d", ###}</p>
                            </div>
                        </eq>
                        <div class="col-xs-12">
                            <p>
                                <label>订单状态:</label>&nbsp;&nbsp;
                                <eq name="value.is_cancel" value="1"><span class="text-danger">已取消</span>
                                    <else />
                                    <eq name="value.is_pay" value="1"><span class="text-success">已支付</span>
                                        <else /><span class="text-warning">未支付</span></eq>
                                </eq>
                            </p>
                        </div>
                        <div class="col-xs-12 text-center">
                            {__TOKEN__}
                            <a href="" class="btn btn-success"><i class="fa fa-check"></i>&nbsp;返回</a>&nbsp;&nbsp;<button ng-show="showSubmit" type="submit" class="btn btn-success none"><i class="fa fa-check"></i>&nbsp;确认</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</block>
