<extend name="Base:index" />
<block name="body">
  <div class="row-fluid">
      <div class="col-xs-12">
            
					   <div class="box-body table-responsive">
 					      <div class="panel-body">
                  <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
                </div>
                <form class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 controll-label">活动编号:</label>
                    <div class="col-sm-4">
                      {$activity[id]}</br>
                    </div>
                  </div> 
                  <div class="form-group">
                    <label  class="col-sm-2 controll-label">活动名称:</label>
                    <div class="col-sm-4">
                      {$activity[title]}</br>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 controll-label">活动缩略图:</label>
                    <div class="col-sm-4">
                      <img class="thumbnails"  src="{$activity[thumbnails_url][0]}" /></br>
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-2 controll-label">活动详情:</label>
                    <div class="col-sm-4">
                      {$activity[detail]}</br>
                    </div>
                  </div>
                     <div class="form-group">
                    <label class="col-sm-2 controll-label">截止时间:</label>
                    <div class="col-sm-4">
                      {$activity[end_time]}</br>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 controll-label">状态:</label>
                    <div class="col-sm-4">
                      {$activity[status]}</br>
                    </div>
                  </div>
                </form>
              </div>
            
          </div>
        </div>
<style type="text/css">
	.thumbnails{
		height: 100px;
    width: 56px;
	}
</style>
</block>