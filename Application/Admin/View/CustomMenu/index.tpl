<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-xs-12">
            <div class="row">
	            <div class="col-md-3">
                    <a class="button btn btn-info"  href="{:U('add')}" ><i class="glyphicon glyphicon-plus"></i>添加自定义菜单</a>
                </div>
                <div class="col-md-3">
                    <a class="button btn btn-info"  href="{:U('createMenu')}" ><i class="glyphicon glyphicon-plus"></i>生成菜单至公众账号</a>
                </div>
            </div>
            <div class="box">
                <div class="box-body table-responsive">
                    <div class="panel-body">
                    </div>

	                <table class = "table table-bordered table-striped table-hover">
	                    <thead>
		                    <tr>
			                    <th>序号</th>
			                    <th>标题</th>
			                    <th>上级菜单</th>
			                    <th>关键字</th>
			                    <th>类型</th>
			                    <th>回复的文章内容</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <foreach name="M:getMenus()" item="menu" key="k">
			                    <tr>
				                    <td>{++$k}</td>
				                    <td>{$menu['name']}</td>
				                    <td>{$menu['pid']}</td>
				                    <td>{$menu['keyword']}</td>
				                    <td>{$menu['type']}</td>
				                    <td>{$menu['content']}</td>
				                    <td><a class="btn btn-sm btn-primary" href="{:U('edit?id='.$menu['id'])}"><i class="fa fa-pencil"></i>&nbsp;编辑</a>
				                    <a class="btn btn-sm btn-danger" href="{:U('delete?id='.$menu['id'])}"><i class="fa fa-trash-o "></i>&nbsp;删除</a></td>
			                    </tr>
		                    </foreach>
		                </tbody>	
	                </table>
	            </div>
	            {$page}
	        </div>
	    </div>
    </div>

</block>