<extend name="Base:index" />
<block name="body">
    <div class="row" ng-app="edit">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    出房
                </div>
                <div class="panel-body" ng-controller="edit">
                    <form ng-submit="processForm()" role="form" action="{:U('save',I('get.'))}" method="post">
                        <input type="hidden" name="id" value="{$room['id']}" />
                        <div class="row">
                            <div class="col-xs-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label>请选择入住日期</label>
                                    <input ng-model="formData.begin_time" class="form-control date" id="total_rooms" name="begin_time" type="text" />
                                </div>
                                <div class="form-group">
                                    <label>请选择离店日期</label>
                                    <input ng-model="formData.end_time" class="form-control date" id="total_rooms" name="end_time" type="text" value="{:date('Y-m-d')}" />
                                </div>

                                <div class="form-group">
                                    <label>房型</label>
                                    <select class="form-control" name="room_id" ng-model="room_id" ng-options="room.id as room.title for room in rooms" >
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>房型单价</label>
                                    <input type="hidden" ng-model="per_price" name="per_price"/>
                                    <p class="form-control-static">{{per_price}}</p>
                                </div>
                                <div class="form-group">
                                    <label>数量</label>
                                    <select ng-model="count" class="form-control" name="count" ng-options="value as value for (key, value) in counts">
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>实付金额(应付金额：{{total_pay}})</label>
                                    <input class="form-control" name="total_pay" value="{{total_pay}}" />
                                </div>
                                <div class="form-group">
                                    <label>客户姓名</label>
                                    <input ng-required="true" class="form-control" name="customer_name" />
                                </div>
                                <div class="form-group">
                                    <label>客户手机号</label>
                                    <input class="form-control" name="customer_phone" />
                                </div>
                                <div class="form-group">
                                    <label>备注：</label>
                                    <textarea class="form-control" id="description" name="remark"></textarea>
                                </div>
                            </div>
                        </div>
                        
                       
                        <div class="row">
                            <div class="col-xs-12 text-center">
                                {__TOKEN__}
                                <button ng-show="showSubmit" type="submit" class="btn btn-success none"><i class="fa fa-check"></i> 确认</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <include file="Sale:edit.js" />
</block>
