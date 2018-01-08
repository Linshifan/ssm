package com.asd.service;

import com.asd.domain.User;
import com.asd.exception.UserException;

public interface UserService {
	//校验用户名是否已经注册
	public boolean ajaxCheckLogin(String loginname);
	//注册新用户
	public void regist(User user);
	//登录验证
	public User login(String loginname,String loginpass);
	//修改密码
	public void updatePassword(String oldpass,String uid,String newpass);
}
