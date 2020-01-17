package hm.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hm.com.homedream.dto.Hm_ExpertDTO;

public class Hm_ExpertDAO {

	private static Hm_ExpertDAO dao = new Hm_ExpertDAO();
	
	public static Hm_ExpertDAO getDAO()
	{
		return dao;
	}
	private Hm_ExpertDAO() {}
	public void dataInsert(Connection conn, Hm_ExpertDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("  insert into expert(                            ");
		sql.append("          name                                  ");
		sql.append("          ,text                                  ");
		sql.append("          ,place                                 ");
		sql.append("          ,lat                                   ");
		sql.append("          ,lon                                   ");
		sql.append("          ,file_name                             ");
		sql.append("          ,loc      )                            ");
		sql.append("         values(?,?,?,?,?,?,?)                   ");
		try {
			pstmt = conn.prepareStatement(sql.toString());	
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getText());
			pstmt.setString(3, dto.getPlace());
			pstmt.setString(4, dto.getLat());
			pstmt.setString(5, dto.getLoc());
			pstmt.setString(6, dto.getFile_name());
			pstmt.setString(7, dto.getLoc());
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
	}
	
	
}
