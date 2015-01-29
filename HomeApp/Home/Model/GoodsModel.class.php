<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------

class GoodsModel extends BaseModel {
    /**
     * 获取频道下商品信息
     * @param  int $cid 频道ID
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     商品信息
     * @author Helaoshi
   */    
    public function getChannelList($cid=0, $field = true, $orders = 'sort asc, id desc', $first = 0, $pagenums = 0){
         /* 获取分类信息 */
        $map = array();
        $cmap = array();
        $submap = array();
        $map['is_del'] = 0;
        if(is_numeric($cid)){ //频道ID是否为数值格式
            $cmap['channel_id'] = intval($cid);  
        }  else {
            $cmap['channel_id'] = 0;  
        }

        $cate_result=M('Channel_category')->where($cmap)->select();

        $cate_wherearr=array();
        if(count($cate_result)>0)
        {
            foreach ($cate_result as $cate_key => $cate_vo) {
                $cate_wherearr[]=$cate_vo['cate_id'];
            }    
            $submap['category_id'] = array('in',$cate_wherearr);                
        } else {
            $submap['category_id'] = 0;
        }

        $goods_result=M('Category_goods')->where($submap)->order('id desc')->limit(30)->select();
        $wherearr=array();
        if(count($goods_result)>0)
        {
            foreach ($goods_result as $goods_key => $goods_vo) {
                $wherearr[]=$goods_vo['goods_id'];
            }    
            $map['id'] = array('in',$wherearr);                
        } else {
            $map['id'] = 0;
        }

        return parent::getMapList($map, $field,$orders,$first,$pagenums); 
    } 

    /**
     * 获取分类下商品信息
     * @param  int $cateid 分类ID
     * @param  int $goods_type 商品类型
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     商品信息
     * @author Helaoshi
   */    
    public function getCateList($cateid=0, $goods_type=-1, $field = true, $orders = 'sort asc, id desc', $first = 0, $pagenums = 0){
         /* 获取分类信息 */
        $map = array();
        $submap = array();
        $map['is_del'] = 0;
        if(is_numeric($cateid)){ //频道ID是否为数值格式
            $submap['category_id'] = intval($cateid);  
        }  else {
            $submap['category_id'] = 0;  
        }

        $goods_result=M('Category_goods')->where($submap)->order('id desc')->limit(30)->select();

        $wherearr=array();
        if(count($goods_result)>0)
        {
            foreach ($goods_result as $goods_key => $goods_vo)
            {
                $wherearr[]=$goods_vo['goods_id'];
            }    
            $map['id'] = array('in',$wherearr);                
        } else {
            $map['id'] = 0;
        }

        if(is_numeric($goods_type)&&intval($goods_type)>=0)
        {
            $submap['goods_type'] = $goods_type;
        }

        return parent::getMapList($map, $field,$orders,$first,$pagenums); 
    }       

}
