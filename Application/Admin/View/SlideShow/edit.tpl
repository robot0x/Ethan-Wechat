<extend name="Base:index" />
<block name="body">
    <div class="row-fluid">
        <div class="col-xs-12">
            <div class="box">
                
                <div class="box-body table-responsive">
                    <div class="panel-body">
                        <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
                    </div>
                    <form class="form-horizontal" <eq name="Think.ACTION_NAME" value="add"> action="{:U('save',I('get.'))}"<else />action="{:U('update',I('get.'))}"</eq> method="post">
                    <input type="hidden" name="id" value="{$slideshow.id}">
                    </input>

                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="title" value="{$slideshow.title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="url" class="col-sm-2 control-label">缩略图</label>

                            <eq name="Think.ACTION_NAME" value="edit">
                                  <div class="col-sm-4">
                                  <img class="suoluetu" src="{$slideshow[url]}"  />
                                  </div>
                             </div>
                             <div class="form-group">
                                  <label for="url" class="col-sm-2 control-label">上传新图片：</label>
                              </eq>
                              <div class="col-sm-5">
                              <html:webuploader name="url" class="ourClass">    
                              </html:webuploader>
                              </div>
                        </div>
                        <div class="form-group">
                            <label for="weight" class="col-sm-2 control-label">权重</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="weight" value="{$slideshow.weight}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-4">
                                <div class="col-md-6 form-group">
                                    <select class="selectpicker form-control" name="status">
                                        <option value="1">冻结</option>
                                        <option value="0" <eq name="slideshow.status" value="0">selected="selected"</eq>>正常</option>
                                    </select><!-- /.input group -->
                                </div>
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
    </div>   
    <style type="text/css">
    .suoluetu{
        height: 50px;
    }
    </style> 
</block>


