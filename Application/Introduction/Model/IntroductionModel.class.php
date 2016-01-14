<?php

/**
 * 酒店介绍
 * panjie
 */

namespace Introduction\Model;

use Yunzhi\Model\YunzhiModel;

class IntroductionModel extends YunzhiModel
{
	protected $_validate = array(
		array("hotel_phone","/^1[0-9]{10}$/","the phone num length not 11",3, 'regex'),//验证手机号码
		);

}