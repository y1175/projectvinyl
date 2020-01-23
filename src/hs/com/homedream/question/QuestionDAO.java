package hs.com.homedream.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
	private static QuestionDAO dao=new QuestionDAO();
	public static QuestionDAO getDAO() {
		return dao;
	}
	private QuestionDAO() {
		
	}
	public int totoalQcount(Connection conn, String hs_questionsearchtxt, String hs_questionsearch) throws SQLException{
		// TODO Auto-generated method stub
		int totalcount=0;
		ResultSet rs=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  select  count(*)     ");
		sql.append("  from    question     ");
		if(!("".equals(hs_questionsearchtxt)) && !("".equals(hs_questionsearch))) {
			if("title".equals(hs_questionsearch))
				sql.append("  where      title     like  ?             ");
			else if("content".equals(hs_questionsearch))
				sql.append("  where      content     like  ?           ");
		}
		try(PreparedStatement ps=conn.prepareStatement(sql.toString());) {
			if(!("".equals(hs_questionsearchtxt)) && !("".equals(hs_questionsearch))) {
				ps.setString(1, "%"+hs_questionsearchtxt+"%");
			}
			rs=ps.executeQuery();
			if(rs.next()) {
				totalcount=rs.getInt(1);
			}
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
		}
		return totalcount;
	}
	public List<QuestionDTO> getQlist(Connection conn, int startrow, int endrow, String hs_questionsearch, String hs_questionsearchtxt) throws SQLException{
		// TODO Auto-generated method stub
		ResultSet rs=null;
		List<QuestionDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		sql.append("  select  q_no                        ");
		sql.append("         ,m.name                      "); 
		sql.append("         ,title                       ");
		sql.append("         ,content                     ");
		sql.append("         ,qdate                       ");
		sql.append("         ,readno                      ");
		sql.append("         ,file_name                   ");
		sql.append("  from question q inner join member m ");
        sql.append("  on q.mem_no=m.mem_no                ");
        
        if(hs_questionsearch.equals("title"))
        	sql.append("     where   title   like ?      ");
        else if(hs_questionsearch.equals("content"))
        	sql.append("     where   content   like ?    ");
        //페이징                                       시작페이지    페이지사이즈
        sql.append("  limit       ?,     5              ");
        
		try(PreparedStatement ps=conn.prepareStatement(sql.toString())){
			if(hs_questionsearch.equals("")) {//검색한게 없으면
				ps.setInt(1, startrow);
				rs=ps.executeQuery();
			}else {
				ps.setString(1, "%"+hs_questionsearchtxt+"%");
				ps.setInt(2, startrow);
				rs=ps.executeQuery();
			}
			while(rs.next()) {
				QuestionDTO dto=new QuestionDTO();
				dto.setMem_name(rs.getString("m.name"));
				dto.setQ_no(rs.getInt("q_no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setQdate(rs.getString("qdate"));
				dto.setReadno(rs.getInt("readno"));
				dto.setFilename(rs.getString("file_name"));
				list.add(dto);
			}
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
		} 
		return list;
	}
	public void insertUpload(Connection conn, QuestionDTO dto) throws SQLException{
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  insert  into  question( mem_no    ");
		sql.append("                         ,title     ");
		sql.append("                         ,content   ");
		sql.append("                         ,qdate     ");
		sql.append("                         ,readno    ");
		sql.append("                         ,file_name)");
		sql.append("  values ( ?, ?, ?, now(),0,? )     ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setInt(1, dto.getMem_no());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getFilename());
			ps.executeUpdate();
		}finally {
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
	}
	public void readNoUpdate(Connection conn, int q_no) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  update  question        ");
		sql.append("  set     readno=readno+1 ");
		sql.append("  where   q_no=?          ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setInt(1, q_no);
			ps.executeUpdate();
		}finally {
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
	}
	public QuestionDTO detailSelect(Connection conn, int q_no) throws SQLException {
		// TODO Auto-generated method stub
		QuestionDTO dto=new QuestionDTO();
		PreparedStatement ps=null;
		ResultSet rs=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  select  q_no                          ");
		sql.append("         ,m.name                        "); 
		sql.append("         ,m.mem_no                      ");
		sql.append("         ,title                         ");
		sql.append("         ,content                       ");
		sql.append("         ,qdate                         ");
		sql.append("         ,readno                        ");
		sql.append("         ,file_name                     ");
		sql.append("  from   question q inner join member m ");
		sql.append("  on q.mem_no=m.mem_no                  ");
		sql.append("  where  q_no=?                         ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setInt(1, q_no);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto.setQ_no(rs.getInt("q_no"));
				dto.setMem_name(rs.getString("m.name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setQdate(rs.getString("qdate"));
				dto.setReadno(rs.getInt("readno"));
				dto.setFilename(rs.getString("file_name"));
				dto.setMem_no(rs.getInt("mem_no"));
				System.out.println(  "호도 dao 인간 번호"+dto.getMem_no());
			}
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
		return dto;
	}
	public void questionUpdate(Connection conn, QuestionDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  update  question      ");
		sql.append("  set     title = ?     ");
		sql.append("         ,content = ?   ");
		sql.append("         ,qdate = now() ");
		sql.append("         ,file_name = ? ");
		sql.append("  where  q_no = ?       ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getFilename());
			ps.setInt(4, dto.getQ_no());
			ps.executeUpdate();
		}finally {
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
		
	}
	public void questionDelete(Connection conn, int q_no) throws SQLException{
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		StringBuilder sql=new StringBuilder();
		sql.append("  delete               ");
		sql.append("  from    question     ");
		sql.append("  where   q_no = ?     ");
		try {
			ps=conn.prepareStatement(sql.toString());
			ps.setInt(1, q_no);
			ps.executeUpdate();
		}finally {
			if(ps!=null) try {ps.close();} catch(SQLException e) {}
		}
	}

	
}
