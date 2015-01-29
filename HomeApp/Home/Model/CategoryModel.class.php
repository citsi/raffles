<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------

class CategoryModel extends BaseModel {
    /**
     * 获取父分类为指定值的下一级类别信息
     * @param  int $pid 父分类
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     商品分类信息
     * @author Helaoshi
   */
    public function getList($pid=0, $field = true, $orders = 'sort asc, id desc', $first = 0, $pagenums = 0){
        /* 设置推荐条件 */
        $map = array();
        $map['status'] = 0;
        if(is_numeric($pid)){ //推荐类型是否为数值格式
            $map['parent_id'] = intval($pid);
        } else { //不为数值格式，则默认为0
            $map['parent_id'] = 0;
        }
        /* 获取数据对象*/ 
        return parent::getMapList($map, $field,$orders,$first,$pagenums);   
    }   

    public function getSearchList($pid=0, $field = true, $orders = 'sort asc, id desc', $first = 0, $pagenums = 0){
        /* 设置推荐条件 */
        $map = array();
        $map['status'] = 0;
        if(is_numeric($pid)){ //推荐类型是否为数值格式
            $map['parent_id'] = intval($pid);
        } else { //不为数值格式，则默认为0
            $map['parent_id'] = 0;
        }
        /* 获取数据对象*/ 
        return parent::getMapList($map, $field,$orders,$first,$pagenums);   
    }    

}
