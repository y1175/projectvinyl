package com.homedream.comm;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {

	private DBConnection() {}
	private static DBConnection instance=new DBConnection();
	public static DBConnection getInstance()
	{
		return instance;
	}
	
	public Connection getConnection() throws NamingException,SQLException
	{
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/bitcamp");
		Connection conn=ds.getConnection();
		
		return conn;
	}
	
}
