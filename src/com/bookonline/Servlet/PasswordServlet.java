package com.bookonline.Servlet;

import com.bookonline.JavaBean.*;
import com.bookonline.DB.*;
import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.http.*;

public class PasswordServlet extends HttpServlet 
{
        private Connection connection;
       public void init() throws ServletException
       {
           super.init();
             connection=DB.getConnection();
       }
       public void destroy()
       {
        super.destroy();
           //关闭数据库连接 
        DB.closeConnection(connection);
       }
   
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        doPost(request, response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
            String userName=(String)request.getSession().getAttribute("userName");
            UserDao userDao=new UserDao();
            // 利用userName 进行数据库的查询
            // 将返回的用户信息放入UserBean对象中
            UserBean user=userDao.getUser(connection, userName);
            String pass=user.getPassword();
            String passed=request.getParameter("Password1");
            String newpass=request.getParameter("password");
            // 根据界面输入的密码与用户的密码进行比较
            if(pass.equals(passed))
            {
                //如果两者值相等 
                //UpdatePass 进行密码修改操作
                int value=userDao.UpdatePass(connection,newpass,userName);
                if(value>0)
                {	
                	 request.getSession().setAttribute("errorMessage", "密码修改成功,3秒中后，跳转到主页！");
                     request.getRequestDispatcher("passwordmodify.jsp").forward(request,response);
                }
                else
                {
                	 request.getSession().setAttribute("errorMessage", "修改失败！");
                     request.getRequestDispatcher("passwordmodify.jsp").forward(request,response);
                }
               
            }
            else
            {
                //如果密码不相等
            	request.getSession().setAttribute("errorMessage", "密码不一致，修改失败！");
               request.getRequestDispatcher("passwordmodify.jsp").forward(request,response);
            } 
    }
}
