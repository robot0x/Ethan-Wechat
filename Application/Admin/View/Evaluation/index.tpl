<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body table-responsive">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-6 col-md-4">
                                <form action="{:U('index?keywords=')}" method="get">
                                    <div class="input-group custom-search-form">
                                        <input class="form-control" name="keywords" placeholder="请输入客户昵称" type="text" value="{:I('get.keywords')}" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                            <div class="col-xs-6 col-md-4">
                                <button  > </button>
                                <a title="昵称" class="btn btn-info" data-original-title="" href="javascript:void(0);" data-trigger="focus" data-container="body" data-toggle="popover" data-title="昵称" data-placement="right" data-content="请先使用微信端选择房型，进入支付页面后，取消支付。然后，进入后台，在订单管理中，选择线下支付。线下支付完成后，再取消订单。此时，用户虽然未入住，但仍然可以评论。"><i class="fa fa-question-circle"></i>&nbsp;如何手动添加评价</a>
                            </div>
                        </div>
                    </div>
                    <!-- /input-group -->
                    <table class="table table-bordered table-striped table-hover">
                        <php>$order = I('get.order') === "asc" ? "desc" : "asc";</php>
                        <tr>
                            <th>序号</th>
                            <th><a href="{:U('?by=customer-nickname&order=' . $order, I('get.'))}">客户昵称</a></th>
                            <th>评价内容</th>
                            <th><a href="{:U('?by=star_level&order=' . $order, I('get.'))}">评价星级</a></th>
                            <th>入住房型</th>
                            <th><a href="{:U('?by=order-begin_time&order=' . $order, I('get.'))}">入住时间</a></th>
                            <th><a href="{:U('?by=update_time&order=' . $order, I('get.'))}">评价时间</a></th>
                            <th>操作</th>
                        </tr>
                        <php>$i = 1;</php>
                        <foreach name="lists" item="list">
                            <tr>
                                <td>{$i++}</td>
                                <td><a title="昵称" data-original-title="" href="javascript:void(0);" data-trigger="focus" data-container="body" data-toggle="popover" data-title="昵称" data-placement="right" data-content="{$list['customer__nickname']}">{$list['customer__nickname'] | msubstr=###, 0, 3}</a></td>
                                <td><a title="评价内容" data-original-title="" href="javascript:void(0);" data-trigger="focus" data-container="body" data-toggle="popover" data-title="评价详情" data-placement="right" data-content="{$list['evaluation']}">{$list['evaluation'] | msubstr=###, 0, 10}</a></td>
                                <td>{$list['star_level']}</td>
                                <td>{$list['room__title']}</td>
                                <td>{$list['order__begin_time'] | date="Y-m-d" , ###}</td>
                                <td>{$list['update_time'] | date="Y-m-d" , ###}</td>
                                <td>
                                <eq name="list['status']" value="0">
                                    <a href="{:U('freeze?id=' . $list['id'], I('get.'))}" class="btn btn-sm btn-success"><i class="fa fa-lock"></i>
                                        &nbsp;冻结
                                    </a>
                                <else />
                                    <a href="{:U('freeze?id=' . $list['id'], I('get.'))}" class="btn btn-sm btn-warning"><i class="fa fa-unlock"></i>
                                        解冻
                                    </a>
                                </eq>
                                    </a><a href="{:U('edit?id=' . $list['id'] , I('get.'))}" class="btn btn-sm btn-info"><i class="fa fa-pencil"></i>&nbsp;编辑</a></td>
                            </tr>
                        </foreach>
                    </table>
                </div>
                <div class="row">
                    <html:page />
                </div>
            </div>
        </div>
    </div>
    <include file="index.js" />
</block>
