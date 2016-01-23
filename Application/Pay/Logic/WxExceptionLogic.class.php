<?php
/**
 * 
 * 微信支付API异常类
 * @author denghaoyang
 *
 */
class WxExceptionLogic extends Exception {
	
	public function errorMessage()
	{
		return $this->getMessage();
	}
	
}