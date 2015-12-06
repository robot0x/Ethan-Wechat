<?php
namespace Home\Controller;
use Think\Controller;
use CustomMenu\Model\CustomMenuModel;
class IndexController extends Controller {
    public function indexAction(){
        $CustomMenuM = new CustomMenuModel();
        dump($CustomMenuM->getLists());
    }
}