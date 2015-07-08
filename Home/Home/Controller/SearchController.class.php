<?php
namespace Home\Controller;
use Think\Controller;
class SearchController extends Controller
{
	function index()
	{

        $keyword= I('words');//获取分类的英文名称
//        $key=I('get.order');
//        $sort=I('get.sort');
//        if(isset($key)){
//
//            if($key=="1"){ $listsort="view"." ".$sort;}
//            if($key=="2"){ $listsort="id"." ".$sort;}
//            if($key=="3"){  $listsort="price"." ".$sort;}
//            if($key=="4"){  $listsort="sale"." ".$sort;}
//        }
//        if(empty($key)){$key="1";
//            $see="asc";
//            $order="view";
//            $sort="asc";
//            $listsort=$order." ".$sort;
//        }
//
//        if($sort=="asc"){$see="desc";}
//        if($sort=="desc"){$see="asc";}
//        $this->assign('see',$see);
//        $this->assign('order',$key);
//        $this->assign('value',$sort);

        $map['goods_name']  = array('like','%'.$keyword.'%');
        $count=M('Goods')->where($map)->count();
        $Page= new \Think\Page($count,12);
        $Page->setConfig('prev','上一页');
        $Page->setConfig('next','下一页');
        $Page->setConfig('first','第一页');
        $Page->setConfig('last','尾页');
        $Page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        $show= $Page->show();
        $list=M('Goods')->where($map)->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);
        $this->display();

    }


}
