<?php
// 88购物公共操作控制器
class PublicAction extends BaseAction {
	//初始化操作
    protected function _initialize(){
		parent::_initialize();	
	}

	//注册
    public function reg(){
        
		$this->show();
    }

	//注册
    public function login(){
        
		$this->show();
    }

    public function doReg(){
		$member = D('User');
		$status = $member->data($_POST)->add();
		if($status){
			session('userid',$status);
			session('username',$_POST['uname']);
			$this->success('注册成功！',U('User/Index/index'));
		}
	}

	public function doLogin(){
		$member = D('User');
		$data = $member->loginTest(I('username'),I('password'));
		if(!$data){
			$this->error('用户名或密码错误！');
		}else{
			session('userid',$data['id']);
			session('username',$data['username']);
			$this->success('登陆成功！',U('User/Index/index'));
		}
	}

}