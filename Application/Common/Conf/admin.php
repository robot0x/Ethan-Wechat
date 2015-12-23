<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__BOW__'    	=> __ROOT__ . '/Admin/bower_components',
        '__DIST__'      => __ROOT__ . '/Admin/dist',
        '__CSS__'    	=> __ROOT__ . '/Admin/css',
        '__JS__'     	=> __ROOT__ . '/Admin/js',
    ),

	'DATA_CACHE_PREFIX'    => 	'yunzhi_ethan_admin', 	// 缓存前缀
	'MODULE_ALLOW_LIST'    =>  	array('Admin'),			//允许访问模块
	'DEFAULT_MODULE'       =>   'Admin',  				// 默认模块
	'SESSION_PREFIX'       =>  	'yunzhi_ethan_admin', 	// session 前缀
	'COOKIE_PREFIX'        =>  	'yunzhi_ethan_admin', 	// Cookie前缀 避免冲突
);

