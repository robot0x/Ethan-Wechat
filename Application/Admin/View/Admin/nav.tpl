<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="http://www.yunzhiclub.com">洛克酒店后台管理系统</a>
    </div>
    <!-- /.navbar-header -->
    <ul class="nav navbar-top-links navbar-right">
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> {:session('userName')}</a>
                </li>
                <li><a href="{:U('PersonalCenter/edit')}"><i class="fa fa-gear fa-fw"></i> 个人信息管理</a>
                </li>
                <li class="divider"></li>
                <li><a href="{:U('login/logout')}"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <foreach name="YunzhiMenuM:getMenuLists()" item="list">
                    <li>
                        <a class="<eq name="YunzhiMenuM:checkIsCurrent($list)" value="1">active</eq>"href="{:U($list['module'] . '/' . $list['controller'] . '/' . $list['action'])}"><i class="{$list['icon']}"></i> {$list['title']}</a>
                    </li>
                </foreach>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
