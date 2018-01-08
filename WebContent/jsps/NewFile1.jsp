<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>js+CSS弹出居中的背景半透明div层</title>
 <style type="text/css">
 body{margin:0px;}
 #bg{width:100%;height:100%;top:0px;left:0px;position:absolute;filter: Alpha(opacity=50);opacity:0.5; background:#000000; display:none;}
 #popbox{position:absolute;width:400px; height:400px; left:50%; top:50%; margin:-200px 0 0 -200px; display:none; background:#666666;}
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
 <body>
  </br>
 CSS弹出层，或者说是弹出窗口，背景半透明风格的弹出框，</br>在网站登录、用户注册、公告提示方面都非常适合使用。</br>IE和FF,OP均可以~弹出窗口,背景半透明 </br>
　　原理:两个层,一个高度和宽度都是100%,另一个就是你要弹出的窗口的具体内容,</br>半透明在IE中是用filter: Alpha(opacity=60);在非IE中用opacity:0.60; 
 </br></br>　　 <a href="#" onclick="pupopen()">点击这里打开窗口</a>
 <div id="bg"></div>
 <div id="popbox">两个层,一个高度和宽度都是100%,另一个就是你要弹出的窗口的具体内容,半透明在IE中是用filter: Alpha(opacity=60);在非IE中用opacity:0.60;
 <br>
 <br>
 <br>
 <a href="#"  onclick="pupclose()">点击关闭窗口</a>
 </div>
 </body>
 </html>