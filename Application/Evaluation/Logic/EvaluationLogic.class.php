<?php
/**
 * 客户评价
 * @author denghaoyang
 * 评价
 * panjie
 */
namespace Evaluation\Logic;

use Evaluation\Model\EvaluationModel;

class EvaluationLogic extends EvaluationModel
{

    private $openid;

    public function setOpenid($openid) {
        $this->openid = $openid;
    }

    /*
     * 获取微信服务器上传的图片
     * 1.取得当前access_token()
     * 2.下载图片
     * 3.将图片信息存入附件表
     * 4.上传图片
     */
    public function getAndUploadWxImage($mediaId)
    {
        $access_token = get_access_token(); 
        //下载图片
        $url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=$access_token&media_id=$mediaId";
        $fileInfo = $this->downloadWeixinFile($url);
        return $this->saveWeixinFile($fileInfo);     
    }
    
    function downloadWeixinFile($url)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HEADER, 0);    
        curl_setopt($ch, CURLOPT_NOBODY, 0);    //只取body头
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $package = curl_exec($ch);
        $httpinfo = curl_getinfo($ch);
        curl_close($ch);
        $imageAll = array_merge(array('header' => $httpinfo), array('body' => $package)); 
        return $imageAll;
    }
    /*
     * 存文件
     * 1.存数据库，返回ID
     * 2.将ID做为文件名
     * 3.按openid分文件夹上传附件
     */
    function saveWeixinFile($fileInfo)
    {
        $filecontent = $fileInfo["body"];
        $header = $fileInfo["header"];
        $documentRoot = I('server.DOCUMENT_ROOT');
        $savePath = "./Evaluation/" . $this->openid . "/";
        $saveName = uniqid();
        
        //上传文件
        $savePath = $documentRoot . add_root_path("/Uploads" . substr($savePath, 1));
        if (!is_dir($savePath)) 
        {
            mkdir($savePath); // 如果不存在则创建
        }
        $fileName = $savePath . $data['savename']; 
        $local_file = fopen($fileName, 'w');
        if (false !== $local_file){
            if (false !== fwrite($local_file, $filecontent)) {
                fclose($local_file);
            }
        }
        return $fileName;
    }
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