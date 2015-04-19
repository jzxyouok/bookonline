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

public class AddTrainServlet extends HttpServlet 
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
        String shijian = (String)request.getParameter("shijian");
        String piaojia = (String)request.getParameter("piaojia");
        String shengyu = (String)request.getParameter("shengyu");
        TicketDao ticketDao=new TicketDao();
        // System.out.println("===="+checi+"====="+qidian+"===="+zhongdian);
        // query方法查询是否有该种车次的票
        int value = -1;
		try {
			value = ticketDao.add(connection,checi,qidian,zhongdian,shijian,piaojia,shengyu);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(value == 1)
		{
			// 添加成功！
        	request.getSession().setAttribute("message", "添加成功，再次添加或返回！");
			RequestDispatcher dispatcher = request.getRequestDispatcher("addtrain.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			// 添加失败
			request.getSession().setAttribute("message", "添加失败，重新添加或返回！");
			RequestDispatcher dispatcher = request.getRequestDispatcher("addtrain.jsp");
			dispatcher.forward(request, response);
		}         
    }
}
