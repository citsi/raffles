<?php
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
    private $json;
    
    public function __construct()
    {
        parent::__construct();
        $this->json = new \Think\Json();
    }
    public function upload(){
        $upload = new \Think\Upload();// 实例化上传类    
        $upload->maxSize   =     3145728 ;// 设置附件上传大小    
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型    
        $upload->savePath  =      '/admin/'; // 设置附件上传目录    // 上传文件      
        $upload->saveName  =     array('date','YmdHis'); //上传文件命名
        $info   =   $upload->upload();
        $file_url = $upload->savePath.$upload->saveName;
        if(!$info) {// 上传错误提示错误信息       
            $this->error($upload->getError());
        }else{
            foreach($info as $file){        
                echo __ROOT__."/Uploads".$file['savepath'].$file['savename']; 
            }
            
//             return $this->json->encode(array('error' => 0, 'url' => $file_url));
//             $this->success('上传成功！');
        }
    }
}