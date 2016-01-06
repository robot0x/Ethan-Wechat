<extend name="Base:index" />
<block name="body">
	<div>
	 <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
	</div>
	<div ng-app="myActivity" ng-controller="activity" >
	<form class="form-horizontal" name="myForm"  method="post"  novalidate <eq name="Think.ACTION_NAME" value="add"> action="{:U('save',I('get.'))}"<else />action="{:U('update',I('get.'))}"</eq>>
		<input type="hidden" name="id" value="{$activity.id}"></input>

		<div class="form-group">
			<label for="title" class="col-xs-2 control-label">活动名称：</label>
			<div class="col-xs-4">
				<input id="title" type ="text" name="title" value="{$activity.title}" class="form-control" ng-model="title" required/>
				<span style="color:red" ng-show="myForm.title.$dirty&&myForm.title.$invalid">
					<span ng-show="myForm.title.$error.required">活动名是必须的。</span>
				</span></br>
			</div>
		</div>
 		<div class="form-group">
            <label for="thumbnails_url" class="col-xs-2 control-label">缩略图:</label>
         	<div class="col-xs-4">
         		<html:uploader value="activity[thumbnails_url]" name="thumbnails_url" id="thumbnails_url">
        		请选择图片
        		</html:uploader>
          	</div>
        </div>
          
		<div class="form-group">
			<label for="detail" class="col-xs-2 control-label">活动详情：</label>
			<div class="col-xs-4">
			<textarea id="detail" type="text" placeholder="请输入本活动的详情" name="detail" cols="100" rows="5" ng-model="detail" required></textarea>
			<span style="color:red" ng-show="myForm.detail.$dirty&&myForm.detail.$invalid">
					<span ng-show="myForm.detail.$error.required">活动详情是必须的。</span>
				</span></br>
			</div>
		</div>
		<div class="form-group">
			<label  for="end_time" class="col-xs-2 control-label">截止时间：</label>
			<div class="col-xs-3">
				<input id="end_time" class="form-control date" type = "text" name="end_time"  ng-model="end_time" value="{:I('get.end_time') ? I('get.end_time') : date('Y-m-d')}"required/>
				<span style="color:red" ng-show="myForm.end_time.$dirty&&myForm.detail.$invalid">
					<span ng-show="myForm.end_time.$error.required">活动截止日期是必须的。</span>
				</span>
				</br>
			</div>
		</div>


    	<div class="form-group">
           <label for="dataselect" class="col-xs-2 control-label">状态</label>
           <div class="col-xs-4">
              <div class="col-md-6 form-group">
                 <select class="selectpicker form-control" name="status" id="dataselect">
                 <option value="1">冻结</option>
                 <option value="0" <eq name="activity.status" value="0">selected="selected"</eq>>正常</option>
                 </select>
              </div>
           </div>
        </div>
		
			<div class="col-xs-offset-2 col-xs-10">
				<button type="submit" class="btn btn-sm btn-success" ng-disabled="myForm.title.$invalid ||
  				myForm.detail.$invalid||myForm.end_time.$invalid"><i class="fa fa-check "></i>保存</button>
			</div>

			
		
	</form>
</div>
	
	<style type="text/css">
	.thumbnails{
		height: 100px;
		
	}
	</style>
	<script type="text/javascript">
	var app=angular.module('myActivity',[]);
	app.controller('activity',function($scope){
		
		$scope.title = '{:$activity['title']}';
     	$scope.detail ='{:$activity['detail']}';
     	$scope.end_time = '{:$activity['end_time']}';
	});

 </script>
	</block>
	