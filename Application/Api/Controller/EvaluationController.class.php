<?php
/**
 * 用户评价信息
 * panjie
 */
namespace Api\Controller;

use EvaluationCustom\Logic\EvaluationCustomLogic;
use Evaluation\Logic\EvaluationLogic;

class EvaluationController extends ApiController
{
	/**
	 * 获取评论信息
	 * panjie
	 * @return jsonLists 
	 */
	public function getEvaluationsAction()
	{
		$this->ajaxReturn($this->getEvaluations());
	}

	/**
	 * 获取评论信息
	 * panjie
	 * @return list 
	 */
	public function getEvaluations()
	{
		//实例化
		$EvaluationCustomL = new EvaluationCustomLogic();
		$evaluationCustoms = $EvaluationCustomL->getLists();

		//将url信息转换为数组信息
		foreach($evaluationCustoms as $key => $value)
		{
			$evaluationCustoms["$key"]["url"] = explode(",", $value["url"]);
		}

		//返回
		$data = array("status"=>"success");
		$data['data'] = $evaluationCustoms;

		return $data;
	}

	/*
     * 上传微信服务器图片至本地服务器
     * 返回图片ID
     */
    public function uploadImageAction()
    {
        $serverId = I('get.serverId','');
        $openid = I('get.openid','');
        if($serverId == '' || $openid == '')
        {
            return false;
        }
        
        //接收身份证信息并抓取上传服务器，返回身份证附件ID
        $EvaluationL = new EvaluationLogic();
        $EvaluationL->setOpenid($openid);
        $result = $EvaluationL->getAndUploadWxImage($serverId);
        $this->ajaxReturn($result);
    }
}
}