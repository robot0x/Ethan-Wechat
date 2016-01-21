<extend name="Base:index" />
<block name="body">
    <div class="row">
        <div class="col-xs-12">
            <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">
                返回
            </button>
            <div class="panel-body">
            </div>
            <div class="panel panel-default">
                <div class="panel-body">

	                <form class="form-horizontal"<eq name="Think.ACTION_NAME" value="add"> action="{:U('save')}"<else />action="{:U('update')}"</eq> method="post">
	                    <input type="hidden" name="id" value="{$user.id}"></input>

	                    <div class="form-group">
	                        <label for="pid" class="col-sm-2 control-label">上级菜单：</label>
	                        <div class="col-sm-4">
	                            <eq name="Think.ACTION_NAME" value="add">
	                            <select name="pid">
		                        <foreach name="M:getTitles()" item="title">
  			                    <option name="type" value="{$title}">{$title}</option>
  		                        </foreach>
	                            </select>
	                            <else />
	                            {:$M->getMenu()['pid']}
	                            </eq>
	                            </br>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="name" class="col-sm-2 control-label">标题：</label>
	                            <div class="col-sm-4">
	                                <input type ="text" name="name" value="{:$M->getMenu()['name']}" /></br>
	                            </div>
                        </div>
                        <div class="form-group">
	                        <label for="sort" class="col-sm-2 control-label">排序：</label>
	                            <div class="col-sm-4">
	                                <input type ="text" name="sort" value="{:$M->getMenu()['sort']}" /></br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="keyword" class="col-sm-2 control-label">关键字：</label>
	                            <div class="col-sm-4">
	                                <input type = "text" name="keyword" value="{:$M->getMenu()['keyword']}"/></br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="type" class="col-sm-2 control-label">类型：</label>
	                            <div class="col-sm-4">
	                                <select name="type">
  		                            <option name="type" value="click">click</option>
  		                            <option name="type" value="view">view</option>
	                                </select>
	                                </br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="title" class="col-sm-2 control-label">标题：</label>
	                            <div class="col-sm-4">
	                                <input type = "text" name="title" value="{:$M->getMenu()['title']}"/></br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="content" class="col-sm-2 control-label">文章内容：</label>
	                            <div class="col-sm-4">
	                                <input type = "text" name="content" value="{:$M->getMenu()['content']}"/></br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="imgurl" class="col-sm-2 control-label">图片链接：</label>
	                            <div class="col-sm-4">
	                                <input type = "text" name="imgurl" value="{:$M->getMenu()['imgurl']}"/></br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="url" class="col-sm-2 control-label">跳转链接：</label>
	                            <div class="col-sm-4">
	                                <input type = "text" name="url" value="{:$M->getMenu()['url']}"/></br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="form_type" class="col-sm-2 control-label">回复类型：</label>
	                            <div class="col-sm-4">
	                                <input type = "text" name="form_type" value="{:$M->getMenu()['form_type']}"/></br>
	                            </div>
	                    </div>
	                    <div class="form-group">
	                        <div class="col-sm-offset-2 col-sm-10">
	                            <button type = "submit" class="btn btn-sm btn-success">
	                            <i class="fa fa-check"></i>保存</button>
	                        </div>
                        </div>
	                </form>
	            </div>
             </div>
	    </div>
    </div>
</block>