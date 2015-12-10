<extend name="Base:index" />
<block name="body">
<form id="form" action="{:U('save')}" method="post">
	<input type="text" name="id" value="3" />
	<html:editor id="ueditor" type="Ueditor" ><H1>HEELO</H1></html:editor>
	<button type="submit">submit</button>
</form>
</block>