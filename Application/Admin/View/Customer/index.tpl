	<div>
        <a class="button"  href="{:U('synchro')}" >同步服务器的客户信息
</a>
    </div>
	<table>
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
		<foreach name="M:getlists()" item="list" key="k">
			<tr>
				<td>{++$k}</td>
				<td>{$list['id']}</td>
				<td>{$list['nickname']}</td>
				<td>{$list['language']}</td>
				<td>{$list['city']}</td>
				<td>{$list['province']}</td>
				<td>{$list['country']}</td>	
				<td>{:date('Y-m-d',$list['subscribe_time'])}</td>
				<td><a class="button" href="{:U('freezen?openid='.$list['openid'])}">冻结用户</a></td>
			</tr>
		</foreach>	
	</table>
	{$page}