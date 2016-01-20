<extend name="Base:index" />
<block name="body">
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    个人信息
                </div>
                <div class="panel-body" ng-app="personalCenter" ng-controller="edit">
                    <div class="row">
                        <div class="col-xs-12">
                            <form class="form-horizontal" action="{:U('save')}" method="post" name="form">
                                <input type="hidden" name="id" value="{$user.id}" />
                                <div class="form-group row">
                                    <label for="username" class="col-xs-2 text-right">姓名：</label>{$user["name"]}
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-xs-2 text-right">邮箱:</label><input type="email" name="email" ng-model="email" required/>
                                    <span class="text-danger" ng-show="form.email.$error.email">*邮箱格式错误</span>
                                </div>
                                <div class="form-group row">
                                  	<label for="password" class="col-xs-2 text-right">原密码:</label><input type="password" name="password" ng-model="password" required />
                                  	<span class="text-danger" ng-show="form.password.$error.required">*请输入原密码</span>
                                </div>
								<div class="form-group row">
                                  	<label for="repassword" class="col-xs-2 text-right">新密码:</label><input name="repassword">
                                </div>
                                <div class="form-group row">
                                	<div class="col-xs-6 text-center">
                                		<button type="submit" ng-disabled="form.password.$invalid || form.email.$error.email" class="btn btn-sm btn-success"><i class="fa fa-check "></i>保存</button>
                                	</div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <include file="edit.js" />
</block>
