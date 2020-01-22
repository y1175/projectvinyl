package yi.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yi.com.homedream.dto.YIItemDTO;
import yi.com.homedream.dto.YIMemberDTO;
import yi.com.homedream.dto.YIOrderlistDTO;
import yi.com.homedream.dto.YIQuestionDTO;

public class YIMemberDAO {

	private YIMemberDAO() {}
	private static YIMemberDAO dao=new YIMemberDAO();
	public static YIMemberDAO getDAO()
	{
		return dao;
	}
	public void join(Connection conn, YIMemberDTO dto) throws SQLException {
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
	public YIMemberDTO getLogin(Connection conn,String id, String pwd) throws SQLException{
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		sql.append(" select mem_no,id,pwd ");
		sql.append(" from member  ");
		sql.append(" where id= ? and pwd= ?   ");
		YIMemberDTO dto=new YIMemberDTO();
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setMemNo(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				
			}

			
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		
		return dto;
	}
	public List<YIOrderlistDTO> orderlist(Connection conn, int id) throws SQLException{
		StringBuilder sql=new StringBuilder();
		List<YIOrderlistDTO> list=new ArrayList<YIOrderlistDTO>();
		ResultSet rs=null;
		sql.append(" select orderdate,order_no,status  ");
		sql.append(" from member inner join orderlist  ");
		sql.append(" on member.mem_no = orderlist.mem_no  ");
		sql.append(" where orderlist.mem_no= ? ");
		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				YIOrderlistDTO dto=new YIOrderlistDTO();
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setStatus(rs.getInt("status"));
				list.add(dto);
			}
			
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}
	public List<YIMemberDTO> orderDetailMember(Connection conn, int num) throws SQLException {
		StringBuilder sql=new StringBuilder();
		List<YIMemberDTO> list=new ArrayList<>();
		sql.append(" select phone,name,addr  ");
		sql.append(" from member inner join orderlist ");
		sql.append(" on member.mem_no=orderlist.mem_no");
		sql.append(" where order_no=? ");
		
		ResultSet rs=null;
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{			
				YIMemberDTO dto=new YIMemberDTO();
				dto.setPhone(rs.getString("phone"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
			}
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public List<YIItemDTO> orderDetailItem(Connection conn, int num) throws SQLException {
		StringBuilder sql=new StringBuilder();
		sql.append(" select name,price,file_name   ");
		sql.append(" from orderlist inner join item ");
		sql.append(" on orderlist.item_no = item.item_no  ");
		sql.append(" where order_no=? ");
		
		ResultSet rs=null;
		List<YIItemDTO> list=new ArrayList<>();
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				YIItemDTO dto=new YIItemDTO();
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setFile_name(rs.getString("file_name"));
				list.add(dto);
			}
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public List<YIOrderlistDTO> orderDetailOrder(Connection conn, int num) throws SQLException {
		StringBuilder sql=new StringBuilder();
		List<YIOrderlistDTO> list=new ArrayList<>();
		ResultSet rs=null;
		sql.append(" select order_no,status,cost,orderdate          ");
		sql.append(" from orderlist inner join item       ");
		sql.append(" on orderlist.item_no = item.item_no  ");
		sql.append(" where order_no=? ");
		
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				YIOrderlistDTO dto=new YIOrderlistDTO();
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setCost(rs.getInt("cost"));
				dto.setStatus(rs.getInt("status"));
				dto.setOrderdate(rs.getString("orderdate"));
				list.add(dto);
			}
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public void orderCancel(Connection conn, int num) throws SQLException{
		StringBuilder sql=new StringBuilder();
		sql.append(" update orderlist  ");
		sql.append(" set status=0   ");
		sql.append(" where order_no=? ");
		
		
		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		
		}
		
	}
	public void modifyData(Connection conn, YIMemberDTO dto) throws SQLException {
		StringBuilder sql=new StringBuilder();
		sql.append(" update member  ");
		sql.append("  set pwd=?   ");
		sql.append("  , name=?   ");
		sql.append("  , birth=?   ");
		sql.append("  , phone=?   ");
		sql.append("  , addr=?   ");
		sql.append("  , zipcode=?   ");
		sql.append(" where mem_no=? ");
		
		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			
			pstmt.setString(1,dto.getPwd() );
			pstmt.setString(2,dto.getName());
			pstmt.setString(3,dto.getBirth());
			pstmt.setString(4,dto.getPhone());
			pstmt.setString(5,dto.getAddr());
			pstmt.setInt(6, dto.getZipcode());
			pstmt.setInt(7, dto.getMemNo());
			pstmt.executeUpdate();
			
		
		}
		
	}
	public List<YIMemberDTO> memberInfo(Connection conn, int id) throws SQLException {
	List<YIMemberDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
	sql.append(" select *    ");
	sql.append(" from member  ");
	sql.append("  where mem_no=?  ");
	try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());) {
		pstmt.setInt(1, id);
		rs=pstmt.executeQuery();
		while(rs.next())
		{
			YIMemberDTO dto=new YIMemberDTO();
			dto.setId(rs.getString("id"));
			dto.setPwd(rs.getString("pwd"));
			dto.setMemNo(rs.getInt("mem_no"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setAddr(rs.getString("addr"));
			dto.setZipcode(rs.getInt("zipcode"));
			dto.setBirth(rs.getString("birth"));
			list.add(dto);
		}
	}
	
	return list;
		
	}
	
	public int boardCount(Connection conn, String search, String txtsearch) throws SQLException {//자료수 리턴
		StringBuilder sql=new StringBuilder();
		int count=0;
		ResultSet rs=null;
		
		sql.append(" select count(*) ");
		sql.append(" from mboard inner join member   ");
		sql.append(" on mboard.mem_no=member.mem_no  ");
		sql.append(" where member.mem_no!=1 ");
		//검색
		if(!search.equals("")&&!txtsearch.equals(""))
		{
			if(search.equals("id"))
				sql.append(" and id like ? ");
			else if(search.equals("name"))
				sql.append(" and name like ? ");
			else if(search.equals("btitle"))
				sql.append(" and btitle like ? ");
		}

		
	
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString())){
			if(!search.equals("")&&!txtsearch.equals(""))
			{
			pstmt.setString(1,"%"+txtsearch+"%");//txtsearch를 포함하는
				
			}//else//검색안할때

			
			
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
	public List<YIMemberDTO> getlist(Connection conn, int startrow, int endrow, String search, String txtsearch) throws SQLException{
		List<YIMemberDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		
		sql.append(" select  member.mem_no, name, id, bno, btitle, likeno,writedate ");
		sql.append(" from member  ");
		sql.append(" left outer join mboard ");
		sql.append(" on member.mem_no=mboard.mem_no ");
		
		
		
		if(!search.equals("")&&!txtsearch.equals(""))//검색을 하면
		{	
			if(search.equals("id"))
				sql.append(" where id like ? ");
			else if(search.equals("name"))
				sql.append(" where name like ? ");
			else if(search.equals("btitle"))
			sql.append(" where btitle like ? ");
		}
		
			sql.append(" group by mem_no,bno   ");
			sql.append(" limit ?,15 ");
			
			//System.out.println("sql2:"+sql);
			
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString())){
		
		if(!search.equals("")&&!txtsearch.equals(""))//검색하면
		{
			pstmt.setString(1, "%"+txtsearch+"%");
			pstmt.setInt(2, startrow);
			
		}
		else{//존재하지않으면 또는 검색안하면
			pstmt.setInt(1, startrow);
		}
		
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				YIMemberDTO dto=new YIMemberDTO();
				dto.setMemNo(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setBtitle(rs.getString("btitle"));
				dto.setLike(rs.getInt("likeno"));
				dto.setWritedate(rs.getString("writedate"));
				dto.setBno(rs.getInt("bno"));
				
				
				
				list.add(dto);
			}
	}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}
	public void boardDelete(Connection conn, int bno) throws SQLException {
		StringBuilder sql=new StringBuilder();
		sql.append(" delete from mboard  ");
		sql.append("  where bno=? ");
		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			
		}
		
	}
	public void boardSelectDelete(Connection conn, int selected)throws SQLException {
		StringBuilder sql=new StringBuilder();
		sql.append(" delete from mboard  ");
		sql.append("  where bno=? ");

		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());){

				pstmt.setInt(1, selected);
				pstmt.executeUpdate();
			
		}
		
	}
	public List<YIQuestionDTO> getQlist(Connection conn, int startrow, int endrow, String search, String txtsearch)
	throws SQLException{
		List<YIQuestionDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		
		sql.append("  select  q_no                        ");
		sql.append("         ,m.name                      "); 
		sql.append("         ,title                       ");
		sql.append("         ,content                     ");
		sql.append("         ,qdate                       ");
		sql.append("         ,m.mem_no                      ");
		sql.append("         ,id                      ");
		sql.append("  from question q inner join member m ");
        sql.append("  on q.mem_no=m.mem_no                ");
		
		
		
		if(!search.equals("")&&!txtsearch.equals(""))//검색을 하면
		{	
			if(search.equals("id"))
				sql.append(" where id like ? ");
			else if(search.equals("name"))
				sql.append(" where name like ? ");
			else if(search.equals("title"))
			sql.append(" where title like ? ");
		}
		
			sql.append(" group by m.mem_no,q_no   ");
			sql.append(" limit ?,15 ");
			
			//System.out.println("sql2:"+sql);
			
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
		
		if(!search.equals("")&&!txtsearch.equals(""))//검색하면
		{
			pstmt.setString(1, "%"+txtsearch+"%");
			pstmt.setInt(2, startrow);
			
		}
		else{//존재하지않으면 또는 검색안하면
			pstmt.setInt(1, startrow);
		}
		
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				YIQuestionDTO dto=new YIQuestionDTO();
				dto.setMem_no(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				dto.setQ_no(rs.getInt("q_no"));
				dto.setTitle(rs.getString("title"));
				dto.setQdate(rs.getString("qdate"));
				dto.setContent(rs.getString("content"));
				dto.setMem_name(rs.getString("name"));
				
				
				list.add(dto);
			}
	}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}
	public void qnaDelete(Connection conn, int q_no) throws SQLException{
		StringBuilder sql=new StringBuilder();
		sql.append(" delete from question ");
		sql.append("  where q_no=? ");

		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());){

				pstmt.setInt(1, q_no);
				pstmt.executeUpdate();
			
		}
		
	}
	public List<YIMemberDTO> memberlist(Connection conn, int id) throws SQLException {
		StringBuilder sql=new StringBuilder();
		List<YIMemberDTO> list=new ArrayList<>();
		ResultSet rs=null;
		sql.append(" select *  ");
		sql.append(" from member  ");
		sql.append(" where mem_no=?  ");
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				YIMemberDTO dto=new YIMemberDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
			}
		}
		return list;
		
	}
	public int idCheck(Connection conn, String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from member "
				+ " where id = ? ");
		ResultSet rs = null;
		int row = 0;
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString());){
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				row = rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return row;
	}
	
	
	
}
