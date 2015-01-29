<?php
namespace Home\Controller;
use Think\Controller;
class BaseController extends Controller {
    //初始化操作
    protected function _initialize(){
		//顶部频道菜单
	    $channel_list = D('Channel')->getList();
        $this->assign('channel_list',$channel_list);
	}
}