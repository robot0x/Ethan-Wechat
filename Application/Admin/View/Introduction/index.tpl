<extend name="Base:index" />
<block name="body">
<label>电话:{$introduction[hotel_phone]}</br></label>
<label>描述:{$introduction[description]}</br></label>
<label>URL</label><img class="suoluetu" src="{$introduction[url]}" /></br>

<a class="button" href="{:U('edit?id='.$introduction['id'])}">编辑</a>&nbsp;&nbsp;
	<style type="text/css">
	.suoluetu{
		height: 50px;
	}
</block>