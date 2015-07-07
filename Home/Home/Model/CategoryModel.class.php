<?php
/**
 * Created by Ricky.
 * User: Administrator
 * Date: 2015/7/2
 * Time: 15:43
 */

namespace Home\Model;

class CategoryModel extends BaseModel
{
    public function getCategoryList(){

        return parent::getMapList();
    }


}