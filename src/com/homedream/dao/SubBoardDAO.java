package com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.homedream.dto.SubBoardDTO;
import com.mysql.cj.xdevapi.Result;

public class SubBoardDAO {

	
	private static SubBoardDAO dao = new SubBoardDAO(); 
	private SubBoardDAO() {
		// TODO Auto-generated constructor stub
	}
	public static SubBoardDAO getDAO() {
		return dao;
	}
	public void SubBoardAdd(Connection conn, SubBoardDTO subdto) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("   insert     into     reply   (     ");
		sql.append("   bno,   mem_no   ,    content  )   ");
		sql.append("   values(     ? ,      ? ,      ? ) ");
		try {
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setInt(1, subdto.getBno());
			pstmt.setInt(2, subdto.getMem_no());
			pstmt.setString(3, subdto.getSubcontent());
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
	}
	public String SubBoardSubID(Connection conn, int memno) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String subid = new String();
		StringBuilder sql = new StringBuilder();
		sql.append("   select      id          ");
		sql.append("   from        member      ");
		sql.append("   where       mem_no  = ? ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, memno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				subid = rs.getString(1);
				System.out.println("¾ÆÀÌµð"+subid);
			}
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {};
		}
		return subid;
	}
	public List<SubBoardDTO> SubBoardDetail(Connection conn, int num) throws SQLException {
		
		List<SubBoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String subid = new String();
		StringBuilder sql = new StringBuilder();
		sql.append("    select     rno        ");
		sql.append("               ,bno       ");
		sql.append("               ,mem_no    ");
		sql.append("               ,content   ");
		sql.append("    from       reply      ");
		sql.append("    where      bno  =  ?  ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			subid = SubBoardSubID(conn, 58);
			
			while(rs.next()) {
				SubBoardDTO dto = new SubBoardDTO();
				dto.setRno(rs.getInt("rno"));
				dto.setBno(rs.getInt("bno"));
				dto.setMem_no(rs.getInt("mem_no"));
				dto.setSubcontent(rs.getString("content"));
				dto.setSubid(subid);
				list.add(dto);
			}
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {};
		}
		return list;
	}
	public void SubBoardDelete(Connection conn, int rno) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("    delete     from         reply      ");
		sql.append("    where      rno     =    ?          ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
	}

}




