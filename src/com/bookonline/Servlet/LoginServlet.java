package com.bookonline.Servlet;


import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookonline.JavaBean.*;
import com.bookonline.DB.*;

public class LoginServlet extends HttpServlet 
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
        String userName = (String)request.getParameter("userName");
        String password = (String)request.getParameter("password");
        UserDao userDao=new UserDao();
        // check方法查询数据库中是否有该用户信息
        boolean value=userDao.check(connection,userName,password);
        if(value)
		{
			// 登录成功
        	request.getSession().setAttribute("userName", userName);
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			// 登录失败
			request.getSession().setAttribute("message", "用户名或密码错误，请重新登录！");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
       
         
    }

}
