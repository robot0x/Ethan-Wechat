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
                            <div class="col-md-3">
                                <label for="name">配置名称:</label>
                            </div>
                            <div class="col-md-6">
                                <input class="form-control" type="text" name="name" value="{$config.name}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-3">
                                <label for="type">配置类型  ：</label>
                            </div>
                            <div class="col-md-6">
                                <input class="form-control" type="text" name="type" value="{$config.type}" />
                            </div>
                        </div>

                        <div class="form-group row">
                        <div class="col-md-3">
                            <label for="remark">配置说明：</label>
                        </div>
                        <div class="col-md-6">
                            <input class="form-control" type="text" name="remark" value="{$config.remark}" />
                        </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-md-3">
                            <label for="status">状态：</label>
                            </div>
                            <div class="col-md-6">
                            <input class="form-control" type="text" name="status" value="{$config.status}" />
                            </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-md-3">
                            <label for="status">配置值：</label>
                            </div>
                            <div class="col-md-6">
                            <input class="form-control" type="text" name="value" value="{$config.value}" />
                            </div>
                        </div>
                        <div class="form-group row">
                        <div class="col-md-3">
                            <label for="status">排序：</label>
                            </div>
                            <div class="col-md-6">
                            <input class="form-control" type="text" name="sort" value="{$config.sort}" />
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">保存</button>
                        <a class="btn btn-default" href="{:U('index?id= ',I('get.'))}">返回</a>
                    </form>
                    </div><!--col-->
                </div><!--row-->
            </div><!--body-->
        </div>
    </div>
    </block>


