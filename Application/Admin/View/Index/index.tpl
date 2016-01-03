<extend name="Base:index" />
<block name="body">
    <form id="form" action="{:U('save')}" method="post">
        <html:editor id="ueditor" type="Ueditor">
            <H1>HEELO</H1>
        </html:editor>
    
      

        <html:uploader value="value" name="filetest">
        请选择图片
        </html:uploader>

        <button type="submit">submit</button>
    </form>
</block>
