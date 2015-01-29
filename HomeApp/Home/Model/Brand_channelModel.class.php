<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------


class Ad_manageModel extends BaseModel {
    /**
     * 获取不同广告位的广告信息
     * @param  int $posid 广告位
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     广告信息
     * @author Helaoshi
   */    
    public function getList($posid = 1, $field = true, $orders = 'sort asc, id desc', $first = 0, $pagenums = 0){
        /* 设置推荐条件 */
        $map = array();
        $map['status'] = 0;
        if(is_numeric($posid)){ //推荐类型是否为数值格式
            $map['position_id'] = intval($posid);
        } else { //不为数值格式，则默认为0
            $map['position_id'] = 1;
        }
        $now_time=time();
        $map['start_time']  = array('elt',$now_time);
        $map['end_time']  = array('egt',$now_time);
        /* 获取数据对象*/ 
        return parent::getMapList($map, $field,$orders,$first,$pagenums);   
    }    

}
