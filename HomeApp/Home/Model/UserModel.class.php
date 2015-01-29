<?php 
// +----------------------------------------------------------------------
// | raffleschina
// +----------------------------------------------------------------------
// | Copyright (c) 2015  Raffleschina All rights reserved.
// +----------------------------------------------------------------------
// | Author: Helaoshi
// +----------------------------------------------------------------------

Class UserModel extends Model{
	protected $tableName = 'user';
/*
	//字段映射
	protected $_map = array(
		'name' => 'member_email',
		'password' => 'member_passwd',
		'email' => 'member_name',
	);*/

	//自动验证
	protected $_validate = array(
	);
	
	//自动填充
	protected $_auto = array(
	);

	/**
	 * 登陆验证
	 * @param string $member_name 用户名
	 * @param string $member_passwd 用户密码
	 * @return array $member 会员的状态 
	 */
	public function loginTest($member_name,$member_passwd){
		$map = array('uname'=>$member_name,'password'=>$member_passwd);
		$member = $this->where($map)->find();
		if($member){
			return $member;
		}
	}
}
?>