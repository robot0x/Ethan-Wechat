<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3">
                    <form action="{:U('index?keywords=')}" method="get">
                        <div class="input-group custom-search-form">
                            <input class="form-control" name="keywords" placeholder="Search..." type="text" value="{:I('get.keywords')}" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
                <div class="col-md-3">
                    <a href="{:U('edit?id=', I('get.'))}" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i> 添加房型</a>
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
                                <th>总间数</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <foreach name="rooms" item="value" key="key">
                                <tr>
                                    <td>{$key+1}</td>
                                    <td>{$value["title"]}</td>
                                    <td class="text-right">{$value["price"] | format_money}</td>
                                    <td>{$value["description"]}</td>
                                    <td>{$value["total_rooms"]}</td>
                                    <td>
                                        <a class="btn btn-sm btn-primary" href="{:U('edit?id=' . $value['id'], I('get.'))}"><i class="fa fa-pencil"></i>&nbsp;编辑</a>
                                        <a class="btn btn-sm btn-danger delete" href="{:U('delete?id=' . $value['id'], I('get.'))}"><i class="fa fa-trash-o "></i>&nbsp;删除</a>
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
