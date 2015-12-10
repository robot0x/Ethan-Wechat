<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__IMG__'    	=> __ROOT__ . '/Home/img',
        '__CSS__'    	=> __ROOT__ . '/Home/css',
        '__JS__'     	=> __ROOT__ . '/Home/js',
    ),

	'DATA_CACHE_PREFIX'    => 	'yunzhi_ethan_Home', 	// 缓存前缀
	'MODULE_ALLOW_LIST'    =>  	array('Home'),			//允许访问模块
	'DEFAULT_MODULE'       =>   'Home',  				// 默认模块
	'SESSION_PREFIX'       =>  	'yunzhi_ethan_Home', 	// session 前缀
	'COOKIE_PREFIX'        =>  	'yunzhi_ethan_Home', 	// Cookie前缀 避免冲突
);
    
