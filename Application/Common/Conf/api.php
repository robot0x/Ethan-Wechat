<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__IMG__'    	=> __ROOT__ . '/Api/img',
        '__CSS__'    	=> __ROOT__ . '/Api/css',
        '__JS__'     	=> __ROOT__ . '/Api/js',
    ),

	'DATA_CACHE_PREFIX'    => 	'yunzhi_ethan_Api', 	// 缓存前缀
	'MODULE_ALLOW_LIST'    =>  	array('Api'),			//允许访问模块
	'DEFAULT_MODULE'       =>   'Api',  				// 默认模块
	'SESSION_PREFIX'       =>  	'yunzhi_ethan_Api', 	// session 前缀
	'COOKIE_PREFIX'        =>  	'yunzhi_ethan_Api', 	// Cookie前缀 避免冲突
);
    
