<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>left</title>
    <base target="body"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/style/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/style/js/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/style/css/menu/mymenu.css'/>" type="text/css" media="all">
	<link rel="stylesheet" type="text/css" href="<c:url value='/style/css/qianduan/left.css'/>">
<script language="javascript">
/*
 * 1. 对象名必须与第一个参数相同！
   2. 第二个参数是显示在菜单上的大标题
 */
var bar = new Q6MenuBar("bar", "商品分类");
$(function() {
	bar.colorStyle = 5;//指定配色样式，一共0,1,2,3,4
	bar.config.imgDir = "<c:url value='/style/images/'/>";//小工具所需图片的路径
	bar.config.radioButton=true;//是否排斥，多个一级分类是否排斥

	/*
	1. 程序设计：一级分类名称
	2. Java Javascript：二级分类名称
	3. /goods/jsps/book/list.jsp：点击二级分类后链接到的URL
	4. body:链接的内容在哪个框架页中显示
	*/
<c:forEach items="${parents}" var="parent">
  <c:forEach items="${parent.children}" var="child">
	bar.add("${parent.cname}", "${child.cname}", "/JustDoit/book/findByCategory?cid=${child.cid}", "body");
  </c:forEach>
</c:forEach>
	
	$("#menu").html(bar.toString());
});
</script>
</head>
  
<body>  
  <div id="menu"></div>
  <div><img src="/JustDoit/style/images/1-1.png" width="150" height="50"/></div>
  <div><img src="/JustDoit/style/images/2-2.png" width="150" height="50"/></div>
  <div><img src="/JustDoit/style/images/3-3.png" width="150" height="50"/></div>
  <div><img src="/JustDoit/style/images/4-4.png" width="150" height="50"/></div>
  <div><img src="/JustDoit/style/images/5-5.png" width="150" height="50"/></div>
  <div><img src="/JustDoit/style/images/6-6.png" width="150" height="50"/></div>
</body>
</html>
