<?php
namespace Common\Model;

// use Home\Model\BaseModel;
class BrandModel extends BaseModel
{
    public function getBrandList(){
//         $data = D('Brand')->select();
        return parent::getMapList();
    }

    public function update($data){
        return parent::update($data);
    }

}