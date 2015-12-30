<?php
namespace Config\Logic;

use Config\Model\ConfigModel;

/**
*
*/
class ConfigLogic extends ConfigModel
{
        protected  $errors = array();

        public function getErrors()
        {
            return $this->errors;
        }
        public function addList($config)
        {
            try{
                if($this->create($config))
                {
                    $id=$this->add();
                    return $id;
                }
                else
                {
                    $this->errors[]=$this->getError();
                    return false;
                }
            }
            catch(\Think\Exception $e)
            {
                $this->errors[]=$e->getMessage();
                return false;
            }
        }
        public function getListById($id)
        {
            $map['id'] = $id;
            $data = $this->where($map)->find();
            return $data;
        }
        public function saveList($list){
            try{
                if($this->create($list))
                {
                    $id=$this->save();
                    return $id;
                }
                else
                {
                    $this->errors[]=$this->getError();
                    return false;
                }
            }
            catch(\Think\Exception $e)
            {
                $this->errors[]=$e->getMessage();
                return false;
            }
        }
        public function deleteInfo($id)
        {
            $map['id'] = $id;
            $datas=$this->where($map)->delete();
            return $datas;
        }
        public function updateAction(){
        //取用户信息
        $data = I('post.id');

        //传给M层
        $ConfigL = new ConfigLogic();
        $ConfigL->saveList($data);//调用PHP的save方法

        //判断异常
            if(count($errors=$ConfigL->getErrors())!== 0){
                //数组变字符串
                $error = implode('<br/>',$errors);
                //显示错误
                $this->error("操作失败，原因：".$error,U('Admin/Config/index?p='.I('get.p')));
                return false;
            }
            else{
                $this->success("操作成功",U('Admin/Config/index?p='.I('get.p')));
            }
        }
        public function deleteAction(){
            //取ID信息
            $configId = I('get.id');

            //调用M层方法
            $ConfigL = new ConfigLogic();
            $status = $ConfigL->deleteInfo($ConfigId);
            // echo $status;
            // 判断状态
            if($status !==false){
               $this->success("删除成功", U('Admin/Config/index?p='.I('get.p')));
            }
            else{
                $this->error("删除失败" , U('Admin/Config/index?p='.I('get.p')));
            }
        }
}
