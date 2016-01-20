<extend name="Base:index" />
<block name="body">
<div class="row-fluid">
        <div class="col-xs-12">
            <div class="box">
                <div class="row">
                    <div class="col-xs-12">
                        <a class="btn btn-info"  href="{:U('synchro')}" >
                        <i class="fa fa-refresh">同步服务器的客户信息</i>
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
				<th>用户编号</th>
				<th>昵称</th>
				<th>用户语言</th>
				<th>所在城市</th>
				<th>所在省份</th>
				<th>所在国家</th>
				<th>注册时间</th>
				<th>操作</th>
			</tr>
            </thead>
            <tbody>
			<foreach name="M:getlists()" item="list" key="k">
			<tr>
				<td>{++$k}</td>
				<td>{$list['openid']}</td>
				<td>{$list['nickname']}</td>
				<td>{$list['language']}</td>
				<td>{$list['city']}</td>
				<td>{$list['province']}</td>
				<td>{$list['country']}</td>
				<td>{:date('Y-m-d',$list['subscribe_time'])}</td>
				<td><a class="btn btn-small btn-default" href="{:U('freezen?openid='.$list['openid'])}"><i class="fa fa-lock"></i>冻结用户</a></td>
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
