<?php

//生成安全文件
define('BUILD_DIR_SECURE',true);
define('DIR_SECURE_FILENAME', 'index.html,index.htm');
define('DIR_SECURE_CONTENT', 'deney Access!');

define('APP_DEBUG', true);//开发完后删除此定义
define('APP_NAME', 'HomeAPP');
define('APP_PATH', './HomeApp/');
define('STYLE_PATH', '/raffles/HomeApp/');
define('UPLOAD_PATH', './Upload');
define('RUNTIME_PATH', './_runtime/home/');
// 加载框架入口文件
require( "./core/core.php");