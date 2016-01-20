<extend name="Base:index" />
<block name="body">
<div class="row-fluid" ng-app="config" ng-controller="configAdd">
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
                                <label for="name">配置名称:</label>
                            </div>
                            <div class="col-xs-6">
                                <input class="form-control" type="text" name="name" ng-model="name" ng-disabled="{{edit}}" required />
                                <p ng-show="myForm.name.$dirty && myForm.name.$invalid"><span ng-show="myForm.name.$error.required">配置名称不能为空</span></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-3">
                                <label for="type">配置类型  ：</label>
                            </div>
                            <div class="col-xs-6">
                                <input class="form-control" type="text" name="type" ng-model="type" required />
                                <p ng-show="myForm.type.$dirty && myForm.type.$invalid"><span ng-show="myForm.type.$error.required">配置类型不能为空</span></p>
                            </div>
                        </div>

                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="remark">配置说明：</label>
                        </div>
                        <div class="col-xs-6">
                            <input class="form-control" type="text" name="remark" ng-model="remark" required />
                            <p ng-show="myForm.remark.$dirty && myForm.remark.$invalid"><span ng-show="myForm.remark.$error.required">配置说明不能为空</span></p>
                        </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="status">状态：</label>
                            </div>
                            <div class="col-xs-6">
                                <select class="form-control"  name="status" >
                                <eq name="config.status" value="1">
                                    <option value="1">冻结</option>
                                    <option value="0">正常</option>
                                    <else/>
                                    <option value="0">正常</option>
                                    <option value="1">冻结</option>
                                </eq>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-3">
                                <label for="value">配置值：</label>
                            </div>
                            <div class="col-xs-6">
                                <input class="form-control" type="text" name="value" ng-model="value" required />
                                <p ng-show="myForm.value.$dirty && myForm.value.$invalid"><span ng-show="myForm.value.$error.required">配置值不能为空</span></p>
                            </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="sort">排序：</label>
                            </div>
                            <div class="col-xs-6">
                            <input class="form-control" type="text" name="sort" value="<eq name="config.sort" value="">0<else/>{$config.sort}</eq>" />
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
    <include file="add.js" />
    </block>


