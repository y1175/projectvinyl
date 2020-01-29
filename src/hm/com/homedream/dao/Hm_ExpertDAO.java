package hm.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



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
		sql.append("          no                                    ");
		sql.append("          ,name                                 ");
		sql.append("          ,text                                  ");
		sql.append("          ,place                                 ");
		sql.append("          ,lat                                   ");
		sql.append("          ,lon                                   ");
		sql.append("          ,file_name                             ");
		sql.append("          ,addr      )                            ");
		sql.append("         values(?,?,?,?,?,?,?,?)                   ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getText());
			pstmt.setString(4, dto.getPlace());
			pstmt.setString(5, dto.getLat());
			pstmt.setString(6, dto.getLon());
			pstmt.setString(7, dto.getFile_name());
			pstmt.setString(8, dto.getAddr());
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
	}
	public List<Hm_ExpertDTO> getList(Connection conn,int currpage , int pagepercount ,String search) throws SQLException {
	
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		List<Hm_ExpertDTO> list = new ArrayList<Hm_ExpertDTO>();
		sql.append("   select                                               ");
		sql.append("                             no                         ");
		sql.append("                             ,name                      ");
		sql.append("                             ,text                      ");
		sql.append("                             ,place                     ");
		sql.append("                             ,lat                       ");
		sql.append("                             ,lon                       ");
		sql.append("                             ,file_name                 ");
		sql.append("                             ,addr                       ");
		sql.append("   from  expert                                         ");
		if(!search.equals(""))
		{
			if(search.equals("강남"))
	    sql.append("    where place like?                                     ");
			else if(search.equals("동작"))
		sql.append("     where place like?                                    ");
			else if(search.equals("강북"))
		sql.append("     where place like?                                    ");
			//테스트용 -> 이 부분 나중에 고칠 것 
		} 
		sql.append("     limit ?, ?                                           ");
		
		
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.toString());
			
			if(!search.equals(""))
			{
				pstmt.setString(1, search);
				pstmt.setInt(2, (currpage-1)*pagepercount);
				pstmt.setInt(3, pagepercount);
			}else {
				pstmt.setInt(1, (currpage-1)*pagepercount);
				pstmt.setInt(2, pagepercount);
			}
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Hm_ExpertDTO dto = new Hm_ExpertDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setText(rs.getString("text"));
				dto.setPlace(rs.getString("place"));
				dto.setFlat(Float.parseFloat(rs.getString("lat")));
				dto.setFlon(Float.parseFloat(rs.getString("lon")));
				dto.setFile_name(rs.getString("file_name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
			}
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}
	public int getCount(Connection conn, String search) throws SQLException{
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("  select    count(*)       ");
		sql.append("  from     expert          ");
		if(!search.equals(""))
		{
			if(search.equals("강남"))
				sql.append("   where place like?    ");
			else if(search.equals("동작"))
				sql.append("   where place like?    ");
			else if(search.equals("강북"))
				sql.append("   where place like?    ");
		}
		
		int count = 0;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.toString());
			
			if(!search.equals(""))
			{
				pstmt.setString(1, search);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				count = rs.getInt(1);
			}
		}finally {
		if(rs!=null)try {rs.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
		return count;
	}
	public Hm_ExpertDTO getSelect(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("   select                                               ");
		sql.append("                             no                         ");
		sql.append("                             ,name                      ");
		sql.append("                             ,text                      ");
		sql.append("                             ,place                     ");
		sql.append("                             ,lat                       ");
		sql.append("                             ,lon                       ");
		sql.append("                             ,addr                      ");
		sql.append("                             ,file_name                 ");
		sql.append("   from  expert                                         ");
		sql.append("   where  no = ?                                        ");
		ResultSet rs =null;
		Hm_ExpertDTO dto = new Hm_ExpertDTO();
		try {
		pstmt = conn.prepareStatement(sql.toString());	
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getNString("name"));
			dto.setText(rs.getString("text"));
			dto.setPlace(rs.getString("place"));
			dto.setFlat(Float.parseFloat(rs.getString("lat")));
			dto.setFlon(Float.parseFloat(rs.getString("lon")));
			dto.setAddr(rs.getString("addr"));
			dto.setFile_name(rs.getString("file_name"));

		}
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(rs!=null)try {rs.close();}catch(SQLException e) {}
		}
		return dto;
	}
	
	
	public void dataUpdate(Connection conn, Hm_ExpertDTO dto)throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("    update    expert                     ");
		sql.append("           set     no = ?                ");
		sql.append("                   ,name=?                ");
		sql.append("                   ,text=?               ");
		sql.append("                   ,place=?              ");
		sql.append("                   ,lat=?                ");
		sql.append("                   ,lon=?                ");
		sql.append("                   ,addr=?               ");
		sql.append("                   ,file_name=?          ");
		sql.append("    where  no =?                         ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,dto.getNo());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getText());
			pstmt.setString(4, dto.getPlace());
			pstmt.setString(5, dto.getLat());
			pstmt.setString(6, dto.getLon());
			pstmt.setString(7, dto.getAddr());
			pstmt.setString(8, dto.getFile_name());
			pstmt.setInt(9, dto.getNo());
			
			pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
		
	}
	public void dataDelete(Connection conn, int no) throws SQLException{
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("    delete     from   expert     ");
		sql.append("     where   no = ?              ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			 pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		}
		
	}
	
	
	
}
