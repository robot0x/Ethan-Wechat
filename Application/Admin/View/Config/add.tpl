<extend name="Base:index" />
<block name="body">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">

            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-12">
                        <form <eq name="Think.ACTION_NAME" value="edit"> action="{:U('update',I('get.'))}"<else />action="{:U('save',I('get.'))}"</eq> method="post" class="form">
                        <div class="form-group">
                            <input type="hidden" name="p" value="{$p}" />
                            <input type="hidden" name="id" value="{$config.id}" />
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-3">
                                <label for="name">配置名称:</label>
                            </div>
                            <div class="col-xs-6">
                                <input class="form-control" <eq name="config.name" value=""><else/>disabled="disabled"</eq> type="text" name="name" value="{$config.name}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-3">
                                <label for="type">配置类型  ：</label>
                            </div>
                            <div class="col-xs-6">
                                <input class="form-control" type="text" name="type" value="{$config.type}" />
                            </div>
                        </div>

                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="remark">配置说明：</label>
                        </div>
                        <div class="col-xs-6">
                            <input class="form-control" type="text" name="remark" value="{$config.remark}" />
                        </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="status">状态：</label>
                            </div>
                            <div class="col-xs-6">
                                <select class="form-control"  name="status" >
                                <eq name="config.status" value="0">
                                    <option value="0">正常</option>
                                    <option value="1">冻结</option>
                                    <else/>
                                    <option value="1">冻结</option>
                                    <option value="0">正常</option>
                                </eq>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="status">配置值：</label>
                            </div>
                            <div class="col-xs-6">
                            <input class="form-control" type="text" name="value" value="{$config.value}" />
                            </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-xs-3">
                            <label for="status">排序：</label>
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
    </block>


