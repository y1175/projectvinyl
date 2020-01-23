package jy.com.homedream.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import jy.com.homedream.DTO.JY_JN_BoardDTO;

public class JY_JN_BoardDAO {

	private static JY_JN_BoardDAO dao = new JY_JN_BoardDAO();
	
	private JY_JN_BoardDAO() {}
	
	public static JY_JN_BoardDAO getDAO() {
		return dao;
	}

	public List<JY_JN_BoardDTO> jn_boardList(Connection conn, String search, String searchtxt, int startrow, int endrow, String sorting) throws SQLException {
		
		List<JY_JN_BoardDTO> jn_list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		ResultSet rs = null;
		sql.append("    select      bno                 ");
		sql.append("                ,m.mem_no           ");
		sql.append("                ,btitle             ");
		sql.append("                ,bcontent           ");
		sql.append("                ,m.id               ");
		sql.append("                ,likeno             ");
		sql.append("                ,readno             ");
		sql.append("                ,writedate          ");
		sql.append("                ,file_name          ");
		sql.append("    from        mboard   b          ");
		sql.append("                join member m       ");
		sql.append("    where       b.mem_no = m.mem_no ");
		
		
		if(search.equals("btitle")) {
			sql.append("  and     btitle  like  ?  ");
		} else if(search.equals("bcontent")) {
			sql.append("  and     bcontent   like  ?  ");
		} else if(search.equals("id")) {
			sql.append("  and     m.id    like    ?   ");
		}
		
		if(sorting.equals("new")) {
			sql.append("  order   by   writedate desc ");
		}else if(sorting.equals("readpoint")) {
			sql.append("  order   by   readno    desc ");	
		}else if(sorting.equals("likepoint")) {
			sql.append("  order   by   likeno    desc ");
		}
		
		sql.append("    limit         ?     ,     15   ");
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql.toString());){
			
			if(search.equals("")) {
				pstmt.setInt(1, startrow);
				rs = pstmt.executeQuery();
			} else {
				pstmt.setString(1, "%" + searchtxt + "%");
				pstmt.setInt(2, startrow);
				rs = pstmt.executeQuery();
			}
	
			
			while(rs.next()) {
				JY_JN_BoardDTO dto = new JY_JN_BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setMem_no(rs.getInt("mem_no"));
				dto.setBtitle(rs.getString("btitle"));
				dto.setBcontent(rs.getString("bcontent"));
				dto.setLikeNo(rs.getInt("likeno"));
				dto.setReadNo(rs.getInt("readno"));
				dto.setWritedate(rs.getString("writedate"));
				dto.setId(rs.getString("id"));
				dto.setFile_name(rs.getString("file_name"));
				jn_list.add(dto);
			}
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
		} 
		return jn_list;
	}

	public JY_JN_BoardDTO jn_boardSelect(Connection conn, int bno) throws SQLException, NamingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JY_JN_BoardDTO dto = new JY_JN_BoardDTO();
		StringBuilder sql = new StringBuilder();
		sql.append("    select      bno                 ");
		sql.append("                ,m.mem_no           ");
		sql.append("                ,btitle             ");
		sql.append("                ,bcontent           ");
		sql.append("                ,m.id               ");
		sql.append("                ,likeno             ");
		sql.append("                ,readno             ");
		sql.append("                ,writedate          ");
		sql.append("                ,file_name          ");
		sql.append("    from        mboard   b          ");
		sql.append("                join member m       ");
		sql.append("    on          b.mem_no = m.mem_no ");
		sql.append("    where       bno     =     ?     ");
		try {
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bno);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setBno(rs.getInt("bno"));
				dto.setMem_no(rs.getInt("mem_no"));
				dto.setBtitle(rs.getString("btitle"));
				dto.setBcontent(rs.getString("bcontent"));
				dto.setLikeNo(rs.getInt("likeno"));
				dto.setReadNo(rs.getInt("readno"));
				dto.setWritedate(rs.getString("writedate"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setId(rs.getString("id"));
			}
		}finally{
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
		return dto;
	}
	
	public void jn_boardReadnoupdate(Connection conn, int bno) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("  update      mboard              ");
		sql.append("  set         readno =  readno+1  ");
		sql.append("  where       bno    =       ?    ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
	}
	
	public int jn_boardUpdate(Connection conn, JY_JN_BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		int result = 0;
		
		sql.append("      update       mboard             ");
		sql.append("      set          btitle    =  ?     ");
		sql.append("                   ,bcontent =  ?     ");
		sql.append("                   ,writedate = now() ");
		sql.append("                   ,file_name = ?     ");
		sql.append("      where           bno =     ?     ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getFile_name());
			pstmt.setInt(4, dto.getBno());
			result = pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
		return result;
	}


	public void jn_boardDelete(Connection conn, int bno) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("    delete     from      mboard   ");
		sql.append("    where      bno    =     ?     ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
	}
	
	
public void jn_boardUpload(Connection conn, JY_JN_BoardDTO dto) throws SQLException, NamingException {
		
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append(" insert                               ");
		sql.append("       into   mboard (                ");
		sql.append("                      mem_no          ");
		sql.append("                      ,btitle         ");
		sql.append("                      ,bcontent       ");
		sql.append("                      ,likeno         ");
		sql.append("                      ,readno         ");
		sql.append("                      ,writedate      ");
		sql.append("                      ,file_name)     ");
		sql.append("      values ( 11,? , ?, 0, 0, now(), ?) ");
	
		try {
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getFile_name());
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
	}

public int jn_boardTotalCount(Connection conn, String search, String searchtxt) throws SQLException {
	
	PreparedStatement pstmt = null;
	int totalcount = 0;
	ResultSet rs = null;
	StringBuilder sql = new StringBuilder();
	sql.append("    select      count(*)            ");
	sql.append("    from        mboard   b          ");
	sql.append("                join member m       ");
	sql.append("    where       b.mem_no = m.mem_no ");
	
	if(search.equals("btitle")) {
		sql.append("  and     btitle  like  ?  ");
	} else if(search.equals("bcontent")) {
		sql.append("  and     bcontent   like  ?  ");
	} else if(search.equals("id")) {
		sql.append("  and     m.id    like    ?   ");
	}
	
	try {
		pstmt=conn.prepareStatement(sql.toString());
		 if(!(search.equals(""))) {
				pstmt.setString(1, "%" + searchtxt + "%");
			}
	
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
		totalcount = rs.getInt(1);
		}
		
	} finally {
		if(rs!=null) try {rs.close();} catch(SQLException e) {}
		if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
	}
	return totalcount;
}

	public int jn_boardUpdateLikeno(int num, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		int result = 0;
		sql.append("  update      mboard              ");
		sql.append("  set         likeno =  likeno+1  ");
		sql.append("  where       bno    =       ?    ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
		}
		return result;
	}

	
	
}
