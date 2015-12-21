<?php
namespace Admin\Controller;
use Admin\Controller;
class IndexController extends AdminController {
    public function indexAction(){
        $this->display();
    }

    public function saveAction(){
    	dump(I('post.'));
    }
}
