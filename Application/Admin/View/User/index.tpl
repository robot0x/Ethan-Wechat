<div>
    <a class="button"  href="{:U('add')}" >添加用户</a>
</div>
<form action="{:U('index')}" method="get">
<div>
    <input type = "text" placeholder = "search" name = "keywords" value = "{:I('get.keywords')}"></input>
    <button id="search" type="submit">搜索</button>
</div>

<table class = "table table-bordered table-striped table-hover">
	<thead>
		<tr>
			<th>序号</th>
            <th>用户名</th>
			<th>姓名</th>
			<th>手机号</th>
            <th>邮箱</th>
			<th>操作</th>
		</tr>
	</thead>
		<foreach name="users" item="user" key="k">
			<tr>
				<td>{$k+1}</td>
                                <td>{$user[username]}</td>
				<td>{$user[name]}</td>
				<td>{$user[phonenumber]}</td>
				<td>{$user[email]}</td>
				<td><a class="button" href="{:U('edit?id='.$user['id'])}">编辑</a>&nbsp;&nbsp;
				<a class="button" href="{:U('delete?id='.$user['id'])}">删除</a></td>
            </tr>
		</foreach>	
</table>
</form>
<Yunzhi:page />
