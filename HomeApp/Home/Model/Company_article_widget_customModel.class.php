<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------


class Company_article_widget_customModel extends BaseModel {  
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
    public function getHomeList($label = '', $field = true, $orders = 'id desc', $first = 0, $pagenums = 2){
        /* 设置推荐条件 */
        $map = array();
        $map['label'] = $label;
        /* 获取数据对象*/ 
        return parent::getMapList($map, $field,$orders,$first,$pagenums);   
    } 

}
