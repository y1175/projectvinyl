package com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.homedream.dto.ItemDTO;
import com.homedream.dto.MemberDTO;

public class BuyDAO {
	private static BuyDAO dao = new BuyDAO();
	
	private BuyDAO() {}
	
	public static BuyDAO getDAO() {
		return dao;
	}
	
	public ItemDTO selectItem(Connection conn, int item_no) throws SQLException {
		ItemDTO dto = new ItemDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		sql.append("     select       item_no      ,      name     ,        content     ");
		sql.append("                  ,price       ,stock          ,     sale           ");
		sql.append("                               ,    file_name             ");
		sql.append("     from         item                                              ");
		sql.append("     where        item_no      =      ?                             ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, item_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setItemNo(rs.getInt("item_no"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setSale(rs.getInt("sale"));
				dto.setFileName(rs.getString("file_name"));
			}
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
		return dto;
	} 
	
	

	public void butem(Connection conn, int mem_no, int item_no, ItemDTO itemdto) throws SQLException {
		PreparedStatement pstmt = null; 
		StringBuilder sql = new StringBuilder();
		sql.append("    insert     into      orderlist                        ");
		sql.append("    (   mem_no     ,    item_no  ,  orderdate             ");
		sql.append("     , status     ,      cost                          )  "); 
		sql.append("    values    (    ?    ,   ?  , now(),   1    ,  ?    )  ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, mem_no);
			pstmt.setInt(2, item_no);
			pstmt.setInt(3, itemdto.getPrice());
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
	}
	
	
	public MemberDTO buyMember(Connection conn, int mem_no) throws SQLException {
		PreparedStatement pstmt = null; 
		MemberDTO dto = new MemberDTO();
		StringBuilder sql = new StringBuilder();
		ResultSet rs = null;
		sql.append("    select     mem_no   , id   ,   name   ,   phone   ,   addr  ,  zipcode ");
		sql.append("    from                              member                               ");
		sql.append("    where                             mem_no    =       ?                  ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, mem_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setMemNo(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddr(rs.getString("addr"));
				dto.setZipcode(rs.getInt("zipcode"));
			}
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
		return dto;
	}
	
}
