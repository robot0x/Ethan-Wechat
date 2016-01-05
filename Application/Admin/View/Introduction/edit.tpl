<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-xs-12">
            
                
                <div class="box-body table-responsive">
                    <div class="panel-body">
                        <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
                    </div>
                    <form class="form-horizontal" <eq name="Think.ACTION_NAME" value="add"> action="{:U('save',I('get.'))}"<else />action="{:U('update',I('get.'))}"</eq> method="post">
                    <input type="hidden" name="id" value="{$introduction.id}">
                    </input>

                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="hotel_phone" value="{$introduction.hotel_phone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">酒店介绍</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="description" value="{$introduction.description}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="url" class=" col-sm-2 control-label">缩略图</label>

                            <eq name="Think.ACTION_NAME" value="edit">
                                  <div class="col-sm-4">
                                  <img class="thumbnails" src="{$introduction['url']}"  />
                                  </div>
                             </div>
                             <div class="form-group">
                                  <label for="url" class="col-sm-2 control-label">上传新图片：</label>
                              </eq>
                              <div class="col-sm-5">
                                 <html:uploader value="introduction['url']" name="url">
        请选择图片
        </html:uploader>
                              </div>
                        </div>                      
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-sm btn-success"><i class="fa fa-check "></i>保存</button>
                            </div>
                        </div>
                    </form>
                
            </div>
        </div>
    </div>   
    <style type="text/css">
    .suoluetu{
        height: 50px;
    }
    </style> 
    <style type="text/css">
.thumbnails{
    height: 110px;
    width: 56px;
}
</style>
</block>


















