<extend name="Base:index" />
<block name="body">




<div>
	 <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
</div>


	<form class="form-horizontal" <eq name="Think.ACTION_NAME" value="add"> action="{:U('save')}"<else />action="{:U('update')}"</eq> method="post">
	<input type="hidden" name="id" value="{$activity.id}"></input>

	<div class="form-group">
	<label for="title" class="col-sm-2 control-label">活动名称：</label>
	<div class="col-sm-4">
	<input type ="text" name="title" value="{$activity.title}" class="form-control"/></br>
	</div>
	</div>



 
	<label  for="url" class="col-sm-2 control-label">缩略图：</label>
	<eq name="Think.ACTION_NAME" value="edit">
	<div class="col-sm-4">
	<img class="thumbnail"   src="{$activity[thumbnails_url]}"  /></br>
	</div>
	</eq>
	 <div class="form-group">
	<label for="thumbnails_url" class="col-sm-2 control-label">上传新图片：</label>
	<div class="col-sm-4">
	<html:webuploader name="thumbnails_url" class="ourClass">    
    </html:webuploader>
    </div>
    </div>







<div class="form-group">
	<label for="detail" class="col-sm-2 control-label">活动详情：</label>
<div class="col-sm-4">
	<textarea type="text" placeholder="请输入本活动的详情" name="detail"></textarea>
	</div>
	</div>


	<div class="form-group">
	<label  for="end_time" class="col-sm-2 control-label">截止时间：</label>
	<input type = "text" name="end_time" value="{$activity.end_time}"/></br>
	</div>

<div class="form-group">
	<label for="status" class="col-sm-2 control-label">状态：</label>
	<input type ="text" name="status" value="{$activity.status}" /></br>
	</div>

	<div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
	<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-check "></i>保存</button>
	</div>
	</div>
	</form>


	<style type="text/css">
	.thumbnail{
		height: 50px;
	}
	</style>
	</block>
	