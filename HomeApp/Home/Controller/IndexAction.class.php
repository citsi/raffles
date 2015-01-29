<?php
// 88购物首页
class IndexAction extends BaseAction {
	//初始化操作
    protected function _initialize(){
    	load('extend');
    	import('Lib.Widget.HomeWidget.Ad_manageWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.BrandWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.UserpointWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.AnnouncementWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.Company_articleWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.Company_homeWidget',APP_PATH);
		parent::_initialize();	
	}

	//首页
    public function index(){
		//左上方商品分类导航菜单
	    $cate_list = D('Category')->getList(0,true,'sort asc, id desc',0,10);
        $this->assign('cate_list',$cate_list);

		//核心商品模块
		$data=array();
		$data_list= D('Channel')->getList(true,2);
		foreach ($data_list as $key => $vo) {
			$subdata=array();
			$item = $vo['id'];
			$subdata['channel_name']=$vo['channelname'];
			$subdata['eng_name']=$vo['eng_name'];
			$subdata['style_name']=$vo['style_name'];
			$subdata['sub_brand']=D('Brand')->getChannelList($item);
			$subdata['sub_cate']=D('Channel')->getCateList($item);
			$subdata['sub_goods']=D('Goods')->getChannelList($item);
			$data[]=$subdata;
		}        

        $this->assign('dataList',$data);
        
		$this->show();
    }
}