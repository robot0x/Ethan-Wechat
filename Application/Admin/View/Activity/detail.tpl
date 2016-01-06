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
                    <label class="col-xs-2 controll-label">活动编号:</label>
                    <div class="col-xs-4">
                      {$activitys[id]}</br>
                    </div>
                  </div> 
                  <div class="form-group">
                    <label  class="col-xs-2 controll-label">活动名称:</label>
                    <div class="col-xs-4">
                      {$activitys[title]}</br>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-xs-2 controll-label">活动缩略图:</label>
                    <div class="col-xs-4">
                    <foreach name="activitys['thumbnails_url']" item="activity['thumbnails_url']" key="k">
                      <img class="thumbnails"  src="{$activity[thumbnails_url]}" /></br>
                      </foreach>
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-xs-2 controll-label">活动详情:</label>
                    <div class="col-xs-4">
                      {$activitys[detail]}</br>
                    </div>
                  </div>
                     <div class="form-group">
                    <label class="col-xs-2 controll-label">截止时间:</label>
                    <div class="col-xs-4">
                      {$activitys[end_time]}</br>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-xs-2 controll-label">状态:</label>
                    <div class="col-xs-4">
                      {$activitys[status]?'冻结':'正常'}</br>
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