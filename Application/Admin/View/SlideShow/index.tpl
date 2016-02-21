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
                    <a href="{:U('edit?id=', I('get.'))}" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i> 添加</a>
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
            <?php $order = I('get.order') ?>
            <th><a href="<eq name='order' value="desc"> {:U('index?by=title&order=asc', I('get.'))}  
            <else/> {:U('index?by=title&order=desc', I('get.'))} </eq>">标题</a></th> 
            <th>缩略图</th>
            <th><a href="<eq name='order' value="desc"> {:U('index?by=weight&order=asc', I('get.'))}  
            <else/> {:U('index?by=weight&order=desc', I('get.'))} </eq>">权重</a></th>    
            <th>状态</th>
            <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                               <foreach name="slideshows" item="slideshow" key="k">
            <tr>
                <td>{$k+1}</td>
                <td>{$slideshow[title]}</td>
                <td><img class="img-responsive" src="{$slideshow[url]}" /></td>
                <td>{$slideshow[weight]}</td>
                <td><eq name="slideshow.status" value="0">正常<else/><span class="badge">冻结</span></eq></td>
                <td>
                <a class="btn btn-sm btn-primary" href="{:U('edit?id='.$slideshow['id'].'&p='.I('get.p'))}">
                <i class="fa fa-pencil"></i>
                编辑</a>
                <a class="delete btn btn-sm btn-danger" href="{:U('delete?id='.$slideshow['id'].'&p='.I('get.p'))}">
                <i class="fa fa-trash-o "></i>
                删除</a></td>
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







