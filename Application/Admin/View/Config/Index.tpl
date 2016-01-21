<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-xs-3">
                    <form action="{:U('index?p=',I('get.'))}" method="get">
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
                <div class="col-xs-3">
                    <a href="{:U('add')}" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i> 添加</a>
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
                                <th>配置名称</th>
                                <th>配置说明</th>
                                <th>状态</th>
                                <th>配置值</th>
                                <?php $order = I('get.order') ?>
                                <th><a href="<eq name='order' value="desc"> {:U('index?by=sort&order=asc', I('get.'))}
                                <else/> {:U('index?by=sort&order=desc', I('get.'))} </eq>">排序</a></th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <foreach name="M:getConfig()" item="config" key="k">
                                <tr>
                                    <td>{$k+1}</td>
                                    <td>{$config['name']}</td>
                                    <td>{$config['remark']}</td>
                                    <td><eq name="config.status" value="0">正常<else/><span class="badge">冻结</span></eq></td>
                                    <td>{$config['value']}</td>
                                    <td>{$config['sort']}</td>
                                    <td>
                                    <a class="btn btn-sm btn-primary" href="{:U('edit?id='.$config['id'],I('get.'))}"><i class="fa fa-pencil"></i>编辑</a>
                                    <a href="{:U('freezen?id='.$config['id'],I('get.'))}" class="btn btn-sm <eq name="config.status" value="0">btn-default"><i class="fa fa-lock"></i>冻结<else/>btn-warning"><i class="fa fa-unlock"></i>解冻</eq></a>
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

