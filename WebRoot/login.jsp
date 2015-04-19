<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/style.css">

	<script type="text/javascript">
	function od()
	{
		var f=document.form1;
		if(f.name.value=="")
		{
			alert("用户名未输入");
			f.name.focus();
			f.name.select();
			return;
		}
		if(f.password.value=="")
		{
			alert("密码未输入");
			f.password.focus();
			f.password.select();
			return;
		}
	}
	
	</script>
  </head>
  
  <body background="images/003.jpg">
    <center>
	<p align="center" class="style1 style3">欢迎进入订票系统</p>
	<hr>
	<center>
			<%
				String message = (String)session.getAttribute("message") == null?"":(String)session.getAttribute("message");
				if(message != "" || !message.equals("")){
			%>
				<font size="5" color="#FF0000"><%=message%></font>
			<%
			}
			%>
	</center>		
		<form method="post" name="form1" action="LoginServlet" onSubmit="return od()">
			<table width="230" border="1" align="center" cellpadding="0" cellspacing="0">
					<tr>
					<td width="86" height="46"><div align="center">用户名:</div></td>
					<td width="138">
					<div align="center">
						<input name="userName" type="text" id="name" size="15">
					</div>
					</td>
					</tr>
		<tr>
			<td height="48"><div align="center">密 &nbsp;码:</div></td>
			<td>
				<div align="center">
					<input name="password" type="password" id="password" size="15">
				</div>
			</td>
		</tr>
		</table>
			<p align="center">
    			<input name="Sub1" type="submit" value="提交">
    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			<input name="reset" type="reset" value="重置">
			</p>
		</form>
		<a href="register.jsp">注册</a>
		</center>
  </body>
</html>
  </body>
</html>
