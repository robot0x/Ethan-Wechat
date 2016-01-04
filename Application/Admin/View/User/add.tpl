<extend name="Base:index" />
<block name="body">
  <div class="row-fluid">
    <div class="col-xs-12">
      <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">
        返回
      </button>
      <div class="panel-body">
      </div>
      <div class="panel panel-default">
        <!-- <div class="panel-heading">
          添加用户
        </div> -->
          <div class="panel-body">
            <form class="form-horizontal" action = "{:U('save')}" method = 'post'>
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