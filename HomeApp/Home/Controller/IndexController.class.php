<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function indexAction(){
        /* $channel = D('Channel')->getList(true,5);
        $temp = array();
        foreach ($channel as $k=>$v){
            $temp['id'] = $v["id"];
            $temp['channelname'] = $v["channelname"];
            $temp['description'] = $v["description"];
        } */
//         $this->assign('temp',$temp);
        $dsjds = "gdashgfwejhf";
        $this->assign('array',$dsjds);
    }       
     public function  goodsAction(){
         $Goods = D('Goods')->getChannelList('1',true, 'sort asc, id desc', 0, 0);
         $array_goods = array();
         foreach ($Goods as $k=>$v){
             $array_goods['id'] = $v['id'];
             $array_goods['name'] = $v['goods_name'];
             $array_goods['pic'] = $v['img'];
         }
         print_r($array_goods);
        $this->assign('array_goods',$array_goods);
        $this->show();        
    }
    
}