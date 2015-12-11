<extend name="Base:index" />
<block name="body">
    <form id="form" action="{:U('save')}" method="post">
        <input type="text" name="id" value="3" />
        <html:editor id="ueditor" type="Ueditor">
            <H1>HEELO</H1>
        </html:editor>
        <div id="uploader-demo" class="wu-example">
		    <div id="fileList" class="uploader-list">
		    </div>
		    <div id="filePicker">选择图片</div>
        </div>
        <script type="text/javascript"></script>
        <script type="text/javascript" src="__ROOT__/lib/webuploader/webuploader.min.js"></script>
        <script type="text/javascript" src="__ROOT__/yunzhi.php/Webuploader/config.html"></script>
        <button type="submit">submit</button>
    </form>
</block>
