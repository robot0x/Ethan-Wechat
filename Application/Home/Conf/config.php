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
    'SESSION_PREFIX'    => 'yunzhi_home', //session前缀
    'COOKIE_PREFIX'     => 'yunzhi_home_', //Cookie前缀 避免冲突
     
    // 'APPID'          => 'wx426b3015555a46be',
    'APPID'             => 'wx53bf06122618f768',   
    // 'APPSECRET'             => 'bb721eba1ceb506c78f46aa9451e2104', 
    'APPSECRET'         => 'c1c300ea63649dba1cedd8b400a2f377', 
    'MCHID'             => '1225312702',
    'KEY'               => 'e10adc3949ba59abbe56e057f20f883e',
             
    'JSSDK_URL'         => 'http://192.168.1.100/Ethan-wechat/Public/', //JSSDK配置的安全地址取根目录
    'SSLCERT_PATH'      => '../cert/apiclient_cert.pem',
    'SSLKEY_PATH'       => '../cert/apiclient_key.pem',
);