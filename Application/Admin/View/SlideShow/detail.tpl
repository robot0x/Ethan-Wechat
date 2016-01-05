
<extend name="Base:index" />
<block name="body">
<div class="row-fluid">
        <div class="col-xs-12">
            <div class="box">
                
                <div class="box-body table-responsive">
                    <div class="panel-body">
                        <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
                    </div>
                    <form class="form-horizontal">
                    <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-4">
                                {$SlideShow[title]}
                            </div>
                    </div>
                    <div class="form-group">
                            <label for="url" class="col-sm-2 control-label">缩略图</label>
                            <div class="col-sm-4">
                               <img class="suoluetu" src="{$SlideShow[url]}"  />
                            </div>
                    </div>
                    <div class="form-group">
                            <label for="weight" class="col-sm-2 control-label">权重</label>
                            <div class="col-sm-4">
                                {$SlideShow[weight]}
                            </div>
                    </div> 
                    <div class="form-group">
                            <label for="status" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-4">
                                {$slideshow[status]?'正常':'冻结'}
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