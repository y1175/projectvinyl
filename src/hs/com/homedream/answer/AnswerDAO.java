package hs.com.homedream.answer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnswerDAO {
	private static AnswerDAO dao=new AnswerDAO();
	public static AnswerDAO getAnswerDAO() {
		return dao;
	}
	private AnswerDAO() {
		
	}
	public void getAnswerAdd(Connection conn, AnswerDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  insert  into  answer( q_no      ");
		sql.append("                       ,mem_no    ");
		sql.append("                       ,content ) ");
		sql.append("  values(    ?   ,    ?   , ?  )  ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setInt(1, dto.getQ_no());
			ps.setInt(2, dto.getMem_no());
			ps.setString(3, dto.getContent());
			System.out.println("호도 디티오"+dto.getContent());
			
			ps.executeUpdate();
		}finally {
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
	}
	public String answerID(Connection conn, int mem_no) throws SQLException {
		// TODO Auto-generated method stub
		String answerid=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  select  id           ");
		sql.append("  from    member       ");
		sql.append("  where   mem_no=?     ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setInt(1, mem_no);
			rs=ps.executeQuery();
			if(rs.next()) {
				answerid=rs.getString(1);
			}
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
		
		return answerid;
	}
	public List<AnswerDTO> getDetailList(Connection conn, int no) throws SQLException{
		// TODO Auto-generated method stub
		String answerid=null;
		ResultSet rs=null;
		List<AnswerDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		sql.append("  select  a_no         ");
		sql.append("         ,q_no         ");
		sql.append("         ,mem_no       ");
		sql.append("         ,content      ");
		sql.append("  from    answer       ");
		sql.append("  where   q_no=?       ");
		try(PreparedStatement ps=conn.prepareStatement(sql.toString())){
			ps.setInt(1, no);
			rs=ps.executeQuery();
			answerid=answerID(conn, 2);
			while(rs.next()) {
				AnswerDTO dto=new AnswerDTO();
				dto.setA_no(rs.getInt("a_no"));
				dto.setQ_no(rs.getInt("q_no"));
				dto.setMem_no(rs.getInt("mem_no"));
				dto.setContent(rs.getString("content"));
				dto.setAnswerid(answerid);
				list.add(dto);
			}
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
		}
		return list;
	}
	public void getAnswerDelete(Connection conn, int a_no) throws SQLException{
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  delete               ");
		sql.append("  from    answer       ");
		sql.append("  where   a_no=?       ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setInt(1, a_no);
			ps.executeUpdate();
		}finally {
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
		
	}
}
