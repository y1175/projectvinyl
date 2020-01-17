package yi.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import yi.com.homedream.dto.MemberDTO;

public class MemberDAO {

	private MemberDAO() {}
	private static MemberDAO dao=new MemberDAO();
	public static MemberDAO getDAO()
	{
		return dao;
	}
	public void join(Connection conn, MemberDTO dto) throws SQLException {
		StringBuilder sql=new StringBuilder();
		sql.append(" insert into  ");
		sql.append("  member(id,pwd,name,birth,phone,addr,zipcode)  ");
		sql.append("  values(               ");
		sql.append("         ?,?,?,?,?,?,?) ");
		
		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAddr());
			pstmt.setInt(7, dto.getZipcode());
			
			pstmt.executeUpdate();
			
		}
		
	}
	public String getLogin(Connection conn,String id, String pwd) throws SQLException{
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		String userId=null;
		sql.append(" select id,pwd ");
		sql.append(" from member  ");
		sql.append(" where id=? and pwd=?   ");
		
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				userId=rs.getString(1);
			}

			
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		
		return userId;
	}
	
	
	
}
