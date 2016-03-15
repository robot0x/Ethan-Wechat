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

        //取值
        $list = I('get.');

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
    /**
     * 通过微信上传图片返回的serverId，进行图片的抓取，并存在服务器
     * xulinjie
     * @return 
     */
    public function saveImageByserverIdAction($serverId)
    {
        $return['status']   = "error";
        $return['url']      = "";      //返回的图片地址
        if ($serverId == "")
        {
            $return['message'] = 'JssdkL:saveImageByserverId.The input type is null string.传入的变量类型是空字符串';
            echo json_encode($return);
            return;
        }
         //抓取图片并上传到服务器
        $JssdkL = new JssdkLogic();
        if (!$url = $JssdkL->getAndUploadWxImage($serverId))
        {
            $return['message'] = '4:图片信息下载保存错误：';
            echo json_encode($return);
            return;
        }
        $return['status'] = "success";
        $return['url'] = $url;
        echo json_encode($return);
    }
}
