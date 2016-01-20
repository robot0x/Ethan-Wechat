<extend name="Base:index" />
<block name="body">
<div class="row-fluid">
        <div class="col-xs-12">
            <div class="box">
                <div class="row">
                    <div class="col-xs-2">
                    <a class="btn btn-info"  href="{:U('add')}" ><i class="glyphicon glyphicon-plus"></i>添加自定义菜单</a>
                    </div>
                    <div class="col-xs-2">
                    	<a class="btn btn-info"  href="{:U('createMenu')}" ><i class="fa fa-refresh"></i>生成菜单至公众账号
		</a>
                    </div>
                </div>
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
			<th>上级菜单</th>
			<th>关键字</th>
			<th>类型</th>
			<th>内容</th>
			<th>操作</th>
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
				<td><a class="btn btn-sm btn-primary" href="{:U('edit?id='.$menu['id'])}"><i class="fa fa-pencil"></i>编辑</a>
				<a class="btn btn-sm btn-danger" href="{:U('delete?id='.$menu['id'])}"><i class="fa fa-trash-o"></i> 删除</a></td>
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
