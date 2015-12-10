<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function indexAction(){
        $this->display();
    }

    public function saveAction(){
    	dump(I('post.'));
    }
}
