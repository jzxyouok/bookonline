package com.bookonline.Servlet;

import com.bookonline.JavaBean.*;
import com.bookonline.DB.*;
import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.http.*;

public class ModifyServlet extends HttpServlet 
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
        String param=request.getParameter("param");
        if(param.equalsIgnoreCase("0"))
        {
            String userName=(String)request.getSession().getAttribute("userName");
            UserDao userDao=new UserDao();
            // 利用userName 进行数据库的查询
            // 将返回的用户信息放入UserBean对象中
            UserBean user=userDao.getUser(connection, userName);
            String gender=user.getGender();
            String genderChange;
            if(gender.equals("男"))
            {
                genderChange="女";
            }
            else
            {
                 genderChange="男";
            }
            // 将性别放入session 中 
             request.getSession().setAttribute("gender",gender);
             request.getSession().setAttribute("genderChange",genderChange);
            request.getSession().setAttribute("user",user);
            request.getRequestDispatcher("modifyinfo.jsp").forward(request, response);
        }        
    }
}

