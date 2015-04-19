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