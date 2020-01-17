package yi.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;

import yi.com.homedream.dao.MemberDAO;
import yi.com.homedream.dto.MemberDTO;

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
	
	
	
	
}
