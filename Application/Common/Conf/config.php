<?php
return array(

    'YUNZHI_PAGE_SIZE'      => 10,          //默认分页大小

    'TMPL_TEMPLATE_SUFFIX'  => '.tpl',     // 默认模板文件后缀
    'ACTION_SUFFIX'         => 'Action',//设置ACTION前缀为action
    'TAGLIB_PRE_LOAD'       => 'Yunzhi,Html',   // 需要额外加载的标签库(须指定标签库名称)，多个以逗号分隔 
    'DEFAULT_PASSWORD' => 'mengyunzhi',
    
    /* 数据缓存设置 */
    'DATA_CACHE_TYPE'       =>  'File', // 数据缓存类型

    'DB_TYPE'               =>  'mysqli',     // 数据库类型
    'DB_HOST'               =>  'callme119.mysql.rds.aliyuncs.com',    // 服务器地址
    'DB_NAME'               =>  'ethan_wechat',          // 数据库名
    'DB_USER'               =>  'ethan_wechat',      // 用户名
    'DB_PWD'                =>  'Q25jV6UiCOJAg584VvQllRrvWh0ALDyF',          // 密码
    'DB_PORT'               =>  '3633',             // 端口
    'DB_PREFIX'             =>  'ethan_',           // 数据库表前缀

    'URL_MODEL'             =>  1, // URL访问模式,可选参数0、1、2、3,代表以下四种模式：

    'TOKEN'                 => 'yunzhi', // TOKEN
    'APPID'                 => 'wxc92a0067c6338cbf', //应用ID
    'APPSECRET'             => 'bb721eba1ceb506c78f46aa9451e2104', // APPSECRET

    //开启令牌验证
    'TOKEN_ON'              =>    false,  // 是否开启令牌验证 默认关闭
    'TOKEN_NAME'            =>    '__hash__',    // 令牌验证的表单隐藏字段名称，默认为__hash__
    'TOKEN_TYPE'            =>    'md5',  //令牌哈希验证规则 默认为MD5
    'TOKEN_RESET'           =>    true,  //令牌验证出错后是否重置令牌 默认为true

);
