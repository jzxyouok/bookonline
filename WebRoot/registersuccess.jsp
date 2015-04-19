<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册成功</title>
</head>
<body  background="images/003.jpg">
<p>&nbsp;</p>
<p align="center" class="style1">欢迎您注册</p>
<hr>
  <form name="form1" method="post" action="">
    <p align="center"><span class="style4">注册成功!&nbsp;</span></p>
    <p align="center">&nbsp;</p>
    <p align="center"><span class="style4">请单击此<a href="login.jsp">登陆</a> </span></p>
</form>
<p>&nbsp;</p>

</body>
</html>
