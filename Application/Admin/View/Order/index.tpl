<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <form action="{:U('index?keywords=',I('get.'))}" method="get">
                        <div class="input-group custom-search-form">
                            <div class="form-group input-group">
                                <span class="input-group-addon">订单号</span>
                                <input class="form-control" name="keywords" type="text" value="{:I('get.keywords')}" placeholder="Search..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <i class="fa fa-search">
                                        </i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="box">
                <div class="box-body table-responsive">
                    <div class="panel-body alert alert-success">
                        系统将为您显示近90天的预订信息
                    </div>
                    <!-- /input-group -->
                    <!-- Table -->
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                            <?php $order = I('get.order') == "asc" ? "desc" : "asc"; ?>
                                <tr>
                                    <th>订单号</th>
                                    <th><a href='{:U("?order=$order&by=begin_time", I("get."))}'>入住日期</a></th>
                                    <th><a href='{:U("?order=$order&by=end_time", I("get."))}'>退房日期</a></th>
                                    <th>房型</th>
                                    <th>间数</th>
                                    <th>入住人</th>
                                    <th>联系方式</th>
                                    <th>订单状态</th>
                                </tr>
                        </thead>
                        <tbody>
                            <foreach name="M:orders" item="value" key="key">
                                <tr>
                                    <td><a href="{:U('detail?id=' . $value['id'], I('get.'))}">{$value['id']}</a></td>
                                    <td>{$value["begin_time"] | date="Y-m-d", ###}</td>
                                    <td class="text-right">{$value["end_time"] | date="Y-m-d", ### }</td>
                                    <td>{:$M->getRoomTitleById($value["room_id"])}</td>
                                    <td>{$value["count"]}</td>
                                    <td>{$value["customer_name"]}</td>
                                    <td>{$value["customer_phone"]}</td>
                                    <td>
                                        <eq name="value.is_cancel" value="1"><span class="text-danger">已取消</span>
                                            <else />
                                            <eq name="value.is_pay" value="1"><span class="badge">已支付</span>
                                                <else /><span class="text-warning">未支付</span></eq>
                                        </eq>
                                    </td>
                                </tr>
                            </foreach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <Html:page />
                </div>
            </div>
        </div>
    </div>
</block>
