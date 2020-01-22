package com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;
import com.homedream.dao.ExpertDAO;
import com.homedream.dto.ExpertDTO;

public class ExpertService {

	private static ExpertService service = new ExpertService();
	
	public static ExpertService getService()
	{
		return service;
	}
	private ExpertService() {}
	public void dataInsert(ExpertDTO dto) {
		// TODO Auto-generated method stub
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			ExpertDAO dao = ExpertDAO.getDAO();
			dao.dataInsert(conn,dto);
			conn.commit();
		}catch(NamingException | SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(SQLException e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}
	public List<ExpertDTO> getList(int currpage , int pagepercount, String search) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		List<ExpertDTO> list = new ArrayList<ExpertDTO>();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			ExpertDAO dao = ExpertDAO.getDAO();
			list = dao.getList(conn,currpage,pagepercount,search);
			conn.commit();
		}catch(SQLException | NamingException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(SQLException e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return list;
	}
	public int getCount(String search) {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		int result = 0;
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			ExpertDAO dao = ExpertDAO.getDAO();
			result = dao.getCount(conn,search);
			conn.commit();
		}catch(SQLException | NamingException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(SQLException e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return result;
	}
	public ExpertDTO getSelect(int no) {
		// TODO Auto-generated method stub
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		ExpertDTO dto = new ExpertDTO();
		try {
			conn= db.getConnection();
			conn.setAutoCommit(false);
			ExpertDAO dao = ExpertDAO.getDAO();
			dto = dao.getSelect(conn,no);
			conn.commit();
		}catch(SQLException | NamingException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(SQLException e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return dto;
	}
	public void dataUpdate(ExpertDTO dto) {
		// TODO Auto-generated method stub
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			ExpertDAO dao = ExpertDAO.getDAO();
			dao.dataUpdate(conn,dto);
			conn.commit();
			
		}catch(SQLException | NamingException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(SQLException e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}
	public void dataDelete(int no) {
		// TODO Auto-generated method stub
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			ExpertDAO dao = ExpertDAO.getDAO();
			dao.dataDelete(conn,no);
			conn.commit();
		}catch(SQLException | NamingException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(SQLException e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}
	
	
}
