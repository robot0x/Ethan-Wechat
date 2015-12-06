<?php
namespace Home\Model;

use Think\Model;

class HomeModel extends Model
{
    protected $p = 1;           //当前页
    protected $pageSize = 20;   //
    protected $totalCount = 0;
    protected $errors = array();
    protected $orderBys = array("id"=>"desc");   //排序方式
    protected $maps = array();       //

    public function __construct()
    {
        $this->p = (int)I('get.p');
        $this->pageSize = C("YUNZHI_PAGE_SIZE") ? C("YUNZHI_PAGE_SIZE") : 20;
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

    public function setOrderBys($orderBys)
    {
        if(is_array($orderBys))
        {
            $this->orderBys = $orderBys;
        }
        else
        {
            $this->setError("HomeModel:setOrderBys 传入的排序字段格式必须为数组");
        }
        return $this;
    }

    public function getOrderBys()
    {
        return $this->orderBys;
    }

    public function addOrderBys($order, $by)
    {
        $this->orderbys["$by"] = $order;
        return $this;
    }

    public function subOrderBys($by)
    {
        unset($this->orderBys["$by"]);
        return $this;
    }

    public function setError($error)
    {
        $this->error = $error;
        $this->errors[] = $error;
        return;
    }

    public function getError()
    {
        return $this->error;
    }

    public function getErrors()
    {
        return $this->errors();
    }

    /**
     * 如果未传入第二个参数，则第一个参数必须为数组，进行合并。
     * @param [type] $key   [description]
     * @param [type] $value [description]
     */
    public function addMaps($key, $value = null)
    {
        if($value === null)
        {
            if(!is_array($key))
            {
               $this->setError("HomeModel:addMaps 您传入的变量类型需要为带有键值的数组");
               return $this;
            }
            $this->maps = array_merge($this->maps , $key);
        }
        else
        {
            $this->maps["$key"] = $value;  
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
            $this->setError("HomeModel:setMaps 传入的变量类型非数组");
            return $this;
        }
        $this->maps = $maps;
    }

    public function getListbyId($id, $pk = "id")
    {
        if((int)$id === 0)
        {
            $this->setError("HomeModel:getListbyId id类型不是INT或是传入的ID值为空");
            return $this;
        }

        try
        {
            $list = $this->where("$pk = $id")->find();
            return $list;
        }
        catch(\Think\Exception $e)
        {
            $this->setError($e->getMessage());
            return $this;
        }
    }

    public function getLists($fields = array(), $maps = array())
    {
        if(empty($maps))
        {
            $maps = $this->maps;
        }

        $lists = $this->
                field($fields)->
                where($maps)->
                order($this->orderBys)->
                page($this->p, $this->pageSize)->
                select();
        $this->_getCounts($maps);
        return $lists;
    }

    public function getAllLists($maps = null)
    {
        if($maps === null)
        {
            $maps = $this->maps;
        }

        $lists = $this->
                where($maps)->
                field($this->fields)->
                select();
        $this->_getCounts($maps);
        return $lists;
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
        C("YUNZHI_P", $this->p);
    }
}