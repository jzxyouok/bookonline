package com.bookonline.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookonline.JavaBean.*;
import com.bookonline.DB.*;
//进行订票
public class BookServlet extends HttpServlet 
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
        String checi = (String)request.getParameter("checi");
        TicketDao ticketDao=new TicketDao();
        // System.out.println("===="+checi+"====="+qidian+"===="+zhongdian);
        // update方法更改已经订了的票
        boolean value = false;
		try {
			value = ticketDao.update(connection,checi);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(value)
		{
			// 订票成功
			RequestDispatcher dispatcher = request.getRequestDispatcher("booksuccess.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			// 订票失败
			RequestDispatcher dispatcher = request.getRequestDispatcher("bookfailed.jsp");
			dispatcher.forward(request, response);
		}         
    }
}
