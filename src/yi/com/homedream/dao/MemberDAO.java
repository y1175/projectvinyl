package yi.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yi.com.homedream.dto.ItemDTO;
import yi.com.homedream.dto.MemberDTO;
import yi.com.homedream.dto.OrderlistDTO;

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
		sql.append(" select mem_no,id,pwd ");
		sql.append(" from member  ");
		sql.append(" where id= ? and pwd= ?   ");
		
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				userId=rs.getString("mem_no");
			}

			
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		
		return userId;
	}
	public List<OrderlistDTO> orderlist(Connection conn, String id) throws SQLException{
		StringBuilder sql=new StringBuilder();
		List<OrderlistDTO> list=new ArrayList<OrderlistDTO>();
		ResultSet rs=null;
		sql.append(" select orderdate,order_no,status  ");
		sql.append(" from member inner join orderlist  ");
		sql.append(" on member.mem_no = orderlist.mem_no  ");
		sql.append(" where orderlist.mem_no= ? ");
		try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, Integer.parseInt(id));
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				OrderlistDTO dto=new OrderlistDTO();
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
		sql.append(" select name,price,img_no,file_name,loc   ");
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
				dto.setImg_no(rs.getInt("img_no"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setLoc(rs.getString("loc"));
				list.add(dto);
			}
		}
		finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public List<OrderlistDTO> orderDetailOrder(Connection conn, int num) throws SQLException {
		StringBuilder sql=new StringBuilder();
		List<OrderlistDTO> list=new ArrayList<>();
		ResultSet rs=null;
		sql.append(" select order_no,status,cost ");
		sql.append(" from orderlist inner join item ");
		sql.append(" on orderlist.item_no = item.item_no  ");
		sql.append(" where order_no=? ");
		
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());)
		{
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				OrderlistDTO dto=new OrderlistDTO();
				dto.setOrder_no(rs.getInt("order_no"));
				dto.setCost(rs.getInt("cost"));
				dto.setStatus(rs.getInt("status"));
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
	public List<MemberDTO> memberInfo(Connection conn, String id) throws SQLException {
	List<MemberDTO> list=new ArrayList<>();
		StringBuilder sql=new StringBuilder();
		ResultSet rs=null;
	sql.append(" select *    ");
	sql.append(" from member  ");
	sql.append("  where mem_no=?  ");
	try (PreparedStatement pstmt=conn.prepareStatement(sql.toString());) {
		pstmt.setInt(1, Integer.parseInt(id));
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
	
	
	
}
