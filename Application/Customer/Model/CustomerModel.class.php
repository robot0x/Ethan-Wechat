<?php
namespace Customer\Model;

use Yunzhi\Model\YunzhiModel;

class CustomerModel extends YunzhiModel {
	/**
	 * 通过ID获取客户的信息
	 * 由于yunzhimodel中的getListById只能传入INT类型的数据
	 * 所以在这里，我们对父类的方法进行重写
	 * @param  string $id 长度28
	 * @return string 错误或记录为空返回 FALSE
	 * panjie
	 */
	public function getListById($id)
	{
		//判断传入ID长度是否为28位
		if (strlen($id) !== 28)
		{
			$this->setError("CustomerL: The customer id:$id length must be 28(客户的ID必须是28位的字符)");
			return false;
		}

		//查询信息并返回
		$map = array();
		$map['id'] = $id;
		try {
			if (!$list = $this->where($map)->find())
			{
				$this->setError("The data of id:$id not found(记录为$id的数据未找到)");
				return false;
			}
			return $list;
		} catch (\Think\Exception $e) {
			$this->setError("CustomerL: sql find error（数据查询错误）:" . $e->getMessage());
			return false;
		}
	}
}