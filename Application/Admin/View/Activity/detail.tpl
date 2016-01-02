<extend name="Base:index" />
<block name="body">
<div class="row-fluid">

      <div class="col-xs-12">
            <div class="box">
					<div class="box-body table-responsive">
 					<div class="panel-body">
                        <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
                    </div>

 <form class="form-horizontal">
      <div class="form-group">
      <label for="id" class="col-sm-2 controll-label">活动编号:</label>
      <div class="col-sm-4">
      {$activity[id]}</br>
      </div>
      </div> 


<div class="form-group">
<label for="id" class="col-sm-2 controll-label">活动名称:</label>
<div class="col-sm-4">
{$activity[title]}</br>
</div>
</div>

<div class="form-group">
<label for="id" class="col-sm-2 controll-label">活动缩略图:</label>
<div class="col-sm-4">
<img class="thumbnail" src="{$activity[thumbnails_url]}" /></br>
</div>
</div>
<div class="form-group">
<label for="id" class="col-sm-2 controll-label">活动详情:</label>
<div class="col-sm-4">
{$activity[detail]}</br>
</div>
</div>
<div class="form-group">
<label for="id" class="col-sm-2 controll-label">状态:</label>
<div class="col-sm-4">
{$activity[status]}</br>
</div>
</div>
</form>
</div>

              </div>
            </div>
        </div>
    

<style type="text/css">
	.thumbnail{
		height: 50px;
	}
</style>
</block>