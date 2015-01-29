<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------


class AnnouncementModel extends BaseModel {
    /**
     * 获取指定推荐类型的一条公告信息
     * @param  int $recommend 推荐类型
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @return array     广告信息
     * @author Helaoshi
   */    
    public function getRecommeOne($recommend = 1, $field = true, $orders = 'id desc'){
        /* 设置推荐条件 */
        $map = array();
        if(is_numeric($posid)){ //推荐类型是否为数值格式
            $map['status'] = intval($recommend);
        } else { //不为数值格式，则默认为0
            $map['status'] = 0;
        }
        /* 获取数据对象*/ 
        return parent::getMapOne($map, $field,$orders);   
    }  
    /**
     * 获取指定推荐类型的公告信息列表
     * @param  int $recommend 推荐类型
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     广告信息
     * @author Helaoshi
   */    
    public function getRecommeList($recommend = 1, $field = true, $orders = 'id desc', $first = 0, $pagenums = 0){
        /* 设置推荐条件 */
        $map = array();
        if(is_numeric($posid)){ //推荐类型是否为数值格式
            $map['status'] = intval($recommend);
        } else { //不为数值格式，则默认为0
            $map['status'] = 0;
        }
        /* 获取数据对象*/ 
        return parent::getMapList($map, $field,$orders,$first,$pagenums);   
    }    

}
