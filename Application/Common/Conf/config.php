<?php
return array(

    'YUNZHI_PAGE_SIZE'      => 10,          //默认分页大小

    'TMPL_TEMPLATE_SUFFIX'  => '.tpl',     // 默认模板文件后缀
    'ACTION_SUFFIX'         => 'Action',//设置ACTION前缀为action
    'TAGLIB_PRE_LOAD'       => 'Yunzhi,Html',   // 需要额外加载的标签库(须指定标签库名称)，多个以逗号分隔 
    'DEFAULT_PASSWORD'      => 'mengyunzhi',
    
    /* 数据缓存设置 */
    'DATA_CACHE_TYPE'       =>  'File', // 数据缓存类型

    'DB_TYPE'               =>  'mysqli',     // 数据库类型
    'DB_HOST'               =>  'callme119.mysql.rds.aliyuncs.com',    // 服务器地址
    'DB_NAME'               =>  'ethan_wechat',          // 数据库名
    'DB_USER'               =>  'ethan_wechat',      // 用户名
    'DB_PWD'                =>  'Q25jV6UiCOJAg584VvQllRrvWh0ALDyF',          // 密码
    'DB_PORT'               =>  '3633',             // 端口
    'DB_PREFIX'             =>  'ethan_',           // 数据库表前缀

    'DB_TYPE'               =>  'mysqli',     // 数据库类型
    'DB_HOST'               =>  'localhost',    // 服务器地址
    'DB_NAME'               =>  'ethan_wechat',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  '',          // 密码
    'DB_PORT'               =>  '3306',             // 端口
    'DB_PREFIX'             =>  'ethan_',           // 数据库表前缀

    'URL_MODEL'             =>  1, // URL访问模式,可选参数0、1、2、3,代表以下四种模式：

    //开启令牌验证
    'TOKEN_ON'              =>    false,            // 是否开启令牌验证 默认关闭
    'TOKEN_NAME'            =>    '__hash__',       // 令牌验证的表单隐藏字段名称，默认为__hash__
    'TOKEN_TYPE'            =>    'md5',            //令牌哈希验证规则 默认为MD5
    'TOKEN_RESET'           =>    true,             //令牌验证出错后是否重置令牌 默认为true
    
    //微信公众号设置 
    'TOKEN'                 => 'yunzhi',                                    // TOKEN
    'APPID'                 => 'wx67a290d19255a9b6', 
    'APPID'                 => 'wx53bf06122618f768', 
     
    'MCHID'                 => '1284542901',// MCHID：商户号（必须配置，开户邮件中可查看）
    'KEY'                   => 'e10adc3949ba59abbe56e057f20f883e',//KEY：商户支付密钥，参考开户邮件设置（必须配置，登录商户平台自行设置） * 设置地址：https://pay.weixin.qq.com/index.php/account/api_cert
     
     // * APPSECRET：公众帐号secert（仅JSAPI支付的时候需要配置， 登录公众平台，进入开发者中心可设置），
     // * 获取地址：https://mp.weixin.qq.com/advanced/advanced?action=dev&t=advanced/dev&token=2005451881&lang=zh_CN
    'APPSECRET'             => 'c1c300ea63649dba1cedd8b400a2f377',

    //=======【证书路径设置】=====================================
    /**
     * 证书路径,注意应该填写绝对路径（仅退款、撤销订单时需要，可登录商户平台下载，
     * API证书下载地址：https://pay.weixin.qq.com/index.php/account/api_cert，下载之前需要安装商户操作证书）
     * @var path
     */
    // 'SSLCERT_PATH'          => '../cert/apiclient_cert.pem',
    // 'SSLKEY_PATH'           => '../cert/apiclient_key.pem',
    
    //=======【curl代理设置】===================================
    /**
     * TODO：这里设置代理机器，只有需要代理的时候才设置，不需要代理，请设置为0.0.0.0和0
     * 本例程通过curl使用HTTP POST方法，此处可修改代理服务器，
     * 默认CURL_PROXY_HOST=0.0.0.0和CURL_PROXY_PORT=0，此时不开启代理（如有需要才设置）
     * @var unknown_type
     */
    'CURL_PROXY_HOST'       => "0.0.0.0",       //"10.152.18.220";
    'CURL_PROXY_PORT'       => 0,               //8080;
    
    //=======【上报信息配置】===================================
    /**
     * TODO：接口调用上报等级，默认紧错误上报（注意：上报超时间为【1s】，上报无论成败【永不抛出异常】，
     * 不会影响接口调用流程），开启上报之后，方便微信监控请求调用的质量，建议至少
     * 开启错误上报。
     * 上报等级，0.关闭上报; 1.仅错误出错上报; 2.全量上报
     * @var int
     */
    'REPORT_LEVENL'         => 1,

    

);
