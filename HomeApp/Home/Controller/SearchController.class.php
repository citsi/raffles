<?php
// 88购物搜索页
class SearchAction extends BaseAction {
	//初始化操作
    protected function _initialize(){
    	load('extend');
    	import('Lib.Widget.HomeWidget.Ad_manageWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.BrandWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.UserpointWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.AnnouncementWidget',APP_PATH);
		parent::_initialize();	
	}

 	//搜索页
    public function index(){
		//左上方商品分类导航菜单
		$key_search = $_REQUEST['key_search'];

		$data=array();
		//搜索接口确定之后，传值到这里
		// $cate_list = D('Category')->where("catename = $key_search")->getList(0,true,'sort asc, id desc',0,10);
		$cate_list = D('Category')->getList(0,true,'sort asc, id desc',0,10);
		foreach ($cate_list as $key => $vo){
			$subdata = array();
			$item = $vo['id'];
			$subdata['catename'] = $vo['catename'];
			$subdata['keywords'] = $vo['keywords'];
			$subdata['title'] = $vo['title'];
			$subdata['sub_goods'] = D('Goods')->getChannelList($item);
			
			// $subdata['sub_goods'] = D('Goods')->getCateList($item);
			$subdata['sub_brand'] = D('Brand')->getList($item);
			$data[]=$subdata;
		}
		
		$this->assign('dataList',$data);
		$this->show();	
    }
}