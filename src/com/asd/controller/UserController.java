package com.asd.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asd.domain.User;
import com.asd.exception.UserException;
import com.asd.service.UserService;

@Controller
public class UserController {
	//用户模块的所有功能请求
	
	@Resource(name="userService")
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//校验用户是否注册
	@RequestMapping(value="/ajaxLoginname",method=RequestMethod.POST)
	public String ajaxLoginname(HttpServletRequest req,HttpServletResponse resp) throws Exception{
			String loginname = req.getParameter("loginname");
			boolean bool = userService.ajaxCheckLogin(loginname);
			resp.getWriter().print(bool);
			return null;
	}
	
	//登录验证
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,HttpServletRequest req,HttpServletResponse resp) throws Exception{
			Map<String, String> errors = checkRegist(user.getLoginname(),user.getLoginpass(),"x");
			Map<String, String> errors2 = checkRegist2(user.getLoginname(),"x","x",user.getLoginpass(),"x");
			//校验失败，显示错误信息
			if(errors.size()>0){
				req.setAttribute("form", user);
				req.setAttribute("errors", errors);
				return "user/login";
			}
			//登录验证一下
			User userform = userService.login(user.getLoginname(), user.getLoginpass());
			if(userform == null){
				req.setAttribute("msg", "用户名或密码错误!");
				req.setAttribute("user", userform);
				return "user/login";
			}else{
				req.getSession().setAttribute("sessionUser", userform);
				//获取cookie
				String loginname = userform.getLoginname();
				loginname = URLEncoder.encode(loginname,"utf-8");
				Cookie cookie = new Cookie("loginname", loginname);
				cookie.setMaxAge(60*60*24*10);//使其存在的时间为十天
				resp.addCookie(cookie);
				return "main";   
			}
	}
	//这才是真正的验证校验信息，为了防止漏洞 //使用ajax可以在前段页面进行格式上的效验
	private Map<String,String> checkRegist(String loginname,String loginpass,String reloginpass){
		Map<String, String> errors = new HashMap<>();
		//校验登录名
		if(loginname == null || loginname.trim().isEmpty()){
			errors.put("loginname", "用户名不能为空!");
		}else if(loginname.length()<3||loginname.length()>20){
			errors.put("loginname", "用户名必须在3-20位之间!");
		}
		//邮箱效验
//		if(loginemail == null || loginemail.trim().isEmpty()){
//			errors.put("loginemail", "邮箱不能为空!");
//		}else if(loginemail.length()<9||loginemail.length()>30){
//			errors.put("loginemail", "邮箱必须在9-30位之间!");
//		}
//		
//		//电话效验
//		if(tel == null || tel.trim().isEmpty()){
//			errors.put("tel", "电话不能为空!");
//		}else if(tel.length()<11||tel.length()>11){
//			errors.put("tel", "电话必须11位!");
//				}
//		
		//登录密码校验
		if(loginpass == null || loginpass.trim().isEmpty()){
			errors.put("loginpass", "密码不能为空!");
		}else if(loginpass.length()<3||loginpass.length()>20){
			errors.put("loginpass", "密码必须在3-20位之间!");
		}
		//确认密码校验
		if(!reloginpass.equals("x")){
			if(reloginpass == null || reloginpass.trim().isEmpty()){
				errors.put("reloginpass", "确认密码不能为空!");
			}else if(reloginpass.length()<3||reloginpass.length()>20){
				errors.put("reloginpass", "确认密码必须在3-20位之间!");
			}else if(!reloginpass.equals(loginpass)){
				errors.put("reloginpass", "两次输入不一致!");
			}
		}
		return errors;
	}
	
	
	
	
	
	
	
	
	private Map<String,String> checkRegist2(String loginname,String loginemail,String tel,String loginpass,String reloginpass){
		Map<String, String> errors = new HashMap<>();
		//校验登录名
		if(loginname == null || loginname.trim().isEmpty()){
			errors.put("loginname", "用户名不能为空!");
		}else if(loginname.length()<3||loginname.length()>20){
			errors.put("loginname", "用户名必须在3-20位之间!");
		}
		//邮箱效验
//		if(loginemail == null || loginemail.trim().isEmpty()){
//			errors.put("loginemail", "邮箱不能为空!");
//		}else if(loginemail.length()<9||loginemail.length()>30){
//			errors.put("loginemail", "邮箱必须在9-30位之间!");
//		}
//		
//		//电话效验
//		if(tel == null || tel.trim().isEmpty()){
//			errors.put("tel", "电话不能为空!");
//		}else if(tel.length()<11||tel.length()>11){
//			errors.put("tel", "电话必须11位!");
//				}
//		
		//登录密码校验
		if(loginpass == null || loginpass.trim().isEmpty()){
			errors.put("loginpass", "密码不能为空!");
		}else if(loginpass.length()<3||loginpass.length()>20){
			errors.put("loginpass", "密码必须在3-20位之间!");
		}
		//确认密码校验
		if(!reloginpass.equals("x")){
			if(reloginpass == null || reloginpass.trim().isEmpty()){
				errors.put("reloginpass", "确认密码不能为空!");
			}else if(reloginpass.length()<3||reloginpass.length()>20){
				errors.put("reloginpass", "确认密码必须在3-20位之间!");
			}else if(!reloginpass.equals(loginpass)){
				errors.put("reloginpass", "两次输入不一致!");
			}
		}
		return errors;
	}
	
	
	
	
	
	
	
	//系统推出功能
	@RequestMapping(value="/quit")
	public String quit(HttpServletRequest req) throws Exception{
		req.getSession().invalidate();
		return "user/login";		
	}
	
	//更改密码
	@RequestMapping(value="/updatePassword",method=RequestMethod.POST)
	public String updatePassword(User user,HttpServletRequest req) throws Exception{
		User oldUser = (User) req.getSession().getAttribute("sessionUser");//从登陆隐藏的信息的出来
		System.out.println(user.getLoginpass());
		if(oldUser == null){
			//说明没有登录
			req.setAttribute("msg", "您还没有登录！");
			return "user/login";
		}
		try {
			userService.updatePassword(oldUser.getLoginpass(), oldUser.getUid(), user.getNewpass());
			req.setAttribute("msg", "修改密码成功！");
			req.setAttribute("code", "success");  
			return "msg";
		} catch (Exception e) {
			req.setAttribute("msg", e.getMessage());
			req.setAttribute("user", user);
			return "user/pwd";
		}
		
	}
	
	//注册用户
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(User user,HttpServletRequest req) throws Exception{
		Map<String, String> errors2 = checkRegist2(user.getLoginname(),user.getLoginemail(),user.getTel(), user.getLoginpass(), user.getReloginpass());
		System.out.println(user.getLoginname()+user.getLoginemail()+user.getTel()+user.getLoginpass()+user.getReloginpass());
		if(errors2.size()>0){
			req.setAttribute("form", user);
			req.setAttribute("errors", errors2);
			return "user/register";
		}else{
			if(userService.ajaxCheckLogin(user.getLoginname())){
				userService.regist(user);
				req.setAttribute("code", "success");
				req.setAttribute("msg", "恭喜你注册成功！");
				return "msg";
			}else{
				errors2.put("loginname", "用户已注册！");
				req.setAttribute("errors", errors2);
				return "user/register";
			}
		}
	}

	
}
