	<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<form <eq name="Think.ACTION_NAME" value="add"> action="{:U('save')}"<else />action="{:U('update')}"</eq> method="post">
	<input type="hidden" name="id" value="{$slideshow.id}"></input>
	<label>标题：</label><input type ="text" name="title" value="{$slideshow.title}" /></br>
	<label>URL：</label><input type = "text" name="url" value="{$slideshow.url}"/></br>
	<label>权重：</label><input type = "text" name="weight" value="{$slideshow.weight}"/></br>
	<label>状态：</label><input type ="text" name="status" value="{$slideshow.status}" /></br>
	<button type="submit">保存</button>
	</form>
	</body>
	</html>