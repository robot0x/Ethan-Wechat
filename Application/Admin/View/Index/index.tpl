<extend name="Base:index" />
<block name="body">
    <form id="form" action="{:U('save')}" method="post">

        <html:editor id="ueditor" type="Ueditor">
            <H1>HEELO</H1>
        </html:editor>

        <html:webuploader name="hi" class="ourClass">

        </html:webuploader>
        <button type="submit">submit</button>
    </form>
 </block>