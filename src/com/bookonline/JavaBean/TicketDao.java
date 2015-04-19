package com.bookonline.JavaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class TicketDao
{	//查询是否有该种车
    public boolean query(Connection connection, String checi, String qidian,String zhongdian) throws SQLException
    {
		boolean value = false;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select checi from TrainInfo where checi = ? and qidian = ? and zhongdian = ?";		
			// 获得PreparedStatement对象，并填充
			statement = connection.prepareStatement(sql);
			statement.setString(1,checi);
			statement.setString(2,qidian);
			statement.setString(3,zhongdian);
			resultSet = statement.executeQuery();
			
			if(resultSet.next())
			{
				value = true;
				//System.out.println("===="+checi+"====="+qidian+"===="+zhongdian);
				return value;
			}			
		
			try
			{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
			}
			catch (SQLException e)
			{
			}
		return value;
  }
    
    //订票
    public boolean update(Connection connection, String checi) throws SQLException
    {
		boolean value = false;
		PreparedStatement statement = null;
		Statement st = connection.createStatement();
		ResultSet resultSet = null;
		String sql = "select shengyu from TrainInfo where checi = ?";		
			// 获得PreparedStatement对象，并填充
			statement = connection.prepareStatement(sql);
			statement.setString(1,checi);
			resultSet = statement.executeQuery();
			if(resultSet.next())
			{	
				int x = Integer.parseInt(resultSet.getString(1));
				if(x >= 1){
					sql = "update TrainInfo set shengyu = shengyu - 1";
					int t = st.executeUpdate(sql);
//					System.out.println("======================"+t);
//					value = st.execute(sql);//对数据进行修改
//					System.out.println("======================"+value);
					//System.out.println("===="+checi+"====="+qidian+"===="+zhongdian);
					if(t == 1) value = true;
					return value;
				}
			}			
		
			try
			{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
			}
			catch (SQLException e)
			{
			}
		return value;
  }
    
    
    //查询所有的票，用于显示
    public List queryAll(Connection connection, String checi) throws SQLException
    {
    	List list = new ArrayList();
    	String sql = "select checi,qidian,zhongdian,shijian,piaojia,shengyu from TrainInfo where checi = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1,checi);
		ResultSet resultSet = statement.executeQuery();;
		TicketBean ticket = null;
		while(resultSet.next())
		{
			ticket = new TicketBean();
			ticket.setCheci(resultSet.getString("checi"));
			ticket.setQidian(resultSet.getString("qidian"));
			ticket.setZhongdian(resultSet.getString("zhongdian"));
			ticket.setShijian(resultSet.getString("shijian"));
			ticket.setPiaojia(resultSet.getString("piaojia"));
			ticket.setShengyu(resultSet.getString("shengyu"));
			list.add(ticket);
		}		
		return list;
    }
    
  //查询所有的票，用于显示
    public int add(Connection connection, String checi,String qidian,String zhongdian,String shijian,String piaojia,String shengyu) throws SQLException
    {
    	int value = -1;
    	String sql = "insert into TrainInfo(checi,qidian,zhongdian,shijian,piaojia,shengyu) values(?,?,?,?,?,?)";
		PreparedStatement statement = null;
		try{	
			statement = connection.prepareStatement(sql);
			statement.setString(1,checi);
            statement.setString(2,qidian);
            statement.setString(3,zhongdian);
            statement.setString(4,shijian);
            statement.setString(5,piaojia);
            statement.setString(6,shengyu);
            value=statement.executeUpdate();
		}catch (SQLException ex)
        {
            ex.printStackTrace();
        }
		finally
		{
		    try
			{
				if(statement != null) statement.close();
			}
			catch (SQLException ex)
			{
			}
		}		
		return value;
    }
}
  
