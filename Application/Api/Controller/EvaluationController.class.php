<?php
/**
 * 用户评价信息
 * panjie
 */
namespace Api\Controller;

use EvaluationCustom\Logic\EvaluationCustomLogic;   //评论--客户
use Evaluation\Logic\EvaluationLogic;               //评论
use EvaluationView\Logic\EvaluationViewLogic;       //评价视图
use Jssdk\Logic\JssdkLogic;                         //微信JSSDK

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
		$EvaluationViewL = new EvaluationViewLogic();
        $maps['status'] = 0;
        $EvaluationViewL->setMaps($maps);
		$evaluationCustoms = $EvaluationViewL->getLists();

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

    /**
     * 添加新评论
     * panjie
     */
    public function addAction()
    {   
        $return['status']   = "error";
        $url                = "";
        
        //取值
        $list = I('get.');
        $serverIds = explode(",", $list['server_ids']); 

        //抓取图片并上传到服务器
        $JssdkL = new JssdkLogic();
        $urls = $JssdkL->saveImageByserverIds($serverIds);
        if ($urls !== false)
        {            //转换为字符串并加入list
            $url = implode(',', $urls); 
        }
        
        $list['url'] = $url;
        //存评论信息
        $EvaluationL = new EvaluationLogic();
        if (!$evaluationId = $EvaluationL->saveList($list))
        {
            $return['message'] = '4:数据保存错误：';
            echo json_encode($return);
            return;
        }

        $return['status'] = "success";
        echo json_encode($return);
    }
}
