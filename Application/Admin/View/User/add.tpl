<!DOCTYPE html>
<html>
<head>
      <meta charset = "UFT-8">
      <title>添加修改用户</title>
</head>
<body>
<body>
  <form <eq name = "THINK.ACTION_NAME" value = "add"> action = "{:U('save')}"<else/>action = "{:U('update')}"</eq>method = 'post'>
    <input type="hidden" name="id" value="{$user.id}">
	</input>
        <label>用户名：</label> <input type ="text" name ="username" value ="{$user.username}"/></br>
        <label>姓名：</label><input type = "text" name = "name" value = "{$user.name}"/></br>
        <label>手机号：</label><input type ="text" name="phonenumber" value="{$user.phonenumber}" /></br>
	<label>邮箱：</label><input type = "text" name="email" value="{$user.email}"/></br>
        <button type = "submit">保存</button>
    </form>
</body>
</html>