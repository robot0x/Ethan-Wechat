<?php
namespace Admin\Controller;

use Think\Controller;

use User\Logic\UserLogic;

class LoginController extends Controller
{
	public function indexAction()
	{
		$this->assign('remember',cookie('remember'));
        $this->assign('psw',cookie('password'));
        $this->assign('username',cookie('username'));

        $this->display();
	}

    //对用户名密码进行判断
    public function loginAction()
    {
    	//检测是否勾选记住密码，传入cookie信息
        $data = cookie('remember');
    	if(empty($data))
    	{
	    	if(I('post.remember') == 'on')
	    	{
	    		cookie('password',I('post.password'),30*24*60*60);
	    		cookie('username',I('post.username'),30*24*60*60);
	    		cookie('remember','checked',30*24*60*60);
	    	}
    	}else
    	{
            if(I('post.remember') != 'checked')
            {
                cookie('password',null);
                cookie('username',null);
                cookie('remember',null);
            }
        }
        $username = I('post.username');
        $password = I('post.password');
        //验证用户名密码
    	$UserL = new UserLogic;
    	switch ($UserL->checkUser($username, $password))
    	{
            case '1':
                //根据post的用户名取出用户信息，再将id与name存入session
                $list = $UserL->getUserInfoByName(I('post.username'));
                session('userId',$list['id']);
                session('userName',$list['username']);
                //登录成功后跳转
                redirect_url(U('Sale/index'));
                break;
            case '0':
                $this->error('用户名密码错误',U('Login/index'));
                break;
            case '2':
                $this->error('无此用户名',U('Login/index'));
        }       
    }

    //注销功能
    public function logoutAction()
    {
        session('userId',null);
        session('userName',null);
        $this->success('注销成功',U('Login/index'));
    }

    //点击回车登录
    public function checkAjaxAction(){
        //检测是否勾选记住密码，传入cookie信息
        if(I('post.remember') == 'true'){
            cookie('password',I('post.password'),30*24*60*60);
            cookie('username',I('post.username'),30*24*60*60);
            cookie('remember',true,30*24*60*60);
        }
        else{
            cookie('password',null);
            cookie('username',null);
            cookie('remember',null);
        }

        $return = array();
        $UserL = new UserModel();
        $username = trim(I('post.username'));
        $password = trim(I('post.password'));
        switch ($UserL->checkUser($username,$password)) {
            case '1':
                //根据post的用户名取出用户信息，再将id与name存入session
                $list = $UserL->getUserInfoByName($username);
                session('userId',$list['id']);
                session('userName',$list['username']);

                //登录成功后跳转
                $return['state'] = "success";
                $this->ajaxReturn($return);
                break;

            case '0':
                $return['state'] = "error";
                $return['msg'] = "用户名密码错误" ;
                $this->ajaxReturn($return);
                break;

            case '2':
                $return['state'] = "error";
                $return['msg'] = "无此用户名" ;
                $this->ajaxReturn($return);
                break;
        }
    }
}
