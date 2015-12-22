<extend name="Base:index" />
<block name="body">
<div>
        <a class="button"  href="{:U('add')}" >添加</a>
    </div>
    <form action="{:U('index')}" method="get">
<table>
		<tr>
			<th>序号</th>
			<th>ID</th>	
			<th>title</th>
			<th>缩略图</th>
			<?php $order = I('get.order') ?>
			<th><a href="<eq name='order' value="desc"> {:U('index?by=weight&order=asc', I('get.'))}  
			<else/> {:U('index?by=weight&order=desc', I('get.'))} </eq>">权重</a></th>	
			<th>状态</th>
			<th>操作</th>
		</tr>
		<foreach name="slideshows" item="slideshow" key="k">
			<tr>
				<td>{$k+1}</td>
				<td>{$slideshow[id]}</td>
				<td>{$slideshow[title]}</td>
				<td><img class="suoluetu" src="{$slideshow[url]}" /></td>
				<td>{$slideshow[weight]}</td>
				<td>{$slideshow[status]?'正常':'冻结'}</td>
				<td></td>
				<td><a class="button" href="{:U('detail?id='.$slideshow['id'])}">查看</a>&nbsp;&nbsp;
				<a class="button" href="{:U('edit?id='.$slideshow['id'])}">编辑</a>&nbsp;&nbsp;
				<a class="button" href="{:U('delete?id='.$slideshow['id'])}">删除</a></td>
			</tr>
		</foreach>	
	</table>
	</form>
	<Yunzhi:page />
	<style type="text/css">
	.suoluetu{
		height: 50px;
	}
	</style>
</block>
