<?php
//防入侵。
( defined("_YUNZHI_HOME")
    || defined("_YUNZHI_ADMIN")
    || defined("_YUNZHI_API")
) or die("access not allowed");

return array(
    'TMPL_TEMPLATE_SUFFIX'  =>  '.tpl',     // 默认模板文件后缀

    /* 数据缓存设置 */
    'DATA_CACHE_PREFIX' => 'onethink_', // 缓存前缀
    'DATA_CACHE_TYPE'   => 'File', // 数据缓存类型

	'DB_TYPE'               =>  'mysqli',     // 数据库类型
    'DB_HOST'               =>  '127.0.0.1',    // 服务器地址
    'DB_NAME'               =>  'Ethan-Wechat',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  '',          // 密码
    'DB_PORT'               =>  '3306',        // 端口

    'URL_MODEL'             =>  1, // URL访问模式,可选参数0、1、2、3,代表以下四种模式：

);
