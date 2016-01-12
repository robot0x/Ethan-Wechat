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
    'SESSION_PREFIX' => 'yunzhi_home', //session前缀
    'COOKIE_PREFIX'  => 'yunzhi_home_', //Cookie前缀 避免冲突
     
    'APPID' = 'wx426b3015555a46be',
    'MCHID' = '1225312702',
    'KEY' = 'e10adc3949ba59abbe56e057f20f883e',
    'APPSECRET' = '01c6d59a3f9024db6336662ac95c8e74',

    'SSLCERT_PATH' = '../cert/apiclient_cert.pem',
    'SSLKEY_PATH' = '../cert/apiclient_key.pem',
);