package com.asd.mapper;

import com.asd.domain.User;

public interface UserMapper {
	//校验用户名是否已经注册
	public int ajaxCheckLogin(String loginname);
	//注册新用户
	public void add(User user);
	//登录验证
	public User findByLoginnameAndLoginpass(String loginname,String loginpass);
	//按照uid和password进行查询（更改密码用的）
	public int findByUidAndPassword(String uid,String password);
	//修改密码
	public void updatePassword(String password,String uid);
}
