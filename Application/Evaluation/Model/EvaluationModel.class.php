<?php
/**
 * 评价
 */
namespace Evaluation\Model;

use Yunzhi\Model\YunzhiModel;

class EvaluationModel extends YunzhiModel
{
	protected $_auto = array(
		array("create_time", "time", 1, "function"),
		);
}