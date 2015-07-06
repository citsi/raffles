<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/7/2
 * Time: 15:43
 */

namespace Home\Model;

class BrandModel extends BaseModel
{
    public function getBrandList(){

        return parent::getMapList();
    }


}