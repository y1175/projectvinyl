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

	
	
	
	
}
