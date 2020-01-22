package com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.homedream.comm.DBConnection;
import com.homedream.dao.MemberDAO;
import com.homedream.dto.BoardDTO;
import com.homedream.dto.ItemDTO;
import com.homedream.dto.MemberDTO;
import com.homedream.dto.OrderListDTO;
import com.homedream.dto.QuestionDTO;

public class MemberService {

	private static MemberService service=new MemberService();
	public static MemberService getService() {
		
		return service;
	}//싱글톤
	
	private MemberService() {}
	//////////////////////////////////////////////////////////////
	public int getCount(String search, String txtsearch, int txtsearch1, int txtsearch2)
	{//connection만들어서 dao로 넘겨
		
		DBConnection db=DBConnection.getInstance();//dbconnection꺼 받아
		Connection conn=null;
		int count=0;
		try{
			conn=db.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();//싱글톤햇으니까 이렇게
			count=dao.memberCount(conn, search, txtsearch, txtsearch1, txtsearch2);
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
	
	public List<MemberDTO> getList(int startrow, int endrow, String search, String txtsearch
			, int stxtsearch1, int stxtsearch2) {//출력
		Connection conn=null;
		List<MemberDTO> list=null;
				
		try {
			DBConnection db=DBConnection.getInstance();
			
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			MemberDAO dao=MemberDAO.getDAO();
			list=dao.getlist(conn,startrow, endrow, search, txtsearch, stxtsearch1, stxtsearch2);
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


	public void delete(int memno) {
		Connection conn=null;
	
				
		try {
			DBConnection db=DBConnection.getInstance();
			
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			 MemberDAO dao= MemberDAO.getDAO();
			dao.delete2(conn,memno);
			dao.delete(conn,memno);
			//list를 리턴을 받아줫을때
			
			conn.commit();
			
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
	}
	
	public void insert(int memno, int addpoint) {
		Connection conn=null;
	
				
		try {
			DBConnection db=DBConnection.getInstance();
			
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			MemberDAO dao=MemberDAO.getDAO();
			dao.insert(conn, memno, addpoint);
			//list를 리턴을 받아줫을때
			
			conn.commit();
			
		}catch(NamingException|SQLException e)
		{
			System.out.println(e);
			try {conn.rollback();}catch(Exception e2) {}
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
		
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
	public MemberDTO getLogin(String id, String pwd) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		MemberDTO dto=null;
		
		try {
			conn=dbconn.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
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
	public List<OrderListDTO> orderlist(int id) {
		Connection conn=null;
		DBConnection dbconn=DBConnection.getInstance();
		List<OrderListDTO> list=new ArrayList<OrderListDTO>();
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
	public List<OrderListDTO> orderDetailOrder(int num) {
		List<OrderListDTO> list=new ArrayList<>();
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
	public List<MemberDTO> memberInfo(int id) {
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
	public List<BoardDTO> getList(int startrow, int endrow, String search, String txtsearch) {//출력
		Connection conn=null;
		List<BoardDTO> list=null;

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
	public List<QuestionDTO> qnaList(int startrow, int endrow, String search, String txtsearch) {
		Connection conn=null;
		DBConnection db=DBConnection.getInstance();
		List<QuestionDTO> list=new ArrayList<>();
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			MemberDAO dao=MemberDAO.getDAO();
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

			MemberDAO dao=MemberDAO.getDAO();
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
	public List<MemberDTO> memberlist(int id) {
		Connection conn=null;
		List<MemberDTO> list=new ArrayList<>();
		try {
			
			DBConnection db=DBConnection.getInstance();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			
			MemberDAO dao=MemberDAO.getDAO();
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
			MemberDAO dao = MemberDAO.getDAO();
			row = dao.idCheck(conn, id);
		}catch (Exception e) {
			System.out.println(e);
		}
		return row;
	}

}
	


