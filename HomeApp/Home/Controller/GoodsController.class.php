<?php
// 88购物商城频道页
class GoodsAction extends BaseAction {
	//初始化操作
    protected function _initialize(){
    	load('extend');
    	import('Lib.Widget.HomeWidget.Ad_manageWidget',APP_PATH);
    	import('Lib.Widget.HomeWidget.BrandWidget',APP_PATH);
		parent::_initialize();	
	}

	//首页
    public function index(){
    	$channel_id=intval($_GET['channel_id']);

    	//频道一级分类
    	$cate_list=D('Channel')->getCateList($channel_id, 0, true, 7);
        $this->assign('cateList',$cate_list);

		
		$hit_data=array();		
		$hit_nums=0;
		$down_nums=0;
		$nums=0;
		foreach ($cate_list as $key => $vo) {
			//品牌抢购模块
			$hit_subdata=array();
			$hit_item = $hit_vo['id'];
			$hit_subdata['sub_goods']=D('Goods')->getChannelList($channel_id);

			$hit_nums=$hit_nums+count($hit_subdata['sub_goods']);
			$hit_data[]=$hit_subdata;

			//品牌折扣模块
            $down_subdata=array();
			$down_item = $down_vo['id'];
			$down_subdata['catename']=$down_vo['catename'];
			$down_subdata['sub_goods']=D('Goods')->getChannelList($channel_id);
			$down_nums=$down_nums+count($down_subdata['sub_goods']);
			$down_data[]=$down_subdata;

			//新品上市模块
			$subdata=array();
			$item = $vo['id'];
			$subdata['catename']=$vo['catename'];
			$subdata['sub_goods']=D('Goods')->getChannelList($channel_id);
			$nums=$nums+count($subdata['sub_goods']);
			$data[]=$subdata;
		} 
        $this->assign('hitlist',$hit_data);
        $this->assign('hit_nums',$hit_nums);

        $this->assign('downList',$down_data);
        $this->assign('down_nums',$down_nums);

        $this->assign('dataList',$data);
        $this->assign('nums',$nums);

        //右侧品牌
        $brand_list=D('Brand')->getChannelList($channel_id);
        $this->assign('brandList',$brand_list);
        
		$this->show();
    }
	
	//内容页
    public function detail(){

    	$item=intval($_GET['id']);
    	//查询商品信息
	    $record=D('Goods')->getOne($item);




        $this->assign('vo',$record);
        $this->show();
	
	}
}