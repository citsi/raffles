<?php
return array(
    
    'DB_TYPE' => 'mysql', // 数据库类型
    'DB_HOST' => 'qdm115937105.my3w.com', // 服务器地址
    'DB_NAME' => 'qdm115937105_db', // 数据库名
    'DB_USER' => 'qdm115937105', // 用户名
    'DB_PWD' => 'jqqhtyhwrx1001', // 密码
    'DB_PORT' => 3306, // 端口
    'DB_PREFIX' => 'raffles_', // 数据库表前缀
    'DB_CHARSET'=> 'utf8', // 字符集
    'SHOW_ERROR_MSG' => false, // 显示错误信息
    'LOG_RECORD'            =>  true,  // 进行日志记录
    'LOG_EXCEPTION_RECORD'  =>  true,    // 是否记录异常信息日志
    'LOG_LEVEL'             =>  'DEBUG',  // 允许记录的日志级别
    'DB_FIELDS_CACHE'       =>  false, // 字段缓存信息
    'DB_SQL_LOG'            =>  true, // 记录SQL信息
    'TMPL_CACHE_ON'         =>  false,        // 是否开启模板编译缓存,设为false则每次都会重新编译
    'TMPL_STRIP_SPACE'      =>  false,       // 是否去除模板文件里面的html空格与换行
    'SHOW_ERROR_MSG'        =>  true,    // 显示错误信息
    'URL_CASE_INSENSITIVE'  =>  false,  // URL区分大小写
	'TOKEN_ON'=>true,
	'TOKEN_NAME'=>'__hash__',
	'TOKEN_TYPE'=>'md5',

	
);
