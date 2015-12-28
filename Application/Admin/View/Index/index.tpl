<extend name="Base:index" />
<block name="body">
    <form id="form" action="{:U('save')}" method="post">
        <html:editor id="ueditor" type="Ueditor">
            <H1>HEELO</H1>
        </html:editor>
    
        <?php
        $value = "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png,http://img5.cache.netease.com/stock/2015/12/18/2015121816382360bb2.jpg";
        ?>

        <html:uploader value="value" name="filetest">
        请选择图片
        </html:uploader>

        <button type="submit">submit</button>
    </form>
</block>
