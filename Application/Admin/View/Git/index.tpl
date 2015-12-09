<form action="{:U('reset')}" method="get">
    <h2>请填写仓库及分支名称</h2>
    <p><a href="{:U('status')}">查看当前版本信息</a></p>
    <label for="remote">仓库名称</label>
    <input id="remote" type="text" name="remote" value="origin" />
    <label for="branch">分支名称</label>
    <input type="text" id="branch" name="branch" value="development" />
    <button type="submit">提交</button>
</form>
