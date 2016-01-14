<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <form action="{:U('index?keywords=')}" method="get">
                            <div class="input-group custom-search-form">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">入住日期</span>
                                    <input class="form-control date" name="begin_time" type="date" value="{:I('get.begin_time') ? I('get.begin_time') : date('Y-m-d')}">
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon">退房日期</span>
                                    <input class="form-control date" name="end_time" value="{:I('get.end_time') ? I('get.end_time') : date('Y-m-d', time()+24*60*60)}" type="date">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-info"> <i class="fa fa-search"></i>&nbsp;查询</button>
                        </form>
                    </div>
                </div>
                <div class="box">
                    <div class="box-body table-responsive">
                        <div class="panel-body">
                        </div>
                        <!-- /input-group -->
                        <!-- Table -->
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>房型</th>
                                    <th>单价</th>
                                    <th>描述</th>
                                    <th>剩余间数</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <foreach name="sales" item="value" key="key">
                                    <tr>
                                        <td>{$key+1}</td>
                                        <td>{$value["title"]}</td>
                                        <td class="text-right">{$value["price"] | format_money}</td>
                                        <td>{$value["description"]}</td>
                                        <td><eq name="value.remaining" value="0"><span class="badge">{$value["remaining"]}</span><else />{$value["remaining"]}</eq></td>
                                        <td>
                                            <neq name="value.remaining" value="0"><a class="btn btn-sm btn-primary" href="{:U('edit?id=' . $value['id'], I('get.'))}"><i class="fa fa-external-link "></i>&nbsp;出房</a></neq>
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
