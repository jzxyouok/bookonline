<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加失败</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">

  </head>
  
  <body background="images/003.jpg">
   <p>&nbsp;</p>
<p align="center" class="style1">武昌火车站欢迎您！</p>
<hr>
  <form name="form1" method="post" action="">
    <p align="center"><span class="style4">对不起，您不是管理员，无权添加火车信息！&nbsp;</span></p>
    <p align="center">&nbsp;</p>
    <p align="center"><span class="style4">请单击此回到<a href="main.jsp">主页</a> </span></p>
</form>
<p>&nbsp;</p>
  </body>
</html>
