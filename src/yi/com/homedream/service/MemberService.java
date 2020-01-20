package yi.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;

import yi.com.homedream.dao.MemberDAO;
import yi.com.homedream.dto.ItemDTO;
import yi.com.homedream.dto.MemberDTO;
import yi.com.homedream.dto.OrderlistDTO;

public class MemberService {

	private MemberService() {}
	private static MemberService service=new MemberService();
	public static MemberService getService()
	{
		return service;
	}
	public void join(MemberDTO dto) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			dao.join(conn,dto);
			
			
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try{conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
	}
	public String getLogin(String id, String pwd) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		String userId=null;
		
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			userId=dao.getLogin(conn,id,pwd);
			conn.commit();
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return userId;
	}
	public List<OrderlistDTO> orderlist(String id) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		List<OrderlistDTO> list=new ArrayList<OrderlistDTO>();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			list=dao.orderlist(conn,id);
			
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return list;
	}
	public List<MemberDTO> orderDetailMember(int num) {
		// TODO Auto-generated method stub
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		List<MemberDTO> list=new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			list=dao.orderDetailMember(conn,num);
			
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public List<ItemDTO> orderDetailItem(int num) {
		List<ItemDTO> list=new ArrayList<>();
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			list=dao.orderDetailItem(conn,num);
			
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public List<OrderlistDTO> orderDetailOrder(int num) {
		List<OrderlistDTO> list=new ArrayList<>();
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			list=dao.orderDetailOrder(conn,num);
			
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public void orderCancel(int num) {
		// TODO Auto-generated method stub
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			dao.orderCancel(conn,num);
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try { conn.close();}catch(SQLException e) {}
		}
		
	}
	public void modifyData(MemberDTO dto) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			dao.modifyData(conn,dto);
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try { conn.close();}catch(SQLException e) {}
		}
		
		
	}
	public List<MemberDTO> memberInfo(String id) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		List<MemberDTO> list=new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
			list=dao.memberInfo(conn,id);
			conn.commit();
		}
		catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}
		finally
		{
			if(conn!=null)try { conn.close();}catch(SQLException e) {}
		}
		return list;
	}
	public int getCount(String search, String txtsearch) {
		
		DBConnection db=DBConnection.getInstance();//dbconnection꺼 받아
		Connection conn=null;
		int count=0;
		try{
			conn=db.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();//싱글톤햇으니까 이렇게
			count=dao.boardCount(conn, search, txtsearch);
			//System.out.println("count: "+count);
			conn.commit();
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		return count;
	}
	public List<MemberDTO> getList(int startrow, int endrow, String search, String txtsearch) {//출력
			Connection conn=null;
			List<MemberDTO> list=null;
					
			try {
				DBConnection db=DBConnection.getInstance();
				
				conn=db.getConnection();
				conn.setAutoCommit(false);
				
				MemberDAO dao=MemberDAO.getDAO();
				list=dao.getlist(conn,startrow, endrow, search, txtsearch);
				//list를 리턴을 받아줫을때
				
				conn.commit();
				
			}catch(NamingException|SQLException e)
			{
				System.out.println(e);
				try {conn.rollback();}catch(Exception e2) {}
			}finally {
				if(conn!=null)try {conn.close();}catch(SQLException e) {}
			}return list;
			
	
	}
	public void boardDelete(int bno) {
		Connection conn=null;
		
		try {
			DBConnection db=DBConnection.getInstance();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			MemberDAO dao=MemberDAO.getDAO();
			dao.boardDelete(conn,bno);
			conn.commit();
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
			
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
	}

	
	
	
	
}
