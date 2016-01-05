<extend name="Base:index" />
<block name="body">
        <div class="row-fluid">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body table-responsive">
                        <div class="panel-body">
                            <a class="button btn btn-info"  href="{:U('add')}" >添加</a>
                        </div>
                    <form action="{:U('index?p=', I('get.'))}" method="get">
                    </form>
                        <!-- Table -->
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>电话</th>
                                    <th>描述</th>
                                    <th>缩略图</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>     
                                    <foreach name="introductions" item="introduction" key="k">
                                <tr>
                                    <td>{$k+1}</td>
                                    <td>{$introduction['hotel_phone']}</td>
                                    <td>{$introduction['description']}</td>
                                    <td><img class="suoluetu" src="{$introduction['url']}" /></td>
                                    <td>
                                    <a class="btn btn-sm btn-success" href="{:U('edit?id='.$introduction['id'].'&p='.I('get.p'))}">编辑</a>
                                    <a class="btn btn-sm btn-success" href="{:U('delete?id='.$introduction['id'].'&p='.I('get.p'))}">删除</a></td>
                                </tr>
                                    </foreach>  
                            </tbody>
                            </table>

                    </div>
                    <nav>
                        <Yunzhi:page />
    
                    </nav>
                </div>
            </div>
        </div>
    <style type="text/css">
    .suoluetu{
        height: 50px;
    }

</block>
