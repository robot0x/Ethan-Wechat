<extend name="Base:index" />
<block name="body">
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    修改个人积分
                </div>
                <div class="panel-body">
                    <form role="form" action="{:U('save',I('get.'))}" method="post">
                        <input type="hidden" name="id" value="{$room['id']}" />
                        <div class="row">
                            <div class="col-xs-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label>用户名</label>
                                  <!--   <input class="form-control" id="title" name="title" type="text" value="{$credit['nickname']}" /> -->
                                    <label>{$credit['nickname']}</label>
                                </div>
                                <div class="form-group">
                                    <label>总积分</label>
                                    <input class="form-control" id="price" name="price" type="money" value="{$credit['total']}" />
                                </div>
                                <div class="form-group">
                                    <label>描述</label>
                                    <textarea class="form-control" id="description" name="description">{$credit['describe']}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-center">
                            {__TOKEN__}
                                <button type="submit" class="btn btn-success "><i class="fa fa-check"></i> 确认</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {$js}
</block>
