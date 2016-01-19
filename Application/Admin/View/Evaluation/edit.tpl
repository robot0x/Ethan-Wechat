<extend name="Base:index" />
<block name="body">
    <div class="row" ng-app="evaluation" ng-controller="edit">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    编辑
                </div>
                <div class="panel-body">
                    <form id="form" name="form" action="{:U('save', I('get.'))}" method="post" >
                        <div class="row">
                            <div class="col-xs-12 col-md-6 col-lg-3">
                                <input type="hidden" name="id" value="{:I('get.id')}" />
                                <div class="form-group">
                                    <p>
                                        <label>客户昵称:</label>{{nickname}}</p>
                                </div>
                                <div class="form-group {{openidClass}}">
                                    <label>客户OPENID:</label><span ng-show="showspan">{{order__customer_id}}</span>
                                    <input type="text" class="form-control" ng-hide="showspan" ng-model="order__customer_id" />
                                </div>
                                <div class="form-group">
                                    <label>评价星级</label>
                                    <select class="form-control" name="star_level">
                                        <php>
                                            for($j = 1; $j
                                            < 6; $j++) : echo '<option value="' . $j . '"'; if($j==$list[ 'star_level']) echo 'selected="selected"'; echo '>' . $j . '</option>'; endfor; </php>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>评价图片</label>
                                    <html:uploader value="list['url']" name="url">
                                        请选择图片
                                    </html:uploader>
                                </div>
                                <div class="form-group">
                                    <label>评价日期</label>
                                    <input class="form-control date" name="update_time" type="date" value="<php>echo isset($list['update_time']) ? date('Y-m-d',$list['update_time']) : date('Y-m-d');</php>" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>评价内容</label>
                                    <textarea class="form-control" row="4" name="evaluation" required>{$list['evaluation']}</textarea>
                                </div>
                                <div class="text-center">
                                    <button type="submit" ng-disabled="!isuser" class="btn btn-success"><i class="fa fa-check"></i>&nbsp;提交</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <include file="edit.js" />
</block>
