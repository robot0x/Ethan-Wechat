<extend name="Base:index" />
<block name="body">
<label>活动编号:{$activity[id]}</label></br>
<label>活动名称:{$activity[title]}</label></br>
<label>活动缩略图:</label><img class="thumbnail" src="{$activity[thumbnails_url]}" /></br>
<label>活动详情:{$activity[detail]}</label></br>
<label>状态:{$activity[status]}</label></br>
<style type="text/css">
	.thumbnail{
		height: 50px;
	}
</style>
</block>