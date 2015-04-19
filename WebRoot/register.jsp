<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
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
    <p>&nbsp;</p>
<p align="center" class="style1">欢迎您注册</p>
<hr>
  <form name="form1" method="post" action="NewUser" onSubmit="return User()">
    <p>&nbsp;</p>
    <table width="443" border="1" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="94" height="38"><div align="center">
          <p>用&nbsp;户 名:</p>
          </div></td>
        <td width="343">          
           <div align="left">
             <input name="userName" type="text" id="yonghu" size="20"  >
        <span>*用户名长度为8-16字母数字</span></div></td>
      </tr>
      <tr>
        <td height="38"><div align="center">密 &nbsp;     &nbsp;码:</div></td>
        <td>          
          <div align="left">
          <input name="password" type="password" id="password" size="20" >        
        *密码长度为6-14数字</div></td>
      </tr>
      <tr>
        <td height="38"><div align="center">重复密码:</div></td>
        <td>
          <div align="left">
            <input name="repassword" type="password" id="repassword" size="20">
            *必须与密码保持一致
          </div></td></tr>
      <tr>
        <td height="38"><div align="center">真实姓名:</div></td>
        <td>
          <div align="left">
            <input name="realName" type="text" id="name" size="20"> 
            *应为真实姓名
</div></td></tr>
      <tr>
        <td height="38"><div align="center">性 &nbsp;&nbsp;&nbsp;别:</div></td>
        <td>
          <div align="left">
            <input type="radio" name="gender" value="1" checked>
            男
              <input type="radio" name="gender" value="2">
              女</div></td></tr>
      <tr>
        <td height="38"><div align="center">电话号码:</div></td>
        <td>
          <div align="left">
            <input name="tel" type="text" id="zhengjian" size="20">
 *电话号码为8-14位数字</div></td></tr>
      <tr>
        <td height="38"><div align="center">电子邮件:</div></td>
        <td>
          <div align="left">
            <input name="email" type="text" id="Email" size="20">
        </div></td></tr>
    </table>
    <p align="center">
      <input type="submit" name="submit" value="注册">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" name="reset" value="重置">
      
    </p>
  </form>
<p>&nbsp;</p>
  </body>
</html>
