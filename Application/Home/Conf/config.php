<?php
return array(
    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__IMG__'       => __ROOT__ . '/img',
        '__CSS__'       => __ROOT__ . '/css',
        '__JS__'        => __ROOT__ . '/js',
        '__LIB__'       => __ROOT__ . '/lib',
    ),

    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' => 'yunzhi_', //session前缀
    'COOKIE_PREFIX'  => 'yunzhi_', //Cookie前缀 避免冲突
   
);