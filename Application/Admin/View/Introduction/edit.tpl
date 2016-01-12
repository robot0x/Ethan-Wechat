<extend name="Base:index" />
<block name="body">
    <div class="row" ng-app="introduction" ng-controller="edit">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    酒店介绍
                </div>
                <div class="panel-body">
                </div>
                <form class="form-horizontal" action="{:U('save')}" method="post" name="form">
                    <input type="hidden" name="id" value="{$introduction.id}" />
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="hotel_phone" ng-model="hotel_phone" ng-pattern="regex" required />
                            <p class="text-danger" ng-show="form.hotel_phone.$invalid">请输入11位手机号码</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">酒店简介</label>
                        <div class="col-sm-9">
                            <html:editor id="description" type="Ueditor" name="description">
                                {$introduction["description"] | htmlspecialchars_decode}
                            </html:editor>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <button type="submit" ng-disabled="form.hotel_phone.$invalid" class="btn btn-sm btn-success"><i class="fa fa-check "></i>保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <include file="edit.js" />
</block>
