<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------


class BaseModel extends RelationModel {
    /**
     * 获取一条数据记录信息
     * @param  int   $id 数据记录ID
     * @param  boolean $field 查询字段
     * @return array     数据记录信息
    */    
    public function getOne( $id, $field = true){
        /* 设置查询条件 */
        $map = array();
        if(is_numeric($id)){ //类别ID是否为数值格式
            $map['id'] = intval($id);
        } else { //不为数值格式，则默认为0
            $map['id'] = 0;
        }
        return $this->field($field)->where($map)->find();
    }

    /**
     * 根据查询条件获取一条数据记录信息
     * @param  array $map 查询条件
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @return array     数据记录信息
     * @author Helaoshi
    */    
    public function getMapOne( $map, $field = true, $orders = 'id desc'){
        /* 数据结果*/
        return $this->field($field)->where($map)->order($orders)->find();
    }

    /**
     * 获取所有的数据记录信息
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     数据记录信息
     * @author Helaoshi
   */    
    public function getList($field = true, $orders = 'id desc', $first = 0, $pagenums = 0){
        /* 判断起始值是否为数值格式*/
        if(!is_numeric($first)){ 
            $first=0;
        }
        /* 判断分页记录数量是否为数值格式*/
	    if(!is_numeric($pagenums)){
             $pagenums=0;      
	    } 
        /* 判断是否分页 */
	    if($pagenums>0)
	    {
	    	return $this->relation(true)->field($field)->order($orders)->limit($first.','.$pagenums)->select();
	    } else  {
	    	return $this->relation(true)->field($field)->order($orders)->select();
	    }	      
    }

    /**
     * 根据查询条件获取所有的数据记录信息
     * @param  array $map 查询条件
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     数据记录信息
   */    
    public function getMapList($map, $field = true, $orders = 'id desc', $first = 0, $pagenums = 0){
        /* 判断查询条件是否存在*/
        if(count($map)==0)
        {
        	$map['_string']='status=0';
        }
		/* 判断起始值是否为数值格式*/
        if(!is_numeric($first)){ 
            $first=0;
        }
		/* 判断分页记录数量是否为数值格式*/
	    if(!is_numeric($pagenums)){
             $pagenums=0;      
	    } 
        /* 判断是否分页 */
	    if($pagenums>0)
	    {
	    	return $this->relation(true)->field($field)->where($map)->order($orders)->limit($first.','.$pagenums)->select();
	    } else  {
	    	return $this->relation(true)->field($field)->where($map)->order($orders)->select();
	    }	      
    }
 
}
