<extend name='Base:index' />
<block name="body">
<div>
	<a class="button"  href="{:U('add')}" >添加</a>
</div>
<form action="{:U('index')}" method="get">
<table>
	<tr>
		<th>序号</th>&nbsp
		<?php $order = I('get.order') ?>
		<th><a href="<eq name='order' value="desc"> {:U('index?by=id&order=asc', I('get.'))}  
		<else/> {:U('index?by=id&order=desc', I('get.'))} </eq>">活动编号</a></th>
		<th>缩略图</th>&nbsp
		<th>活动名</th>&nbsp
		<th>活动结束时间</th>&nbsp
		<th>活动详情</th>&nbsp
		<th>状态</th>&nbsp	
		<th>操作</th>
	</tr>
	<foreach name="activities" item="activity" key="k">
	<tr>
		<th>{$k+1}</th>&nbsp
		<th>{$activity[id]}</th>&nbsp
		<th><img class="thumbnail" src="{$activity[thumbnails_url]}" /></th>&nbsp
		<th>{$activity[title]}</th>&nbsp
		<th>{$activity[end_time]}</th>&nbsp
		<th>{$activity[detail]}</th>&nbsp
		<th>{$activity[status]?'正常':'冻结'}</th>&nbsp
		<td><a class="button" href="{:U('detail?id='.$activity['id'])}">查看</a>&nbsp;&nbsp;
		<a class="button" href="{:U('edit?id='.$activity['id'])}">编辑</a>&nbsp;&nbsp;
		<a class="button" href="{:U('delete?id='.$activity['id'])}">删除</a></td>
	</tr>
	</foreach>
</table>


</form>
<Yunzhi:page />
<style type="text/css">
.thumbnail{
	height: 50px;
}
</style>
</block>
