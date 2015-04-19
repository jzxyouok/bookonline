<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改个人信息</title>
    
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
	if(f.userName.value=="")
	{
		alert("名字不能为空");
        f.userName.focus();
        f.userName.select();
		return false;
	}
    if(f.userName.value.substring(0,1)==" ")
     {
        alert("第一位不能为空");
        f.userName.focus();
        f.userName.select();
        return false;
     }
	if(f.userName.value.length<8)
	{
		alert("您输入用户长度不正确");
                f.userName.focus();
                f.userName.select();
		return false;
	}
	if(f.userName.value.length>12)
	{
		alert("您输入用户长度不正确");
                f.userName.focus();
                f.userName.select();
		return false;
	}
        if(f.realName.value=="")
        {
            alert("姓名不能为空");
            f.userName.focus();
            f.realName.select();
            return false;
        }
        if(f.realName.value.substring(0,1)==" ")
         {
            alert("第一位不能为空");
            f.realName.focus();
            f.realName.select();
            return false;
         }
       
        if(isNaN(f.realName.value))
        {
             if(f.realName.value.length<2 || f.realName.value.length>14)
            {
                alert("您输入的姓名长度有误");
                f.realName.focus();
                f.realName.select();
                return false;
            }
         }
        else
        {
                alert("姓名不能为数字");
                f.realName.focus();
                f.realName.select();
                return false;    
        }
        
        if(f.tel.value=="")
        {
            alert("电话不能为空");
            f.tel.focus();
            f.tel.select();
            return false;
        }
       if(f.tel.value.substring(0,1)==" ")
         {
            alert("第一位不能为空");
            f.tel.focus();
            f.tel.select();
            return false;
         }
        
        if(isNaN(f.tel.value)!=true)
        {
            if(f.tel.value.length<8 || f.tel.value.length>14)
            {
                alert("电话号码长度不正确");
                f.tel.focus();
                f.tel.select();
                return false;
            }
        }
        else
        {
            alert("电话必须为数字");
            f.tel.focus();
            f.tel.select();
            return false;
        }
        if(f.tel.value.indexOf("-",0)>=0 || f.tel.value.indexOf("+",0)>=0)
         {
            alert("不能出现+ - 号");
            f.tel.focus();
            f.tel.select();
            return false;
         }
        if(f.email.value=="")
        {
            return true;
        }
        else
        {
            if(f.email.value.substring(0,1)==" ")
             {
                alert("第一位不能为空");
                f.email.focus();
                f.email.select();
                return false;
             }
            if(f.email.value.indexOf("@",0)==-1)
            {
                            alert("地址有误,把@补上");
                             f.email.focus();
                            f.email.select();
                            return false;
            }	
            if(f.email.value.indexOf(".",0)==-1)
            {
                            alert("地址有误,把.补上");
                            f.email.focus();
                            f.email.select();
                            return false;
            }
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
			}
			%>
	</center>
	<p>&nbsp;</p>
    <p>&nbsp;</p>
<form name="form1" method="post" action="NoparamServlet?param=1" onsubmit="return User()">
    <p>&nbsp;</p>
    <table width="443" border="1" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="94" height="38">
			<div align="center">
          		<p>用&nbsp;户 名:</p>
          	</div>
		</td>
        <td width="400">
			<div align="center">
           		<input name="userName" type="text" id="yonghu" size="20" readonly="true" value="${user.userName}"/>
        	</div>
		</td>
      </tr>
      <tr>
        <td height="38"><div align="center">真实姓名:</div></td>
        <td>
			<div align="center">
          		<input name="realName" type="text" id="xingbin" size="20" value="${user.realName}">
        	</div>
		</td>
      </tr>
      <tr>
        <td height="38"><div align="center">性 &nbsp;&nbsp;&nbsp;别:</div></td> 
        <td>
			<div align="center">           
            	<select name="gender" >
               		<option value="${gender}">${gender}</option>
               		<option value="${genderChange}">${genderChange}</option>                
            	</select>            
            </div>
		</td>
      </tr>
      <tr>
        <td height="38"><div align="center">电话号码:</div></td>
        <td>
			<div align="center">
          		<input name="tel" type="text" id="zhengjian" size="20" value="${user.tel}">
        	</div>
		</td>
      </tr>
      <tr>
        <td height="38"><div align="center">电子邮件:</div></td>
        <td>
			<div align="center">
          		<input name="email" type="text" id="Email" size="20" value="${user.email}">
        	</div>
		</td>
      </tr>
    </table>
    <p align="center">
      <input type="submit" name="Submit" value="修改"> 
	  <input type="button" name="button1" value="返回" onclick="back()">    
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
