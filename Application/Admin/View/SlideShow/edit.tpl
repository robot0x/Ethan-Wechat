<extend name="Base:index" />
<block name="body">
<div class="row-fluid" ng-app="slideshow" ng-controller="slideshowAdd">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">

            </div>
           <div class="panel-body">
                <div class="row">
                    <div class="col-lg-12">
                        <form  name="myForm" <eq name="Think.ACTION_NAME" value="edit"> action="{:U('update',I('get.'))}"<else />action="{:U('save',I('get.'))}"</eq> method="post" class="form">
                        <div class="form-group">
                            <input type="hidden" name="p" value="{$p}" />
                            <input type="hidden" name="id" value="{$config.id}" />
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-3">
                                <label for="title">标题:</label>
                            </div>
                            <div class="col-xs-6">
                                <input class="form-control" type="text" name="title" ng-model="title" ng-disabled="{{edit}}" required />
                                <p ng-show="myForm.title.$dirty && myForm.title.$invalid"><span ng-show="myForm.title.$error.required">标题不能为空</span></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-3">
                                <label for="url">缩略图:</label>
                                </div>
                            <eq name="Think.ACTION_NAME" value="edit">
                                  <div class="col-xs-6">
                                  <img class="mythumbnail" src="{$slideshow[url]}"  />
                                  </div>
                             
                        </div>
                             <div class="form-group row">
                             <div class="col-xs-3">
                                <label for="url">上传新图片：</label>
                            </div>
                                  
                              </eq>
                              <div class="col-xs-6">
                                <html:uploader value="value" name="url">
                                请选择图片
                                </html:uploader>
                              </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-3">
                                <label for="weight">权重:</label>
                            </div>
                            <div class="col-xs-6">
                                <input class="form-control" type="text" name="weight" ng-model="weight" ng-disabled="{{edit}}" required />
                                <p ng-show="myForm.weight.$dirty && myForm.weight.$invalid"><span ng-show="myForm.weight.$error.required">权重不能为空</span></p>
                            </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="status">状态：</label>
                            </div>
                            <div class="col-xs-6">
                                <select class="form-control"  name="status" >
                                <eq name="slideshow.status" value="0">
                                    <option value="0">正常</option>
                                    <option value="1">冻结</option>
                                    <else/>
                                    <option value="1">冻结</option>
                                    <option value="0">正常</option>
                                </eq>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                        <div class="col-xs-3 col-xs-offset-5">
                        <button class="btn btn-primary" type="submit"><i class="fa fa-check"></i>保存</button>
                        <a class="btn btn-default" href="{:U('index?id= ',I('get.'))}"><i class="fa fa-reply"></i>返回</a>
                        </div>
                        </div>
                    </form>
                    </div><!--col-->
                </div><!--row-->
            </div><!--body-->
        </div>
    </div>
    </div>
    <include file="editJs" />
    <style type="text/css">
    .mythumbnail{
        height: 50px;
    }
</style>
    </block>


