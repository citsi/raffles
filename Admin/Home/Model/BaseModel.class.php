<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  http://www.raffleschina.com/ All rights reserved.
// +----------------------------------------------------------------------
// | Author: hebingjian
// +----------------------------------------------------------------------

/**
 * 全局操作模型
 * @author hebingjian
 */
namespace Home\Model;
use Think\Model\RelationModel;
class BaseModel extends RelationModel {
    /**
     * 获取一条数据记录信息
     * @param  int   $id 数据记录ID
     * @param  boolean $field 查询字段
     * @return array     数据记录信息
     * @author hebingjian
    */    
    public function getOne( $id, $field = true){
        /* 设置查询条件 */
        $map = array();
        if(is_numeric($id)){ //类别ID是否为数值格式
            $map['id'] = intval($id);
        } else { //不为数值格式，则默认为0
            $map['id'] = 0;
        }
        return $this->relation(true)->field($field)->where($map)->find();
    }

    /**
     * 获取所有的数据记录信息
     * @param  boolean $field 查询字段
     * @param  string $orders 排序字符串
     * @param  int $first 分页起始记录
     * @param  int $pagenums 一页记录数量
     * @return array     数据记录信息
     * @author hebingjian
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
     * @author hebingjian
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

    /**
     * 获取所有的数据记录数量信息
     * @return int     数据记录数量信息 
     * @author hebingjian
   */    
    public function getCount(){
        return $this->relation(true)->count();
    }

    /**
     * 获取所有的数据记录数量信息
     * @param  array $map 查询条件
     * @return int     数据记录数量信息
     * @author hebingjian
   */    
    public function getMapCount($map){
        return $this->relation(true)->where($map)->count();
    }

     /**
     * 新增或更新一个数据记录
     * @param  array   $data 表单数组
     * @return boolean fasle 失败 ， true  成功
     * @author hebingjian
     */    
    public function update($data){
        if(empty($data)){
            $this->error='表单数据为空，无法提交';
            return false;
        }
        
        if($this->create($data)==true)
        {
            /* 添加或新增数据记录 */
            if(empty($data['id'])){ //新增数据
                $id = $this->add(); //添加
                if(!$id){
                    $this->error = '新增数据记录出错！';
                    return false;
                }
                return true;
            } else { //更新数据
                $status = $this->save(); //更新管理员
                if(false === $status){
                    $this->error = '更新数据记录出错！';
                    return false;
                }
                return true;
            }
        }        
    } 

    /**
     * 设置数据记录锁定状态
     * @param  int   $id 数据记录ID
     * @param  boolean $is_lock fasle 锁定 ， true  解锁
     * @return boolean fasle 失败 ， true  成功
     * @author hebingjian
    */    
    public function updateStatus($id, $is_lock){
        /* 设置处理条件 */
        $map = array();
        if(is_numeric($id)){ //数据记录ID是否为数值格式
            $map['id'] = intval($id);
        } else { //不为数值格式，则默认为0
            $map['id'] = 0;
        }

        if($is_lock==0){ //解锁
            $status = 0;
        } else { //锁定
            $status = 1;
        }
        return $this->where($map)->setField('status', $status);
    }

    /**
     * 删除一个数据记录
     * @param  int   $id 数据记录ID
     * @return boolean fasle 失败 ， true  成功
     * @author hebingjian
    */    
    public function doDel($id){
    	/* 设置删除条件 */
        $map = array();
        if(is_numeric($id)){ //数据记录ID是否为数值格式
            $map['id'] = intval($id);
        } else { //不为数值格式，则默认为0
            $map['id'] = 0;
        }
        return $this->field($field)->where($map)->delete();
    }
 
}
