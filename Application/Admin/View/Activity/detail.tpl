<extend name="Base:index" />
<block name="body">
<label>活动编号</label>：{$activity[id]}</br>
<label>活动名称</label>:{$SlideShow[title]}</br>
<label>活动缩略图URL</label>:<img class="thumbnail" src="{$activity[thumbnails_url]}" /></br>
<label>活动详情</label>:{$activity[detail]}</br>
<label>状态</label>:{$activity[status]}</br>
<style type="text/css">
	.thumbnail{
		height: 50px;
	}
</style>
</block>