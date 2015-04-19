package com.bookonline.JavaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDao 
{
    // insert方法 向数据库中插入用户信息
	public int insert(Connection connection, UserBean user)
        {
	
		int value=-1;
		PreparedStatement statement=null;
		String sql="insert into User_(userName,password,repassword,realName,gender,tel,email,admin) values(?,?,?,?,?,?,?,?)";
                try 
                {
                    statement=connection.prepareStatement(sql);
                    statement.setString(1,user.getUserName());
                    statement.setString(2,user.getPassword());
                    statement.setString(3,user.getRepassword());
                    statement.setString(4,user.getRealName());
                    statement.setString(5,user.getGender());
                    statement.setString(6,user.getTel());
                    statement.setString(7,user.getEmail());
                    statement.setInt(8, 0);
                    value=statement.executeUpdate();
                } 
                catch (SQLException ex)
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
        //check方法 根据登陆界面传输的用户名和密码与数据库进行比较
        // 如果有这用户名则返回真,每有责返回假 
    public boolean check(Connection connection, String userName, String password)
    {
		boolean value = false;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select userName from User_ where userName = ? and password = ?";
		try
		{
			// 获得PreparedStatement对象，并填充
			statement = connection.prepareStatement(sql);
			statement.setString(1,userName);
			statement.setString(2,password);
			resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				value = true;
			}
			return value;
		}
		catch (SQLException e)
		{
		}
		finally
		{
			try
			{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
			}
			catch (SQLException e)
			{
			}
		}
		return value;
          }
    
 // getUser方法  根据userName 进行数据库查询操作
 // 将查询出的值放入UserBean对象中 并返回该对象
    public UserBean getUser(Connection connection, String userName)
    {
          UserBean user=new UserBean();
          String sql="select userName,password,realName,gender,tel,email,admin from User_ where userName=?";
          PreparedStatement statement=null;
          ResultSet result=null;
          
          try
          {
              statement=connection.prepareStatement(sql);
              statement.setString(1,userName);
              result=statement.executeQuery();
              while(result.next())
              {
                  user.setUserName(result.getString("userName"));
                  user.setPassword(result.getString("password"));
                  user.setRealName(result.getString("realName"));
                  user.setGender(result.getString("gender"));
                  user.setTel(result.getString("tel"));
                  user.setEmail(result.getString("email"));
                  user.setAdmin(Integer.parseInt(result.getString("admin")));
              }
              return user;
          }
         catch (SQLException e)
         {
         }
          finally
          {
             try
             {
                 if(statement!=null)statement.close();
                 if(result!=null)result.close();
             }
             catch(SQLException e)
             {
             }
          }
          return user;
    }
  
     // Update 获得用户修改后的信息 进行数据库的修改操作
        public int Update(Connection connection, UserBean user)
	{
		int value = -1;
		PreparedStatement statement = null;
		String sql = "update User_ set  realName = ?, gender = ?, tel = ?, email = ? where userName = ?";

		try
		{
			// 获得PreparedStatement对象
			statement = connection.prepareStatement(sql);
			// 填充statement的参数
			
			statement.setString(1, user.getRealName());
			statement.setString(2, user.getGender());
			statement.setString(3, user.getTel());
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getUserName());			
			// 执行修改操作
			value = statement.executeUpdate();
		}
		catch (SQLException e)
		{
		}
		finally
		{
			try
			{
				if(statement != null) statement.close();
				//if(connection != null) connection.close();
			}
			catch (SQLException e)
			{
			}
		}
		return value;
	}
        
        // UpdatePass  根据用户输入的密码 进行输入密码修改操作
        public int UpdatePass(Connection connection,String password,String userName)
	{
		int value = -1;
		PreparedStatement statement = null;
		String sql = "update User_ set password = ? where userName = ?";

		try
		{
			// 获得PreparedStatement对象
			statement = connection.prepareStatement(sql);
			// 填充statement的参数
			statement.setString(1, password);
			statement.setString(2, userName);
			// 执行修改操作
			value = statement.executeUpdate();
		}
		catch (SQLException e)
		{
		}
		finally
		{
			try
			{
				if(statement != null) statement.close();
				//if(connection != null) connection.close();
			}
			catch (SQLException e)
			{
			}
		}
		return value;
	}
 
}