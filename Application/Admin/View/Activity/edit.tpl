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
 		<div class="form-group">
            <label for="thumbnails_url" class="col-sm-2 control-label">缩略图</label>
              <eq name="Think.ACTION_NAME" value="edit">
              <div class="col-sm-4">
                 <img class="thumbnails"  src="{$activity[thumbnails_url][0]}"  />
              </div>
        </div>
        <div class="form-group">
            <label for="thumbnails_url" class="col-sm-2 control-label">上传新图片：</label>
               </eq>
         <div class="col-sm-4">
         <html:uploader value="activity[thumbnails_url]" name="thumbnails_url" id="thumbnails_url">
        请选择图片
        </html:uploader>
        
          </div>
          </div>
		<div class="form-group">
			<label for="detail" class="col-sm-2 control-label">活动详情：</label>
			<div class="col-sm-4">
			<textarea type="text" placeholder="请输入本活动的详情" name="detail" cols="100" rows="5"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label  for="end_time" class="col-sm-2 control-label">截止时间：</label>
			<div class="col-sm-4">
				<input type = "text" name="end_time" value="{$activity.end_time}"/></br>
			</div>
		</div>

	<!-- 	<div class="form-group">
			<label for="status" class="col-sm-2 control-label">状态：</label>
			<div class="col-sm-4">
				<input type ="text" name="status" value="{$activity.status}" /></br>
			</div>
		</div> -->

		<div class="form-group">
			<label class="col-sm-2 control-label" >状态</label>
			<?php $status = $activity['status'] ?>
			<label for="0">正常</label>
			<input id="0" type="radio" value="0" name="status"<eq name="status" value="0">checked="checked" </eq>/></label>
			<label for="1">冻结</label>
			<input id="1" type="radio" value="1"  name="status" <eq name="status" value="1">checked="checked" </eq>/></label>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			{__TOKEN__}
				<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-check "></i>保存</button>
			</div>
		</div>
	</form>

	
	<style type="text/css">
	.thumbnails{
		height: 100px;
		width: 56px;
	}
	</style>
	</block>
	