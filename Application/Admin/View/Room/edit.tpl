<extend name="Base:index" />
<block name="body">
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    添加房型
                </div>
                <div class="panel-body">
                    <form role="form" action="{:U('save',I('get.'))}" method="post">
                        <input type="hidden" name="id" value="{$room['id']}" />
                        <div class="row">
                            <div class="col-xs-12 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label>房型</label>
                                    <input class="form-control" id="title" name="title" type="text" value="{$room['title']}" />
                                </div>
                                <div class="form-group">
                                    <label>价格</label>
                                    <input class="form-control" id="price" name="price" type="money" value="{$room['price'] | format_money}" />
                                </div>
                                <div class="form-group">
                                    <label>描述</label>
                                    <textarea class="form-control" id="description" name="description">{$room['description']}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>总间数</label>
                                    <input class="form-control" id="total_rooms" name="total_rooms" type="text" value="{$room['total_rooms']}" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>房型介绍</label>
                                    <div>
                                        <html:editor id="ueditor" type="Ueditor" name="detial_description">
                                            {$room['detial_description'] | htmlspecialchars_decode}
                                        </html:editor>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>房型图片</label>
                                        <html:uploader value="room['url']" name="url">
                                            请选择图片
                                        </html:uploader>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-center">
                            {__TOKEN__}
                                <button type="submit" class="btn btn-success "><i class="fa fa-check"></i> 确认</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {$js}
</block>
