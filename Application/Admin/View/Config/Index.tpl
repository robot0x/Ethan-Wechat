<div>
        <a class="button"  href="{:U('add')}" >添加</a>
</div>
<form action="{:U('index')}" method="post">
    <table>
        <thead>
            <tr>
                <th>配置ID</th>
                <th>配置名称</th>
                <th>配置类型</th>
                <th>配置说明</th>
                <th>创建时间</th>
                <th>更新时间</th>
                <th>状态</th>
                <th>配置值</th>
            </tr>
        </thead>
        <tbody>
        <foreach name="config" item="conf" key="k">
            <tr>
                <td>{$conf[id]}</td>
                <td>{$conf[name]}</td>
                <td>{$conf[type]}</td>
                <td>{$conf[remark]}</td>
                <td>{$conf[create_time]}</td>
                <td>{$conf[update_time]}</td>
                <td>{$conf[status]}</td>
                <td>{$conf[value]}</td>
            </tr>
            </foreach>
        </tbody>
    </table>
</form>
