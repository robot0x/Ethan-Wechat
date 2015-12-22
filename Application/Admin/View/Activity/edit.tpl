<extend name="Base:index" />
<block name="body">
	<form <eq name="Think.ACTION_NAME" value="add"> action="{:U('save')}"<else />action="{:U('update')}"</eq> method="post">
	<input type="hidden" name="id" value="{$activity.id}"></input>
	<label>活动名称：</label><input type ="text" name="title" value="{$activity.title}" /></br>
	<label>缩略图：</label>
	<eq name="Think.ACTION_NAME" value="edit"><img class="thumbnail"   src="{$activity[thumbnails_url]}"  /></br>
	<label>上传新图片：</label></eq>
	
	<html:webuploader name="hi" class="ourClass">    
    </html:webuploader>

	<label>活动详情：</label><textarea type="text" placeholder="请输入本活动的详情"></textarea>
	<label>截止时间：</label><input type = "text" name="end_time" value="{$activity.end_time}"/></br>
	<label>状态：</label><input type ="text" name="status" value="{$activity.status}" /></br>
	<button type="submit">保存</button>
	</form>
	<style type="text/css">
	.thumbnails{
		height: 50px;
	}
	</style>
	</block>
	