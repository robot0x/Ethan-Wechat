<?php
/**
 * 评价
 * panjie
 */
namespace Evaluation\Logic;

use Evaluation\Model\EvaluationModel;

class EvaluationLogic extends EvaluationModel
{
	/**
	 * 冻结、解冻某条记录
	 * @param  int $id 
	 * @return $this     
	 */
	public function freezeListById($id)
	{
		$id = (int)$id;

		//取出记录
		if (!$list = $this->getListById($id))
		{
			$this->setError("EvaluationLogic Error:出错信息" . $this->getError());
			return $this;
		}

		//进行位异或操作
		$list['status'] ^= 1;
		$this->save($list);
		return $this;
	}

	public function saveList($list)
	{
		//等级界于1至5之间
		$starLevel = (int)$list['star_level'] > 0 ? ((int)$list['star_level'] < 6 ? (int)$list['star_level'] : 5) : 1 ;
		
		$data = array();
		$data['id'] 		= (int)$list["id"];
		$data['star_level'] = $starLevel;
		$data['url'] 		= $list['url'];
		$data['evaluation'] = $list['evaluation'];

		//加入更新时间
		if(isset($list['update_time']) && ($list['update_time'] !== date_to_int($list['update_time'])))
		{
			$data['update_time'] = date_to_int($list['update_time']);
		}
		else
		{
			$data['update_time'] = time();
		}

		if (isset($list['user_id']))
		{
			$data['user_id'] = $list['user_id'];
		}

		return parent::saveList($data);
	}
}