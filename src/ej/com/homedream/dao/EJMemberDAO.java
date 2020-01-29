package ej.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import ej.com.homedream.dto.EJMemberDTO;

public class EJMemberDAO {
	
	private static EJMemberDAO dao=new EJMemberDAO();
	public static EJMemberDAO getDAO() {
		
		return dao;
	}//싱글톤
	private EJMemberDAO() {}
///////////////////////////////////////////////////////////////////////////////////////////////////

	public int memberCount(Connection conn, String search, String txtsearch
			, int stxtsearch1, int stxtsearch2) throws SQLException {//자료수 리턴
		StringBuilder sql=new StringBuilder();
		int count=0;
		ResultSet rs=null;
		
		sql.append(" select count(*) ");
		sql.append(" from member     ");
		sql.append(" where mem_no!=1 ");
		//검색
		if(!search.equals("")&&!txtsearch.equals(""))
		{
			if(search.equals("id"))
				sql.append(" and id like ? ");
			else if(search.equals("name"))
				sql.append(" and name like ? ");
		}
		//금액검색 
		if(stxtsearch1!=0&&stxtsearch2!=0)
		{
			sql.append(" and total between ? and ? ");
		}
		//System.out.println("sql:"+sql);
		
	
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString())){
			if(!search.equals("")&&!txtsearch.equals(""))
			{
			pstmt.setString(1,"%"+txtsearch+"%");//txtsearch를 포함하는
				
			}//else//검색안할때
			{
				if(stxtsearch1!=0&&stxtsearch2!=0)//금액검색하면
				{
					pstmt.setInt(1, stxtsearch1);
					pstmt.setInt(2, stxtsearch2);
				}
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
//////////////////////////////////////////////////////////////////////////////
	public List<EJMemberDTO> getlist(Connection conn, int startrow, int endrow, String search, String txtsearch
			, int stxtsearch1, int stxtsearch2) throws SQLException {//리스트출력
		
		List<EJMemberDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		
		sql.append(" select  member.mem_no, id, pwd, name, total, sum(ifnull(point,0)) as 'point' ");
		sql.append(" from member ");
		sql.append(" left outer join point_msg ");
		sql.append(" on member.mem_no=point_msg.mem_no ");
		
		
		
		if(!search.equals("")&&!txtsearch.equals(""))//검색을 하면
		{	
			if(search.equals("id"))
				sql.append(" where id like ? ");
			else if(search.equals("name"))
				sql.append(" where name like ? ");
		}
		if(stxtsearch1!=0&&stxtsearch2!=0)//금액검색하면
		{
			sql.append(" where total between ? and ? ");
		}
		
			sql.append(" group by mem_no ");
			sql.append(" limit ?,15 ");
			
			//System.out.println("sql2:"+sql);
			
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString())){
		
		if(!search.equals("")&&!txtsearch.equals(""))//검색하면
		{
			pstmt.setString(1, "%"+txtsearch+"%");
			pstmt.setInt(2, startrow);
			
		}
		else if(stxtsearch1!=0&&stxtsearch2!=0)//금액검색하면
		{
			pstmt.setInt(1, stxtsearch1);
			pstmt.setInt(2, stxtsearch2);
			pstmt.setInt(3, startrow);
		}
		else{//존재하지않으면 또는 검색안하면
			pstmt.setInt(1, startrow);
		}
		
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				EJMemberDTO dto=new EJMemberDTO();
				dto.setMemNo(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				//dto.setBirth(rs.getString("birth"));
				//dto.setPhone(rs.getString("phone"));
				//dto.setAddr(rs.getString("addr"));
				//dto.setZipcode(rs.getInt("zipcode"));
				//dto.setTotal(rs.getInt("total"));
				dto.setPoint(rs.getInt("point"));
				
				
				list.add(dto);
			}
	}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}
	public void delete(Connection conn, int memno) throws SQLException {
		StringBuilder sql=new StringBuilder();
		
		System.out.println("memno:"+memno);
		sql.append(" delete from member ");
		sql.append(" where mem_no=? ");
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString())){
			pstmt.setInt(1, memno);
			pstmt.executeUpdate();
			//System.out.println("2222");
		}
	}
	public void delete2(Connection conn, int memno) throws SQLException {
			StringBuilder sql=new StringBuilder();
		
		sql.append(" delete from point_msg ");
		sql.append(" where mem_no=? ");
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString())){
			pstmt.setInt(1, memno);
			int r=pstmt.executeUpdate();
			//System.out.println("111"+r);
		}
		
	}
	public void insert(Connection conn, int memno, int addpoint) throws SQLException {
		StringBuilder sql=new StringBuilder();
		
		sql.append(" insert into point_msg(mem_no,point) ");
		sql.append(" values(?,?) ");
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString())){
			pstmt.setInt(1, memno);
			pstmt.setInt(2, addpoint);
			pstmt.executeUpdate();
			
		}
		
	}

}
