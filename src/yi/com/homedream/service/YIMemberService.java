package yi.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;

import yi.com.homedream.dao.YIMemberDAO;
import yi.com.homedream.dto.YIItemDTO;
import yi.com.homedream.dto.YIMemberDTO;
import yi.com.homedream.dto.YIOrderlistDTO;
import yi.com.homedream.dto.YIQuestionDTO;

public class YIMemberService {

	private YIMemberService() {}
	private static YIMemberService service=new YIMemberService();
	public static YIMemberService getService()
	{
		return service;
	}
	public void join(YIMemberDTO dto) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
	public YIMemberDTO getLogin(String id, String pwd) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		YIMemberDTO dto=null;
		
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
			dto=dao.getLogin(conn,id,pwd);
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

		return dto;
	}
	public List<YIOrderlistDTO> orderlist(int id) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		List<YIOrderlistDTO> list=new ArrayList<YIOrderlistDTO>();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
	public List<YIMemberDTO> orderDetailMember(int num) {
		// TODO Auto-generated method stub
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		List<YIMemberDTO> list=new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
	public List<YIItemDTO> orderDetailItem(int num) {
		List<YIItemDTO> list=new ArrayList<>();
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
	public List<YIOrderlistDTO> orderDetailOrder(int num) {
		List<YIOrderlistDTO> list=new ArrayList<>();
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
	public void modifyData(YIMemberDTO dto) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
	public List<YIMemberDTO> memberInfo(int id) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		List<YIMemberDTO> list=new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
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
			YIMemberDAO dao=YIMemberDAO.getDAO();//싱글톤햇으니까 이렇게
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
	public List<YIMemberDTO> getList(int startrow, int endrow, String search, String txtsearch) {//출력
		Connection conn=null;
		List<YIMemberDTO> list=null;

		try {
			DBConnection db=DBConnection.getInstance();

			conn=db.getConnection();
			conn.setAutoCommit(false);

			YIMemberDAO dao=YIMemberDAO.getDAO();
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

			YIMemberDAO dao=YIMemberDAO.getDAO();
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
	public List<YIQuestionDTO> qnaList(int startrow, int endrow, String search, String txtsearch) {
		Connection conn=null;
		DBConnection db=DBConnection.getInstance();
		List<YIQuestionDTO> list=new ArrayList<>();
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			YIMemberDAO dao=YIMemberDAO.getDAO();
			list=dao.getQlist(conn,startrow,endrow,search, txtsearch);
			conn.commit();
		}catch(NamingException|SQLException e){
			System.out.println(e);
			try {conn.rollback();} catch(SQLException e2) {}
		}finally {
			if(conn!=null)try {conn.close();} catch(SQLException e) {}
		}
		return list;
	}
	public void qnaDelete(int q_no) {
		Connection conn=null;

		try {
			DBConnection db=DBConnection.getInstance();
			conn=db.getConnection();
			conn.setAutoCommit(false);

			YIMemberDAO dao=YIMemberDAO.getDAO();
			dao.qnaDelete(conn,q_no);
			conn.commit();
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}

		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}
	public List<YIMemberDTO> memberlist(int id) {
		Connection conn=null;
		List<YIMemberDTO> list=new ArrayList<>();
		try {
			
			DBConnection db=DBConnection.getInstance();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			YIMemberDAO dao=YIMemberDAO.getDAO();
			list=dao.memberlist(conn,id);
			conn.commit();
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}

		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
		return list;
	}
	public int idCheck(String id) {
		DBConnection db = DBConnection.getInstance();
		int row = 0;
		try(Connection conn = db.getConnection();){
			YIMemberDAO dao = YIMemberDAO.getDAO();
			row = dao.idCheck(conn, id);
		}catch (Exception e) {
			System.out.println(e);
		}
		return row;
	}









}
