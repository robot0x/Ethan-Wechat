<extend name="Base:index" />
<block name="body">
	<form <eq name="Think.ACTION_NAME" value="add"> action="{:U('save')}"<else />action="{:U('update')}"</eq> method="post">
	<input type="hidden" name="id" value="{$introduction.id}"></input>
	<label>电话：</label><input type ="text" name="hotel_phone" value="{$introduction.hotel_phone}" /></br>	
	<label>酒店介绍：</label><input type = "text" name="description" value="{$introduction.description
	}"/></br>
	<button type="submit">保存</button>
	</form>
	</block>