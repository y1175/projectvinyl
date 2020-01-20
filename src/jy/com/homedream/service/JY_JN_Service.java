package jy.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;

import jy.com.homedream.DAO.JY_JN_BoardDAO;
import jy.com.homedream.DAO.JY_JN_SubBoardDAO;
import jy.com.homedream.DTO.JY_JN_BoardDTO;
import jy.com.homedream.DTO.JY_JN_SubBoardDTO;

public class JY_JN_Service {

	private static JY_JN_Service sercive = new JY_JN_Service();
	public static JY_JN_Service getService() {
		return sercive;
	}
	
	private JY_JN_Service() {}
	
	public List<JY_JN_BoardDTO> jn_getList(String search, String searchtxt, int startrow, int endrow, String sorting) {
		
		DBConnection db = DBConnection.getInstance();
		List<JY_JN_BoardDTO> jy_jn_list = new ArrayList<>();
		Connection conn = null;
		try {
			conn = db.getConnection();
			System.out.println(conn);
			conn.setAutoCommit(false);
			JY_JN_BoardDAO dao = JY_JN_BoardDAO.getDAO();
			jy_jn_list = dao.jn_boardList(conn,search, searchtxt,startrow, endrow,sorting);
			System.out.println(jy_jn_list);
			conn.commit();
			
		} catch (SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		return jy_jn_list;
	}
	
	public JY_JN_BoardDTO jn_getSelect(int bno) {
		Connection conn = null;
		DBConnection db = DBConnection.getInstance();
		JY_JN_BoardDTO dto = new JY_JN_BoardDTO();
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_BoardDAO dao = JY_JN_BoardDAO.getDAO();
			dto = dao.jn_boardSelect(conn,bno);
			dao.jn_boardReadnoupdate(conn,bno);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return dto;
	}
	
	public void jn_getUpdate(JY_JN_BoardDTO dto) {
		Connection conn = null;
		DBConnection db = DBConnection.getInstance();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_BoardDAO dao = JY_JN_BoardDAO.getDAO();
			dao.jn_boardUpdate(conn,dto);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
	}
	
	public void jn_getDelete(int bno) {
		Connection conn = null;
		DBConnection db = DBConnection.getInstance();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_BoardDAO dao = JY_JN_BoardDAO.getDAO();
			dao.jn_boardDelete(conn,bno);
			conn.commit();
		}catch(SQLException | NamingException e){
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
	}
	
	
public void jn_getUpload(JY_JN_BoardDTO dto) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_BoardDAO dao = JY_JN_BoardDAO.getDAO();
			dao.jn_boardUpload(conn, dto);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
	}

	public int jn_getTotalCount(String search, String searchtxt) {
	
	DBConnection db = DBConnection.getInstance();
	Connection conn = null;
	int totalcount = 0;
	try {
		conn = db.getConnection();
		conn.setAutoCommit(false);
		JY_JN_BoardDAO dao = JY_JN_BoardDAO.getDAO();
		totalcount = dao.jn_boardTotalCount(conn,search,searchtxt);
		conn.commit();
	} catch(SQLException | NamingException e){
		System.out.println(e);
		try {conn.rollback();} catch(SQLException e2) {}
	} finally {
		if(conn!=null) try{conn.close();} catch(SQLException e) {}
	}
	
	return totalcount;
}



	public String jn_getAddSubBoard(JY_JN_SubBoardDTO subdto) {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		String subid = new String();
		int memno = subdto.getMem_no();
		try {
			conn= db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_SubBoardDAO dao = JY_JN_SubBoardDAO.getDAO();
			dao.jn_SubBoardAdd(conn,subdto);
			subid = dao.jn_SubBoardSubID(conn,memno);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return subid;
	}

	public List<JY_JN_SubBoardDTO> jn_getDetailSubBoard(int num) {
		
		DBConnection db = DBConnection.getInstance();
		String subid = new String();
		Connection conn = null;
		List<JY_JN_SubBoardDTO> list = new ArrayList<>();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_SubBoardDAO dao = JY_JN_SubBoardDAO.getDAO();
			list = dao.jn_SubBoardDetail(conn, num);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
		return list;
	}

	public int jn_getUpdateLike(int num) {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		int result = 0;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_BoardDAO dao = JY_JN_BoardDAO.getDAO();
			result=dao.jn_boardUpdateLikeno(num,conn);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null)try {conn.close();} catch(SQLException e){}
		}
		return result;
	}

	public void jn_getDeleteSubBoard(int rno) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			JY_JN_SubBoardDAO dao = JY_JN_SubBoardDAO.getDAO();
			dao.jn_SubBoardDelete(conn, rno);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null)try {conn.close();} catch(SQLException e){}
		}
		
	}

	
}
