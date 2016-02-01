<extend name="Base:index" />
<block name="wrapper">
    <div class="container" ng-app="Login" ng-controller="indexController">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">请登录</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="loginform" method='post' action="{:U('Login/login')}" ng-submit="submit()">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户名" name="username" id="username" value="{:cookie('username')}">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" id="password" type="password" value="{:cookie('password')}">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <php>$isRemember = cookie('remember');</php>
                                        <input type="checkbox" id="remember" <eq name="isRemember" value="1">checked="checked"</eq>>记住密码
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block" id="login">登录</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="error">
    </div>
    <include file="index.js" />
</block>
