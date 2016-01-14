<?php 
/**
 * 积分
 * J
 *data:2016/1/12
 */

namespace Credit\Logic;

use Credit\Model\CreditModel;
use Customer\Logic\CustomerLogic;
/**
* 
*/
class CreditLogic extends CreditModel
{

	public function getFirstLists(){

		$CustomerL = new CustomerLogic();
		$cus = $CustomerL -> getAllLists();

		foreach ($cus as $key => $value) {
			
			$maps[] = array("customer_id" => $value['id'],"nickname" =>$value['nickname'] );
			
		}

		foreach ($maps as $key => $value) {
			
			$list[$key] = $this ->order('id desc')-> where($value) ->find();
			$list[$key]["nickname"] = $value['nickname'];

		}
		return $list;	
	}

	/**
     * 获取获取数据信息
     */

    public function getListbyCustomerId($id)
    {
    	$maps["customer_id"] = $id;
    	$map = array('id' => $id);
    	$list = $this ->setMaps($maps) ->getAllLists();

    	$CustomerL = new CustomerLogic();
    	$cus = $CustomerL ->where($map)->find();

    	foreach ($list as $key => $value) {

    		$value["nickname"]= $cus['nickname'];
    		$tem[$key] = $value ;


    	}
    	return $tem;

    }

    public function getElembyId($value='')
    {
    	# code...
    }

	
}
 
?>