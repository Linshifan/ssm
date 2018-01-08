<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书详细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/style/css/pager/pager.css'/>" />
	<script src="<c:url value='/style/jquery/jquery-1.5.1.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/style/css/book/desc.css'/>">
	<script src="<c:url value='/style/js/book/desc.js'/>"></script>
  </head>
  
  <body>
  <div class="divBookName">${book.bname }</div>
  <div>
    <img align="top" src="<c:url value='/style/${book.image_w }'/>" class="img_image_w"/>
    <div class="divBookDesc">
	    <ul>
	    	<li>商品编号：${book.bid }</li>
	    	<li>当前价：<span class="price_n">&yen;${book.currPrice }</span></li>
	    	<li>定价：<span class="spanPrice">&yen;${book.price }</span>　折扣：<span style="color: #c30;">${book.discount }</span>折</li>
	    </ul>
		<hr class="hr1"/>
		<table>
			<tr>
				<td colspan="3">
					产地：${book.place } 
				</td>
			</tr>
			<tr>
				<td colspan="3">
					商家：${book.press }
				</td>
			</tr>
			<tr>
				<td colspan="3">上架时间：${book.publishtime }</td>
			</tr>
			<tr>
				<td>商品描述：${book.edition }</td>
			</tr>

		
		</table>
		<div class="divForm">
			<form id="form1" action="/JustDoit/cartitem/add" method="post">
				<input type="hidden" name="bid" value="${book.bid }"/>
  				我要买：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件
  			</form>
  			<c:choose>
  				<c:when test="${empty sessionScope.sessionUser }">
  				<h1>您还没有登录!购买不了商品!</h1>
  				</c:when>
  				<c:otherwise>
  					<a id="btn" href="javascript:$('#form1').submit();"></a>
  				</c:otherwise>
  			</c:choose>
  			
  		</div>
	</div>
  </div>
  </body>
</html>
