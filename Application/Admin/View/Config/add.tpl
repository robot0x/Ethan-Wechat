<form <eq name="Think.ACTION_NAME" value="edit"> action="{:U('update',I('get.'))}"<else />action="{:U('save',I('get.'))}"</eq> method="post">

<input type="hidden" name="p" value="{$p}"></input>

    <input type="hidden" name="id" value="{$config.id}"></input>
    <label for="name">配置名称:</label>
    <input type="text" name="name" value="{$config.name}"/></br>

    <label for="type">配置类型  ：</label>
    <input type="text" name="type" value="{$config.type}" /></br>

    <label for="remark">配置说明：</label>
    <input type="text" name="remark" value="{$config.remark}" /></br>

    <label for="status">状态：</label>
    <input type="text" name="status" value="{$config.status}" /></br>

    <label for="status">配置值：</label>
    <input type="text" name="value" value="{$config.value}" /></br>

    <button type="submit">保存</button></br>
    <a class="button" href="{:U('index?id= ',I('get.'))}">返回</a>
</form>
