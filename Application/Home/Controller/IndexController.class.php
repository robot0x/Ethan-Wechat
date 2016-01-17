<?php
namespace Home\Controller;

use Think\Controller;
use CustomMenu\Model\CustomMenuModel;

class IndexController extends Controller {
    public function indexAction(){
        $this->display();
    }
}