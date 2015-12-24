
<extend name="Base:index" />
<block name="body">
<label>标题</label>:{$SlideShow[title]}</br>
<label>URL</label>:<img class="suoluetu" src="{$SlideShow[url]}" /></br>
<label>权重</label>:{$SlideShow[weight]}</br>
<label>状态</label>:{$slideshow[status]?'正常':'冻结'}</br>
<style type="text/css">
	.suoluetu{
		height: 50px;
	}
</style>
</block>