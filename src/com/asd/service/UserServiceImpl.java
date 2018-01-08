package com.asd.service;

import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asd.domain.User;
import com.asd.exception.UserException;
import com.asd.mapper.UserMapper;

import cn.itcast.commons.CommonUtils;
@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	//检查用户是否存在
	@Override
	public boolean ajaxCheckLogin(String loginname) {
		int number = userMapper.ajaxCheckLogin(loginname);
		if(number == 0){//说明用户还没有注册
			return true;
		}else{
			return false;
		}
	}
	//新添用户
	@Override
	public void regist(User user) {
		String uid = UUID.randomUUID().toString().substring(0,5);
		user.setUid(uid);
		try {
			userMapper.add(user);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	//登录验证
	@Override
	public User login(String loginname, String loginpass) {
		try {
			return userMapper.findByLoginnameAndLoginpass(loginname, loginpass);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	//更改密码
	@Override
	public void updatePassword(String oldpass,String uid,String newpass) {
		try {
			boolean bool = false;
			if(userMapper.findByUidAndPassword(uid, oldpass)!=1){
				//如果得到的不等于1，说明用户没有,则密码错误
				throw new UserException("原密码错误!");
			}else{
				userMapper.updatePassword(newpass, uid);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
