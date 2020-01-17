package ej.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import ej.com.homedream.dto.MemberDTO;

public class MemberDAO {
	
	private static MemberDAO dao=new MemberDAO();
	public static MemberDAO getDAO() {
		
		return dao;
	}//싱글톤
	private MemberDAO() {}
////////////////////////////////////////////////////////////////////////////////////

	public int memberCount(Connection conn, String search, String txtsearch) throws SQLException {//자료수 리턴
		StringBuilder sql=new StringBuilder();
		int count=0;
		ResultSet rs=null;
		
		sql.append(" select count(*) ");
		sql.append(" from member     ");
		sql.append(" where mem_no!=1 ");
		
		if(!search.equals("")&&!txtsearch.equals(""))
		{
			if(search.equals("id"))
				sql.append(" and id like ? ");
			else if(search.equals("name"))
				sql.append(" and name like ? ");
			
			
		}
		
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			if(!search.equals("")&&!txtsearch.equals(""))
			{
			pstmt.setString(1,"%"+txtsearch+"%");//txtsearch를 포함하는
			}
			 rs=pstmt.executeQuery();
			 if(rs.next()) {
					count=rs.getInt(1);//첫번째꺼가져와
			 }
		
		}
		finally {
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
		}
		return count;
	}

	public List<MemberDTO> getlist(Connection conn, int startrow, int endrow, String search, String txtsearch) throws SQLException {//리스트출력
		
		List<MemberDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		
		sql.append(" select * 				    	");
		sql.append(" from( 				     		");
		sql.append("  select rownum as rnum, b.*   ");
		sql.append("  from(                        ");
		sql.append("        select mem_no            ");
		sql.append("  			   ,id      ");
		sql.append("  			   ,pwd    ");
		sql.append(" 				,name    ");
		sql.append("  			    ,birth ");
		sql.append("  			    ,phone ");
		sql.append("  			    ,addr ");
		sql.append("  			    ,zipcode ");
		sql.append("  				from member   ");
		sql.append("  				where mem_no!=1   ");
		
		
		if(!search.equals("")&&txtsearch.equals(""))//null이 아니면
		{	
			if(search.equals("id"))
				sql.append(" where id like ? ");
			else if(search.equals("name"))
				sql.append(" where name like ? ");
		}
		sql.append(" order by mem_no asc 		 ");
		sql.append("  		 ) b 		 ");
		sql.append("  where rownum<=?    ");
		sql.append("   )			     ");
		sql.append("   where rnum>=?  ");
		
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
		
		if(!search.equals("")&&txtsearch.equals(""))
		{
			pstmt.setString(1, "%"+txtsearch+"%");
			pstmt.setInt(2, endrow);
			pstmt.setInt(3, startrow);
		}
		else{
			pstmt.setInt(1,endrow);
			pstmt.setInt(2, startrow);
		}
		
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MemberDTO dto=new MemberDTO();
				dto.setMemNo(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddr(rs.getString("addr"));
				dto.setZipcode(rs.getInt("zipcode"));
				
				list.add(dto);
			}
	}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}

}
