package com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.homedream.dto.BoardDTO;
import com.homedream.dto.ItemDTO;
import com.homedream.dto.MemberDTO;
import com.homedream.dto.OrderListDTO;
import com.homedream.dto.QuestionDTO;

public class  MemberDAO {
	
	private static  MemberDAO dao=new  MemberDAO();
	public static  MemberDAO getDAO() {
		
		return dao;
	}//싱글톤
	private  MemberDAO() {}
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
	public List<MemberDTO> getlist(Connection conn, int startrow, int endrow, String search, String txtsearch
			, int stxtsearch1, int stxtsearch2) throws SQLException {//리스트출력
		
		List<MemberDTO> list=new ArrayList<>();
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
				 MemberDTO dto=new  MemberDTO();
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
	public MemberDTO getLogin(Connection conn,String id, String pwd) throws SQLException{
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		sql.append(" select mem_no,id,pwd ");
		sql.append(" from member  ");
		sql.append(" where id= ? and pwd= ?   ");
		MemberDTO dto=new MemberDTO();
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
	public List<OrderListDTO> orderlist(Connection conn, int id) throws SQLException{
		StringBuilder sql=new StringBuilder();
		List<OrderListDTO> list=new ArrayList<OrderListDTO>();
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
				
				OrderListDTO dto=new OrderListDTO();
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setOrderno(rs.getInt("order_no"));
				dto.setStatus(rs.getInt("status"));
				list.add(dto);
			}
			
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		return list;
	}
	public List<MemberDTO> orderDetailMember(Connection conn, int num) throws SQLException {
		StringBuilder sql=new StringBuilder();
		List<MemberDTO> list=new ArrayList<>();
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
				MemberDTO dto=new MemberDTO();
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
	public List<ItemDTO> orderDetailItem(Connection conn, int num) throws SQLException {
		StringBuilder sql=new StringBuilder();
		sql.append(" select name,price,file_name   ");
		sql.append(" from orderlist inner join item ");
		sql.append(" on orderlist.item_no = item.item_no  ");
		sql.append(" where order_no=? ");
		
		ResultSet rs=null;
		List<ItemDTO> list=new ArrayList<>();
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				ItemDTO dto=new ItemDTO();
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setFileName(rs.getString("file_name"));
				list.add(dto);
			}
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public List<OrderListDTO> orderDetailOrder(Connection conn, int num) throws SQLException {
		StringBuilder sql=new StringBuilder();
		List<OrderListDTO> list=new ArrayList<>();
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
				OrderListDTO dto=new OrderListDTO();
				dto.setOrderno(rs.getInt("order_no"));
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
	public void modifyData(Connection conn, MemberDTO dto) throws SQLException {
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
	public List<MemberDTO> memberInfo(Connection conn, int id) throws SQLException {
	List<MemberDTO> list=new ArrayList<>();
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
			MemberDTO dto=new MemberDTO();
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
	public List<BoardDTO> getlist(Connection conn, int startrow, int endrow, String search, String txtsearch) throws SQLException{
		List<BoardDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
		
		sql.append(" select  member.mem_no, id, bno, btitle, likeno, writedate ");
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
				BoardDTO dto = new BoardDTO();
				dto.setMem_no(rs.getInt("mem_no"));
				dto.setId(rs.getString("id"));
				dto.setBtitle(rs.getString("btitle"));
				dto.setLikeNo(rs.getInt("likeno"));
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
	public List<QuestionDTO> getQlist(Connection conn, int startrow, int endrow, String search, String txtsearch)
	throws SQLException{
		List<QuestionDTO> list=new ArrayList<>();
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
				QuestionDTO dto=new QuestionDTO();
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
	public List<MemberDTO> memberlist(Connection conn, int id) throws SQLException {
		StringBuilder sql=new StringBuilder();
		List<MemberDTO> list=new ArrayList<>();
		ResultSet rs=null;
		sql.append(" select *  ");
		sql.append(" from member  ");
		sql.append(" where mem_no=?  ");
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				MemberDTO dto=new MemberDTO();
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
