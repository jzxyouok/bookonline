package com.bookonline.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookonline.JavaBean.*;
import com.bookonline.DB.*;

public class QueryServlet extends HttpServlet 
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
        String qidian = (String)request.getParameter("qidian");
        String zhongdian = (String)request.getParameter("zhongdian");
        TicketDao ticketDao=new TicketDao();
        // System.out.println("===="+checi+"====="+qidian+"===="+zhongdian);
        // query方法查询是否有该种车次的票
        boolean value = false;
        List ticketList = new ArrayList();
		try {
			value = ticketDao.query(connection,checi,qidian,zhongdian);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(value)
		{
			// 有该车次的票，跳转到订票页面
        	try {
				ticketList = ticketDao.queryAll(connection, checi);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("ticketList", ticketList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("showticket.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			// 没有该车次的票
			RequestDispatcher dispatcher = request.getRequestDispatcher("queryfailed.jsp");
			dispatcher.forward(request, response);
		}         
    }
}
