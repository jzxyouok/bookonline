<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script language="javascript">
	function User()
{
	var f=document.form1;
        if(f.password.value=="")
        {
               alert("密码不能为空");
               f.password.focus();
                f.password.select();
		return false;
        }
        if(f.password.value.substring(0,1)==" ")
         {
            alert("第一位不能为空");
            f.password.focus();
            f.password.select();
            return false;
         }
       
        if(isNaN(f.password.value)!=true)
        {
                 if(f.password.value.length>12 || f.password.value.length<6)
                {	
                        alert("密码长度不正确");
                        f.password.focus();
                        f.password.select();
                        return false;

                }
        }
        else
        {
                alert("密码必须为数字");
                f.password.focus();
                f.password.select();
                return false; 
        }
        if(f.password.value.indexOf("-",0)>=0 || f.password.value.indexOf("+",0)>=0)
         {
            alert("不能出现+ - 号");
            f.password.focus();
            f.password.select();
            return false;
         }
        if(f.repassword.value=="")
        {
               alert("密码不能为空");
               f.repassword.focus();
                f.repassword.select();
		return false;
        }
        if(f.repassword.value.substring(0,1)==" ")
         {
            alert("第一位不能为空");
            f.repassword.focus();
            f.repassword.select();
            return false;
         }
        if(f.repassword.value!=f.password.value)
		{
		alert("密码不一致!");
                f.repassword.focus();
                f.repassword.select();
		return false;
		}      
}
	</script>

  </head>
  
  <body background="images/003.jpg">

	<p align="center" class="style1">个人信息管理</p>
	<hr>
	<center>
			<%
				String message = (String)session.getAttribute("errorMessage") == null?"":(String)session.getAttribute("errorMessage");
				if(message != "" || !message.equals("")){
			%>
				<font size="5" color="#FF0000"><%=message%></font>				
			<%
				response.setHeader("refresh","3;url=main.jsp");//使用response对象实现跳转  
			}
			%>
	</center>
	<p>&nbsp;</p>
<form name="form1" method="post" action="PasswordServlet" onsubmit="return User()">
    <p>&nbsp;</p>
	<p align="center"><font size="5" color="blue">修改密码</font></p>
	<table width="300" border="1" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="94" height="38"><div align="center"><p>原密码</p> </div></td>
        <td width="200"><div align="center"><input name="Password1" type="password"  size="20" />
        </div></td>
      </tr>
      <tr>
        <td height="38"><div align="center">新密码</div></td>
        <td><div align="center"><input name="password" type="password"  size="20" >     
        </div></td>
      </tr>
      <tr>
        <td height="38"><div align="center">确认密码</div></td>
        <td><div align="center"> <input name="repassword" type="password" size="20" >
        </div></td>
      </tr>
      <tr>

    </table>
    <p align="center">
      <input type="submit" name="Submit" value="修改"/>&nbsp;&nbsp;&nbsp;
      <input type="reset" name="reset" value="重置"/>&nbsp;&nbsp;&nbsp;
	  <input type="button" name="button1" value="返回" onclick="back()"/>     
</p>
  </form>
  </body>
</html>
<script type="text/javascript">
function back(){
	var frm = form1;
	frm.action = "main.jsp";
	frm.submit();
	return;
}
</script>
