<extend name="Base:index" />
<block name="body">
  <div class="row-fluid">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-body table-responsive">
          <div class="panel-body">
            <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
          </div>

    <form class="form-horizontal" <eq  name = "Think.ACTION_NAME" value = "add"> action = "{:U('save')}" <else/> action = "{:U('update')}" </eq> method = 'post'>
      <input type="hidden" name="id" value="{$user.id}"></input>


      <div class="form-group">
        <label for="username" class="col-sm-2 control-label">用户名：</label>
        <div class="col-sm-4">
          <input id="username" name="username" class="form-control" <eq name="user['name']" value=""><else />disabled="disabled"</eq> value="{$user.username}">
        </div>
      </div>

      <div class="form-group">
        <label for="name" class="col-sm-2 control-label">姓名：</label>
        <div class="col-sm-4">
          <input id="name" name = "name" class="form-control" <eq name="user['name']" value=""><else />disabled="disabled"</eq> value="{$user.name}">
        </div>
      </div>

      <div class="form-group">
        <label for="phonenumber" class="col-sm-2 control-label">手机号：</label>
        <div class="col-sm-4">
          <input id="phonenumber" name="phonenumber" class="form-control" value="{$user.phonenumber}">
        </div>
      </div>

      <div class="form-group">
	      <label for="email" class="col-sm-2 control-label">邮箱：</label>
        <div class="col-sm-4">
          <input id="email" name="email" class="form-control" value="{$user.email}">
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