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
                    <a href="{:U('add')}" class="btn btn-info">添加</a>
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
                                <th>配置ID</th>
                                <th>配置名称</th>
                                <th>配置类型</th>
                                <th>配置说明</th>
                                <th>创建时间</th>
                                <th>更新时间</th>
                                <th>状态</th>
                                <th>配置值</th>
                                <?php $order = I('get.order') ?>
                                <th><a href="<eq name='order' value="desc"> {:U('index?by=sort&order=asc', I('get.'))}
                                <else/> {:U('index?by=sort&order=desc', I('get.'))} </eq>">排序</a></th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <foreach name="config" item="conf" key="k">
                                <tr>
                                    <td>{$k+1}</td>
                                    <td>{$conf['id']}</td>
                                    <td>{$conf['name']}</td>
                                    <td>{$conf['type']}</td>
                                    <td>{$conf['remark']}</td>
                                    <td>{$conf['create_time']}</td>
                                    <td>{$conf['update_time']}</td>
                                    <td>{$conf['status']}</td>
                                    <td>{$conf['value']}</td>
                                    <td>{$conf['sort']}</td>
                                    <td>
                                    <a class="btn btn-sm btn-primary" href="{:U('edit?id='.$conf['id'],I('get.'))}"><i class="fa fa-pencil"></i>编辑</a>
                                    <a class="btn btn-sm btn-danger" href="{:U('delete?id='.$conf['id'],I('get.'))}"><i class="fa fa-trash-o "></i>删除</a>
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

