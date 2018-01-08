<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>main</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!-- 导入的资源 -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/style/css/qianduan/main.css'/>">
	<style type="text/css">

#bg{width:100%;
	height:100%;
	top:0px;
	left:0px;
	position:absolute;
	filter: Alpha(opacity=10);
	opacity:0.05; 
	background:#000000; 
	display:none;}
#popbox{position:absolute;
		width:1200px; 
		height:800px; 
		position: fixed;
        top: 50%;
        left:40%;
        right: 0;
        margin:0 auto; 
		margin:-200px 0 0 -200px; 
		display:none; 
		}	
.copyright {
	line-height: 30px;
	margin-bottom: 10px;
	color: #555555;
	text-align: center;
}	
.bottomNav {
	margin-bottom: 10px;
	text-align: center;
}

.bottomNav li {
	line-height: 26px;
	display: inline;
}

.bottomNav a {
	margin: 0px 10px;
}	
	
	
.ac{
	float: left;
	padding: 0px 30px;
	background-color: #6e6e6e;
}
.friendLink {
	height: 30px;
	line-height: 30px;
	padding-left: 30px;
	margin-bottom: 10px;
	color: #ffffff;
	background-color: #c5c5c5;
}

.friendLink dt {
	float: left;
	padding: 0px 30px;
	background-color: #6e6e6e;
}

.friendLink dd {
	float: left;
}

.friendLink a {
	margin: 0px 10px;
	color: #ffffff;
}

.friendLink .more {
	float: right;
	background-color: #6e6e6e;
}
</style>
<script type="text/javascript">
 function pupopen(){
          document.getElementById("bg").style.display="block";
             document.getElementById("popbox").style.display="block" ; 
  }
 function pupclose(){
 document.getElementById("bg").style.display="none";
             document.getElementById("popbox").style.display="none" ; 
 }
 </script>
  
  </head>
  
  <body onload="pupopen()">
<table class="table" align="center">
	<tr class="trTop">
		<td colspan="2" class="tdTop">
			<iframe frameborder="0" src="<c:url value='/jsps/top.jsp'/>" name="top"></iframe>
		</td>
	</tr>
	<tr>
		<td class="tdLeft" rowspan="2">
			<iframe frameborder="0" src="/JustDoit/category/findAll" name="left"></iframe>
		</td>
		<td class="tdSearch" style="border-bottom-width: 0px;height: 60px;">
			<iframe frameborder="0" src="<c:url value='/jsps/search.jsp'/>" name="search"></iframe>
		</td>
	</tr>
	<tr>
		<td style="border-top-width: 0px;">
			<iframe frameborder="0" src="<c:url value='/jsps/body.jsp'/>" name="body"></iframe>
		</td>
	</tr>
	
	
	
</table>



<table  align="center" >
	<tr class="friendLink" >
					<td class="ac">新手指南</td>
							<td>
								<a  >支付方式</a>
								|
							</td>
							<td>
								<a  >配送方式</a>
								|
							</td>
							<td>
								<a  >售后服务</a>
								|
							</td>
							<td>
								<a  >购物帮助</a>
								|
							</td>
							<td>
								<a  >蔬菜卡</a>
								|
							</td>
							<td>
								<a  >礼品卡</a>
								|
							</td>
							<td>
								<a >银联卡</a>
								|
							</td>
							<td>
								<a >亿家卡</a>
								|
							</td>
							
					<td class="more">
						<a >更多</a>
					</td>
	</tr>
	
	
	
	
	
</table>

<table  align="center" >
	<img src="/JustDoit/style/images/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</table>
<table  align="center" >
	<tr class="bottomNav" >
					<td>
						<a>关于我们</a>
						|
					</td>
					<td>
						<a>联系我们</a>
						|
					</td>
					<td>
						<a>招贤纳士</a>
						|
					</td>
					<td>
						<a>法律声明</a>
						|
					</td>
					<td>
						<a>友情链接</a>
						|
					</td>
					<td>
						<a target="_blank">支付方式</a>
						|
					</td>
					<td>
						<a target="_blank">配送方式</a>
						|
					</td>
					<td>
						<a>服务声明</a>
						|
					</td>
					<td>
						<a>广告声明</a>
						
					</td>
	</tr>
</table>
<table  align="center" >
	<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
	
</table>

<div id="bg"></div>
<div id="popbox"><img src="/JustDoit/style/images/sdgg3.png" />
 <a href="#"  onclick="pupclose()">点击关闭窗口</a>
</div>

</body>

</html>
