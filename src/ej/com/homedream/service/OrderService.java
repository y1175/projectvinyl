package ej.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;


import ej.com.homedream.dao.OrderDAO;
import ej.com.homedream.dto.OrderDTO;




public class OrderService {

	private static OrderService service=new OrderService();
	public static OrderService getService() {
		
		return service;
	}//�̱���
	
	private OrderService() {}
	//////////////////////////////////////////////////////////////
	public int getCount(String search, String txtsearch, int txtsearch1, int txtsearch2)
	{//connection���� dao�� �Ѱ�
		
		DBConnection db=DBConnection.getInstance();//dbconnection�� �޾�
		Connection conn=null;
		int count=0;
		try{
			conn=db.getConnection();
			conn.setAutoCommit(false);
			OrderDAO dao=OrderDAO.getDAO();//�̱��������ϱ� �̷���
			count=dao.orderCount(conn, search, txtsearch, txtsearch1, txtsearch2);
			//System.out.println("count: "+count);
			conn.commit();
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return count;
	}//��ü �ڷ��
	
	public List<OrderDTO> getList(int startrow, int endrow, String search, String txtsearch
			, int stxtsearch1, int stxtsearch2) {//���
		Connection conn=null;
		List<OrderDTO> list=null;
				
		try {
			DBConnection db=DBConnection.getInstance();
			
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			OrderDAO dao=OrderDAO.getDAO();
			list=dao.getlist(conn,startrow, endrow, search, txtsearch, stxtsearch1, stxtsearch2);
			//list�� ������ �޾ƢZ����
			
			conn.commit();
			
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}return list;
		
	}
	

	public void delete(int orderno) {
		Connection conn=null;
	
				
		try {
			DBConnection db=DBConnection.getInstance();
			
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			OrderDAO dao=OrderDAO.getDAO();
			
			dao.delete(conn,orderno);
			//list�� ������ �޾ƢZ����
			
			conn.commit();
			
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
	}

	
		
	}
	

