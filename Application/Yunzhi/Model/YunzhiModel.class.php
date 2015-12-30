<?php
namespace Yunzhi\Model;

use Think\Model;

class YunzhiModel extends Model
{
    protected $p            = 1;                    //当前页
    protected $pageSize     = 20;                   //每页多少条记录
    protected $totalCount   = 0;                    //总条数
    protected $errors       = array();              //错误信息
    protected $orderBys     = array("id"=>"desc");      //排序字段方式
    protected $maps         = array();              //查询条件
    protected $keywords     = "";                   //查询关键字
    protected $field        = "title";              //查询字段
    protected $pk           = "id";                 //主键

    public function __construct()
    {
        $this->p        = (int)I('get.p');
        $this->pageSize =   (I("get.pagesize") !== "") ? I("get.pagesize") : 
                            (C("YUNZHI_PAGE_SIZE") ? C("YUNZHI_PAGE_SIZE") : 20);

        $this->keywords = trim(I('get.keywords'));
        $this->field    = (I('get.field') === "" || (int)I('get.field')) ? $this->field : I('get.field');

        if (trim(I('get.filed')) !== "")
        {
            $filed = trim(I('get.field'));
        }

        if($this->keywords !== "")
        {
            $this->maps[$this->field] = array("like", "%" . $this->keywords . "%");
        }
        
        if (I("get.by") !== "")
        {
            $by = I("get.by");
            $order = I("get.order");
            $this->setOrderBys(array($by=>$order));
        }
        else if(I("get.order") !== "")
        {
            $by = "id";
            $order = I("get.order");
            $this->setOrderBys(array("$by"=>$order));
        }
        
        parent::__construct();
    }

    public function setP($p)
    {
        $this->p = (int)$p;
        return $this;
    }

    public function getP()
    {
        return $this->p;
    }

    public function setPageSize($pageSize)
    {
        $this->pageSize = (int)$pageSize;
        return $this;
    }

    public function getPageSize()
    {
        return $this->pageSize;
    }

    public function setTotalCount($totalCount)
    {
        $this->totalCount = (int)$totalCount;
        return $this;
    }

    public function getTotalCount()
    {
        return $this->totalCount;
    }

    public function addOrderBy($by, $order)
    {
        $order = ($order == "desc") ? "desc" : "asc";
        $this->orderBys["$by"] = $order;
        return $this;
    }

    public function subOrderBy($by)
    {
        unset($this->orderBys["$by"]);
        return $this;
    }

    public function setOrderBys($orderBys)
    {
        if(!is_array($orderBys))
        {
            $this->setError("yunzhimodel->setorderbys errors: orderbys must be array");
            return false;
        }
        $this->orderBys = $orderBys;
        return $this;
    }

    public function setError($error)
    {
        $this->error = $error;
        $this->errors[] = $error;
        return;
    }

    public function getErrors()
    {
        return $this->errors;
    }




    /**
     * 如果未传入第二个参数，则第一个参数必须为数组，进行合并。
     * @param [type] $map   [description]
     * @param [type] $value [description]
     */
    public function addMaps($map, $value = null)
    {
        if($value === null)
        {
            if(!is_array($map))
            {
               $this->setError("YunzhiModel:addMaps 您传入的变量类型需要为带有键值的数组");
               return $this;
            }
            $this->maps = array_merge($this->maps , $map);
        }
        else
        {
            $this->maps["$map"] = $value;  
        }
        
        return $this;
    }

    public function subMaps($key)
    {
        unset($this->maps["$key"]);
        return $this;
    }

    public function setMaps($maps)
    {
        if(!is_array($maps))
        {
            $this->setError("YunzhiModel:setMaps 传入的变量类型非数组");
            return $this;
        }
        $this->maps = $maps;
        return $this;
    }

    public function getMaps()
    {
        return $this->maps;
    }

    /**
     * 更新数据表（有ID则更新，无则添加）
     * @param  array $list 一维数据
     * @return int       数据关键字
     */
    public function saveList($list){
        try{
            if ($this->create($list))
            {
                if (isset($this->data[$this->pk]) && $this->data[$this->pk] !== '')
                {
                    $id = $this->save();
                }
                else
                {
                    $id = $this->add();
                }
                return $id;
            }
            else
            {
                $this->setError("data create false:" . $this->getError());
                return false;
            }
        }
        catch (\Think\Exception $e)
        {
            $this->setError = $e->getMessage();
            return false;
        }
    }

    /**
     * 删除ID为$id的数据
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function deleteList($id)
    {
        $map['id'] = (int)$id;
        $lists = $this->where($map)->delete();
        return $lists;
    }

    /**
     * 获取获取数据信息
     */

    public function getListbyId($id)
    {
        if ((int)$id === 0)
        {
            $this->setError("YunzhiModel:getListbyId id类型不是INT或是传入的ID值为空");
            return $this;
        }

        try
        {
            $pk = $this->pk;
            $maps = $this->maps;
            $maps["$pk"] = $id;
            $list = $this->where($maps)->find();
            return $list;
        }
        catch(\Think\Exception $e)
        {
            $this->setError($e->getMessage());
            return $this;
        }
    }
    /**
     * 获取当前页内容列表
     */

    public function getLists($fields = array(), $maps = array())
    {
        $page = $this->p . "," . $this->pageSize;
        $lists =    $this->
                    _getLists($fields, $maps)->         
                    page("$page")->
                    select();
        return $lists;
    }

    /**
     * 获取所有数据
     * @param  array  $fields [description]
     * @param  array  $maps   [description]
     * @return [type]         [description]
     */
    public function getAllLists($fields = array(), $maps = array())
    {
        $maps = array_merge($this->maps, $maps);
        $lists =    $this->
                    _getLists($fields, $maps)->
                    select();
        return $lists;
    }

    private function _getLists($fields = array(), $maps = array())
    {
        if (!is_array($fields) || !is_array($maps))
        {
            $this->setError("YunzhiModel:_getList 传入的参数类型有误");
            return $this;
        }

        if (empty($maps))
        {
            $maps = $this->maps;
        }

        // $orderBys = array();
        // foreach ($this->bys as $k => $by)
        // {
        //     $order = ($this->orders[$k] == "asc") ? "asc" : "desc";
        //     $orderBys[$by] = $order;
        // }

        $this->_getCounts($maps);
        
        return  $this->
                field($fields)->
                where($maps)->
                order($this->orderBys);
    }


    //重新计算当前页码及总数
    private function _getCounts()
    {
        $this->totalCount = $this->where($this->maps)->count();
        $this->p = (int)ceil($this->totalCount / $this->pageSize) > $this->p ?
                    (int)ceil($this->totalCount / $this->pageSize) :
                    $this->p;

        //利用C函数，向PAGE标签传值
        C("YUNZHI_TOTAL_COUNT", $this->totalCount);
        C("YUNZHI_PAGE_SIZE", $this->pageSize);
        C("YUNZHI_P", $this->p);
    }
}