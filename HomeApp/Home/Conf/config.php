<?php
if (!defined('APP_PATH')) exit();
$dbconfig = require './config/dbconfig.php';
$config=array(
	'APP_GROUP_LIST' => 'Home,Manage,Company,User', //项目分组设定
	'DEFAULT_GROUP'  => 'Home', //默认分组
	'TMPL_PARSE_STRING'  =>array(
	'__PUBLIC__' => STYLE_PATH.'Skin', // 更改默认的__PUBLIC__ 替换规则
      ),
   'ACTION_SUFFIX'      =>  'Action', // 操作方法后缀
    'TMPL_L_DELIM'=>'{{',
    'TMPL_R_DELIM'=>'}}',
);
return array_merge($dbconfig, $config);
?>