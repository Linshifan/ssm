package com.asd.domain;

public class User {
	private String uid;//用户id
	private String loginname;//用户名
	private String loginpass;//密码

		
	private String loginemail;//邮箱
	
	private String tel;//电话

	

	private String reloginpass;//确认密码
	
	private String newpass;//新密码

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpass() {
		return loginpass;
	}

	public void setLoginpass(String loginpass) {
		this.loginpass = loginpass;
	}

	
	
	
	public String getLoginemail() {
		return loginemail;
	}

	public void setLoginemail(String loginemail) {
		this.loginemail = loginemail;
	}
	
	
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
	
	public String getReloginpass() {
		return reloginpass;
	}

	public void setReloginpass(String reloginpass) {
		this.reloginpass = reloginpass;
	}


	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

}
