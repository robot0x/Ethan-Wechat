<?php
return array(

    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__IMG__'    	=> __ROOT__ . '/Admin/img',
        '__CSS__'    	=> __ROOT__ . '/Admin/css',
        '__JS__'     	=> __ROOT__ . '/Admin/js',
    ),

    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' 	=> 'yunzhi_admin', //session前缀
    'COOKIE_PREFIX'  	=> 'yunzhi_admin_', //Cookie前缀 避免冲突
);
