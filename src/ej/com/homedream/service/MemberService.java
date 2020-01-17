package ej.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;

import ej.com.homedream.dao.MemberDAO;
import ej.com.homedream.dto.MemberDTO;



public class MemberService {

	private static MemberService service=new MemberService();
	public static MemberService getService() {
		
		return service;
	}//싱글톤
	
	private MemberService() {}
	//////////////////////////////////////////////////////////////
	public int getCount(String search, String txtsearch)
	{//connection만들어서 dao로 넘겨
		
		DBConnection db=DBConnection.getInstance();//dbconnection꺼 받아
		Connection conn=null;
		int count=0;
		try{
			conn=db.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();//싱글톤햇으니까 이렇게
			count=dao.memberCount(conn, search, txtsearch);
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
	}//전체 자료수
	
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
	/*public List<MemberDTO> getselectedList() {
		// TODO Auto-generated method stub
		return null;
	}
	*/
	

}
