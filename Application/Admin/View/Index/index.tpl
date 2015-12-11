<extend name="Base:index" />
<block name="body">
    <form id="form" action="{:U('save')}" method="post">
        <input type="text" name="id" value="3" />
        <html:editor id="ueditor" type="Ueditor">
            <H1>HEELO</H1>
        </html:editor>
        <div id="uploader">
        	<div id="files" type="hidden" />
            <div class="queueList">
                <div id="dndArea" class="placeholder">
                    <div id="filePicker"></div>
                    <p>或将照片拖到这里，单次最多可选300张</p>
                </div>
            </div>
            <div class="statusBar" style="display:none;">
                <div class="progress">
                    <span class="text">0%</span>
                    <span class="percentage"></span>
                </div>
                <div class="info"></div>
                <div class="btns">
                    <div id="filePicker2"></div>
                    <div class="uploadBtn">开始上传</div>
                </div>
            </div>
        </div>
        <script type="text/javascript"></script>
        <script type="text/javascript" src="__ROOT__/lib/webuploader/webuploader.min.js"></script>
        <script type="text/javascript" src="__ROOT__/yunzhi.php/Webuploader/config.html"></script>
        <button type="submit">submit</button>
    </form>
</block>
