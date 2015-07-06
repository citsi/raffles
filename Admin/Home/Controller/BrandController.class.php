<?php
namespace Home\Controller;
class BrandController extends CommonController {
    public function index(){
    
        
        $this->display();
    }

    function add(){
        $root = __ROOT__; 
        $time = time();
        $Brand = D('Brand');
        echo '<pre>';
        if (IS_POST){
            $logo = I('upload_photo');
            $brand_select = $Brand->select();
            print_r($brand_select);
        }
        
//         $data = array();
//         $data['logo'] = array('eq',$logo);
        $data['logo'] = $logo;

        
        $Brand->update($data);
//         echo $Brand->_sql($data_add);
        $this->assign('date',$time);
        $this->assign('root',$root);
        $this->display();
    }
}