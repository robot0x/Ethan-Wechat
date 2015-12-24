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
                    <a href="{$url}" class="btn btn-info">添加一级菜单</a>
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
                                <th>标题</th>
                                <th>副标题</th>
                                <th>URL</th>
                                <th>开发者模式</th>
                                <th>排序</th>
                                <th>隐藏</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <foreach name="data" item="value" key="key">
                                <tr>
                                    <td>{$key+1}</td>
                                    <td>
                                        <php>
                                            for( $level = 0; $level
                                            < $value[ '_level']; $level++) echo "|----"; </php>
                                                {$value.title}
                                    </td>
                                    <td>{$value.subhead}</td>
                                    <td>{$value.url}{$value.parameter}</td>
                                    <td>
                                        <eq name="value.development" value="0">否
                                            <else /><span class="badge">是</span></eq>
                                    </td>
                                    <td>{$value.order}</td>
                                    <td>
                                        <eq name="value.show" value="1">否
                                            <else /><span class="badge">是</span></eq>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-success" onclick="location='{$value._url.add}'"><i class="glyphicon glyphicon-plus"></i>添加子菜单</button>
                                        <button class="btn btn-sm btn-primary" onclick="location='{$value._url.edit}'"><i class="fa fa-pencil"></i>编辑</button>
                                        <button class="btn btn-sm btn-danger" onclick="location='{$value._url.delete}'"><i class="fa fa-trash-o "></i>删除</button>
                                    </td>
                                </tr>
                            </foreach>
                        </tbody>
                    </table>
                </div>
                <nav>
                    <Yunzhi:page totalcount="totalCount" />
                </nav>
            </div>
        </div>
    </div>
</block>
