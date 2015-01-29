<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------

class BrandModel extends BaseModel {
    /**
     * 
     * @param  int $recommend 
     * @param  boolean $field 
     * @param  string $orders
     * @param  int $first 
     * @param  int $pagenums
     * @return array     
     * @author Helaoshi
   */    
    public function getList($recommend=0, $field = true, $orders = 'sort asc, id desc', $first = 0, $pagenums = 0){
        /* 设置推荐条件 */
        $map = array();
        $map['status'] = 0;
        if(is_numeric($recommend)){ //推荐类型是否为数值格式
            $map['recommend'] = intval($recommend);
        } else { //不为数值格式，则默认为0
            $map['recommend'] = 0;
        }
        /* 获取数据对象*/ 
        return parent::getMapList($map, $field,$orders,$first,$pagenums);   
    } 
    /**
     *
     * @param  int $channel_id 
     * @param  int $recommend 推荐类型
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     品牌信息
     * @author suhengqiang
   */    
    public function getChannelList($channel_id=0, $recommend=1, $field = true, $orders = 'sort asc, id desc', $first = 0, $pagenums = 0){
        $condition = array();;
        if(is_numeric($channel_id)){ //频道ID是否为数值格式
            $condition['channel_id'] = intval($channel_id);
        } else { //不为数值格式，则默认为0
            $condition['channel_id'] = 0;
        }
        $brand_list=M('Brand_channel')->where($condition)->select();
        $baran_arr=array();
        foreach ($brand_list as $key => $vo) {
            $baran_arr[]=$vo['brand_id'];
        }
        /* 设置推荐条件 */
        $map = array();
        $map['status'] = 0;
        if(is_numeric($recommend)){ //推荐类型是否为数值格式
            $map['recommend'] = intval($recommend);
        } else { //不为数值格式，则默认为0
            $map['recommend'] = 0;
        }
        $map['id'] = array('in',$baran_arr);
        /* 获取数据对象*/ 
        return parent::getMapList($map, $field,$orders,$first,$pagenums); 
    }    

}
