<?php
namespace Home\Controller;
use Think\Controller;
class UploadController extends Controller {
    
    public function upload(){
        $upload = new \Think\Upload();// 实例化上传类    
        $upload->maxSize   =     3145728 ;// 设置附件上传大小    
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型    
        $upload->savePath  =      './admin/'; // 设置附件上传目录    // 上传文件     
        $upload->saveName  =    array('date','YmdHis');;  //上传文件命名
//         $upload->saveName  =    '';
        $info   =   $upload->upload(); 
        echo '<pre>';
        print_r($info);   
        if(!$info) {// 上传错误提示错误信息       
            $this->error($upload->getError());    
        }else{
            foreach($info as $file){        
                return $file['savepath'].$file['savename'];   
                echo $file['savepath'].$file['savename'];
            }
        }
       
       
    }
}