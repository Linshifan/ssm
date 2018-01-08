<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 tdansitional//EN" "http://www.w3.org/td/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新用户注册</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/style/css/user/register.css'/>">
<script type="text/javascript" src="<c:url value='/style/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/style/js/user/register.js'/>"></script>
</head>
<body>
	<div id="divMain">
		<div id="divTitle">
			<span id="spanTitle">新用户注册</span>
		</div>
		<div id="divBody">
		<form id="registForm" action="/JustDoit/regist" method="post">
			<table id="tableForm">
				<tr>
					<td class="tdText">用户名:</td>
					<td class="tdInput"><input class="inputClass" type="text" id="loginname" name="loginname" value="${form.loginname}"></td>
					<td class="tdError"><lable class="errorClass" id="loginnameError">${errors.loginname}</lable></td>
				</tr>
				<tr>
					<td class="tdText">邮箱:</td>
					<td class="tdInput"><input class="inputClass" type="text" id="loginemail" name="loginemail" value="${form.loginemail}"></td>
					<td class="tdError"><lable class="errorClass" id="loginemailError">${errors.loginemail}</lable></td>
				</tr>
				<tr>
					<td class="tdText">电话:</td>
					<td class="tdInput"><input class="inputClass" type="text" id="tel" name="tel" value="${form.tel}"></td>
					<td class="tdError"><lable class="errorClass" id="telError">${errors.tel}</lable></td>
				</tr>
				<tr>
					<td class="tdText">登录密码:</td>
					<td><input class="inputClass" type="password" id="loginpass" name="loginpass" value="${form.loginpass}"></td>
					<td><lable class="errorClass" id="loginpassError">${errors.loginpass}</lable></td>
				</tr>
				<tr>
					<td class="tdText">确认密码:</td>
					<td><input class="inputClass" type="password" id="reloginpass" name="reloginpass" value="${form.reloginpass}"></td>
					<td><lable class="errorClass" id="reloginpassError">${errors.reloginpass}</lable></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="inputBtn" type="image" id="submitBtn" src="<c:url value='/style/images/regist1.jpg'/>"></td>
					<td><lable></lable></td>
				</tr>
			</table>
			</form>
		</div>
	
	</div>
</body>
</html>





































