package jy.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;

import jy.com.homedream.DAO.JY_BuyDAO;
import jy.com.homedream.DTO.JY_ItemDTO;
import jy.com.homedream.DTO.JY_JN_MemberDTO;

public class JY_BuyService {
	private static JY_BuyService sercive = new JY_BuyService();
	public static JY_BuyService getService() {
		return sercive;
	}
	
	private JY_BuyService() {}

	public JY_ItemDTO getBuy(int mem_no, int item_no) {
	
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		JY_ItemDTO itemdto = new JY_ItemDTO();

		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			JY_BuyDAO buydao = JY_BuyDAO.getDAO();
			itemdto = buydao.selectItem(conn, item_no);
			buydao.buyItem(conn, mem_no, item_no, itemdto);
			conn.commit();
		} catch(SQLException | NamingException e) {
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return itemdto;
	}
	
	public JY_JN_MemberDTO getBuyMember(int mem_no) {
		
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		JY_JN_MemberDTO memberdto = new JY_JN_MemberDTO();
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			JY_BuyDAO buydao = JY_BuyDAO.getDAO();
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
