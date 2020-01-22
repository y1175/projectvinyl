package com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;
import com.homedream.dao.BoardDAO;
import com.homedream.dao.SubBoardDAO;
import com.homedream.dto.BoardDTO;
import com.homedream.dto.SubBoardDTO;

public class BoardService {

	private static BoardService sercive = new BoardService();
	public static BoardService getService() {
		return sercive;
	}
	
	private BoardService() {}
	
	public List<BoardDTO> getList(String search, String searchtxt, int startrow, int endrow, String sorting) {
		
		DBConnection db = DBConnection.getInstance();
		List<BoardDTO> list = new ArrayList<>();
		Connection conn = null;
		try {
			conn = db.getConnection();
			System.out.println(conn);
			conn.setAutoCommit(false);
			BoardDAO dao = BoardDAO.getDAO();
			list = dao.boardList(conn,search, searchtxt,startrow, endrow,sorting);
			System.out.println(list);
			conn.commit();
			
		} catch (SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		return list;
	}
	
	public BoardDTO getSelect(int bno) {
		Connection conn = null;
		DBConnection db = DBConnection.getInstance();
		BoardDTO dto = new BoardDTO();
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao = BoardDAO.getDAO();
			dto = dao.boardSelect(conn,bno);
			dao.boardReadnoupdate(conn,bno);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return dto;
	}
	
	public void getUpdate(BoardDTO dto) {
		Connection conn = null;
		DBConnection db = DBConnection.getInstance();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao = BoardDAO.getDAO();
			dao.boardUpdate(conn,dto);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
	}
	
	public void getDelete(int bno) {
		Connection conn = null;
		DBConnection db = DBConnection.getInstance();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao = BoardDAO.getDAO();
			dao.boardDelete(conn,bno);
			conn.commit();
		}catch(SQLException | NamingException e){
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
	}
	
	
public void getUpload(BoardDTO dto) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao = BoardDAO.getDAO();
			dao.boardUpload(conn, dto);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
	}

	public int getTotalCount(String search, String searchtxt) {
	
	DBConnection db = DBConnection.getInstance();
	Connection conn = null;
	int totalcount = 0;
	try {
		conn = db.getConnection();
		conn.setAutoCommit(false);
		BoardDAO dao = BoardDAO.getDAO();
		totalcount = dao.boardTotalCount(conn,search,searchtxt);
		conn.commit();
	} catch(SQLException | NamingException e){
		System.out.println(e);
		try {conn.rollback();} catch(SQLException e2) {}
	} finally {
		if(conn!=null) try{conn.close();} catch(SQLException e) {}
	}
	
	return totalcount;
}



	public String getAddSubBoard(SubBoardDTO subdto) {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		String subid = new String();
		int memno = subdto.getMem_no();
		try {
			conn= db.getConnection();
			conn.setAutoCommit(false);
			SubBoardDAO dao = SubBoardDAO.getDAO();
			dao.SubBoardAdd(conn,subdto);
			subid = dao.SubBoardSubID(conn,memno);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return subid;
	}

	public List<SubBoardDTO> getDetailSubBoard(int num) {
		
		DBConnection db = DBConnection.getInstance();
		String subid = new String();
		Connection conn = null;
		List<SubBoardDTO> list = new ArrayList<>();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			SubBoardDAO dao = SubBoardDAO.getDAO();
			list = dao.SubBoardDetail(conn, num);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		
		return list;
	}

	public int getUpdateLike(int num) {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		int result = 0;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			BoardDAO dao = BoardDAO.getDAO();
			result=dao.boardUpdateLikeno(num,conn);
			conn.commit();
		}catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null)try {conn.close();} catch(SQLException e){}
		}
		return result;
	}

	public void getDeleteSubBoard(int rno) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			SubBoardDAO dao = SubBoardDAO.getDAO();
			dao.SubBoardDelete(conn, rno);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		} finally {
			if(conn!=null)try {conn.close();} catch(SQLException e){}
		}
		
	}

	
}
