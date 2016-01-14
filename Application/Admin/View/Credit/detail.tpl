<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-md-12">
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
                                <th>用户</th>
                                <th>每次积分</th>
                                <th>总积分</th>
                                <th>时间</th>
                                <th>说明</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <foreach name="detail" item="value" key="key">
                                <tr>
                                    <td>{$key+1}</td>
                                    <td>{$value["nickname"]}</td>
                                    <td>{$value["credit_section"]}</td> 
                                    <td>{$value["total"]}</td>
                                    <td>{$value["date"]}</td>
                                    <td>{$value["describe"]}</td>
                                    <td>
                                        <a class="btn btn-sm btn-primary" href="{:U('edit?id=' . $value['customer_id'], I('get.'))}"><i class="fa fa-pencil"></i>&nbsp;修改积分</a>                          
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
