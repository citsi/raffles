<?php
namespace Home\Controller;
use Think\Controller;
class ProductController extends Controller
{
	function index()
	{
//        $map = array();
//        $map = " 1=1 ";
//        if($_POST['cat_id']){
//            $map .= "and cat_id = $_POST['cat_id']";
//        }
//        if($_POST['brand_id']){
//            $map .= "and brand_id = $_POST['brand_id']";
//        }

        $cate = D('Category')->getCategoryList();
        $this->assign("data",$cate);


        $brand = D('Brand')->getBrandList();
        $this->assign("brand",$brand);



        $goods = D('Goods')->getGoodsList();
        $this->assign("list",$goods);
        $this->display();

    }


}
