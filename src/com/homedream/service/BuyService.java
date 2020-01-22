package com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;
import com.homedream.dao.BuyDAO;
import com.homedream.dto.ItemDTO;
import com.homedream.dto.MemberDTO;

public class BuyService {
	private static BuyService sercive = new BuyService();
	public static BuyService getService() {
		return sercive;
	}
	
	private BuyService() {}

	public ItemDTO getBuy(int mem_no, int item_no) {
	
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		ItemDTO itemdto = new ItemDTO();

		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			BuyDAO buydao = BuyDAO.getDAO();
			itemdto = buydao.selectItem(conn, item_no);
			buydao.butem(conn, mem_no, item_no, itemdto);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return itemdto;
	}
	
	public ItemDTO getItem(int item_no) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		ItemDTO itemdto = new ItemDTO();

		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			BuyDAO buydao = BuyDAO.getDAO();
			itemdto = buydao.selectItem(conn, item_no);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return itemdto;
	}
	
	public MemberDTO getBuyMember(int mem_no) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		MemberDTO memberdto = new MemberDTO();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			BuyDAO buydao = BuyDAO.getDAO();
			memberdto = buydao.buyMember(conn, mem_no);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return memberdto;
	}

	
}
