package hm.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;

import hm.com.homedream.dao.Hm_ExpertDAO;
import hm.com.homedream.dto.Hm_ExpertDTO;

public class Hm_ExpertService {

	private static Hm_ExpertService service = new Hm_ExpertService();
	
	public static Hm_ExpertService getService()
	{
		return service;
	}
	private Hm_ExpertService() {}
	public void dataInsert(Hm_ExpertDTO dto) {
		// TODO Auto-generated method stub
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			Hm_ExpertDAO dao = Hm_ExpertDAO.getDAO();
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
	public List<Hm_ExpertDTO> getList(int currpage , int pagepercount, String search) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		List<Hm_ExpertDTO> list = new ArrayList<Hm_ExpertDTO>();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			Hm_ExpertDAO dao = Hm_ExpertDAO.getDAO();
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
			Hm_ExpertDAO dao = Hm_ExpertDAO.getDAO();
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
	public Hm_ExpertDTO getSelect(int no) {
		// TODO Auto-generated method stub
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		Hm_ExpertDTO dto = new Hm_ExpertDTO();
		try {
			conn= db.getConnection();
			conn.setAutoCommit(false);
			Hm_ExpertDAO dao = Hm_ExpertDAO.getDAO();
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
	public void dataUpdate(Hm_ExpertDTO dto) {
		// TODO Auto-generated method stub
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			Hm_ExpertDAO dao = Hm_ExpertDAO.getDAO();
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
	
	
}
