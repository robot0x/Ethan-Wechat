<?php
namespace SlideShow\Model;

use Yunzhi\Model\YunzhiModel;

class SlideShowModel extends YunzhiModel
{

 	protected $orderBys     = array("weight"=>"desc");      //排序字段方式
	protected $keywords     = "I('get.keywords')";                   //查询关键字
	protected $field        = "title"; //查询字段
	public function saveSlideShow($data){
        //拼接url信息
        $data['url'] = $data['module'].'/'.$data['controller'].'/'.$data['action'];
        if($data['edit'] == null || $data['edit'] == ''){
            $data['id'] = null;
            $this->add($data);
        }else {
            $this->save($data);
        }
        $state = "success";
        return $state;
    }
    public function getMenuById($id){
        $map['id'] = $id;
        $slideshow = $this->where($map)->find();
        $slideshow['edit'] = 1;
        return $slideshow;
    }
                         
}

