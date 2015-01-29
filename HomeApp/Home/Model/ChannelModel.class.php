<?php
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------

class ChannelModel extends Model{
    
     /**
     * 获取频道信息
     * @param  int   $id 分类ID
     * @param  boolean $field 查询字段
     * @return array     分类信息
     * @author Helaoshi
     */
    public function getOne($id, $field = true){
        /* 获取频道信息 */
        $map = array();
        if(is_numeric($id)){ //分类ID是否为数值格式
            $map['id'] = intval($id);
        } else { //不为数值格式，则默认为0
            $map['id'] = 0;
        }
        return M('Channel')->field($field)->where($map)->find();
    }

     /**
     * 获取频道列表信息
     * @param  boolean $field 查询字段
     * @return array     分类信息
     * @author Helaoshi
     */
    public function getList($field = true, $nums = 0){
        /* 获取分类信息 */
        $map = array();
        $map['status'] = 0;

        if(is_numeric($nums)&&intval($nums)>0){ //数量为具体数值格式且大于0
            return M('Channel')->field($field)->where($map)->order('sort asc,id desc')->limit($nums)->select();
        } else {
            return M('Channel')->field($field)->where($map)->order('sort asc,id desc')->select();
        }  
    }

    /**
     * 获取某级频道下所有商品分类信息
     * @param  int   $cid 频道ID
     * @param  boolean $field 查询字段
     * @return array     分类信息
     * @author Helaoshi
     */
    public function getCateList($cid, $pid=-1, $field = true, $nums = 0){
        /* 获取分类信息 */
        $map = array();
        $submap = array();
        $map['status'] = 0;

        if(is_numeric($cid)){ //频道ID是否为数值格式
            $map['channel_id'] = intval($cid);  
        }  else {
            $map['channel_id'] = 0;  
        }

        $result=M('Channel_category')->where($map)->select();
        $wherearr=array();
        if(count($result)>0)
        {
            foreach ($result as $key => $vo) {
               	$wherearr[]=$result[$key]['cate_id'];
            }    
            $submap['id'] = array('in',$wherearr);                
        } else {
            $submap['id'] = 0;
        }

        if(is_numeric($pid)&&intval($pid)>=0)
        {
            $submap['parent_id'] = $pid;
        }

        if(is_numeric($nums)&&intval($nums)>0){ //数量为具体数值格式且大于0        	
            return M('Category')->field($field)->where($submap)->limit($nums)->select();
        } else {
            return M('Category')->field($field)->where($submap)->select();
        }  
    }
}
