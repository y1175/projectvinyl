package jy.com.homedream.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jy.com.homedream.DTO.JY_ItemDTO;
import jy.com.homedream.DTO.JY_JN_MemberDTO;

public class JY_BuyDAO {
	private static JY_BuyDAO dao = new JY_BuyDAO();
	
	private JY_BuyDAO() {}
	
	public static JY_BuyDAO getDAO() {
		return dao;
	}
	
	public JY_ItemDTO selectItem(Connection conn, int item_no) throws SQLException {
		JY_ItemDTO dto = new JY_ItemDTO();
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
				dto.setItem_no(rs.getInt("item_no"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setSale(rs.getFloat("sale"));
				dto.setFile_name(rs.getString("file_name"));
			}
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
		return dto;
	} 
	
	

	public void buyItem(Connection conn, int mem_no, int item_no, JY_ItemDTO itemdto) throws SQLException {
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
	
	
	public JY_JN_MemberDTO buyMember(Connection conn, int mem_no) throws SQLException {
		PreparedStatement pstmt = null; 
		JY_JN_MemberDTO dto = new JY_JN_MemberDTO();
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
				dto.setMem_no(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				System.out.println(dto.getName());
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
