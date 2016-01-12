<extend name="Base:index" />
<block name="body">
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    酒店介绍
                </div>
                <div class="panel-body">
                </div>
                <form class="form-horizontal" action="{:U('save')}" method="post">
                    <input type="hidden" name="id" value="{$introduction.id}">
                    </input>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="hotel_phone" value="{$introduction.hotel_phone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">酒店简介</label>
                        <div class="col-sm-9">
                            <html:editor id="description" type="Ueditor">
                                {$introduction.description}
                            </html:editor>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <button type="submit" class="btn btn-sm btn-success"><i class="fa fa-check "></i>保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <style type="text/css">
    .suoluetu {
        height: 50px;
    }
    </style>
    <style type="text/css">
    .thumbnails {
        height: 110px;
        width: 56px;
    }
    </style>
</block>
