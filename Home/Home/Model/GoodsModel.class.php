<?php
/**
 * Created by Ricky.
 * User: Administrator
 * Date: 2015/7/2
 * Time: 15:43
 */

namespace Home\Model;

class GoodsModel extends BaseModel
{
    public function getGoodsList(){

//        $cateid= $id ? $id : I('get.cateId', 0);
//        $id=$category['id'];
//        $map = Array();

        return parent::getMapList();
    }


}