<extend name="Base:index" />
<block name="body">
<label>电话</label>:{$introduction[hotel_phone]}</br>
<label>描述</label>:{$introduction[description]}</br>
<a class="button" href="{:U('edit?id='.$introduction['id'])}">编辑</a>&nbsp;&nbsp;
</block>