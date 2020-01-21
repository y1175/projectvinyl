package yj.com.homedream.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.homedream.comm.DBConnection;

import yj.com.homedream.dao.ItemDAO;
import yj.com.homedream.dto.CategoriDTO;
import yj.com.homedream.dto.ItemDTO;

public class ItemService {
	
	private static ItemService service = new ItemService();
	
	private ItemService() {}
	
	public static ItemService getInstance() {
		return service;
	}

	public List<ItemDTO> getList() {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		List<ItemDTO> list = null;
		
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			
			list = ItemDAO.getDAO().getList(conn);
			conn.commit();
			
		}catch (Exception e) {
			System.out.println(e);
		}finally {
			if(conn!=null) try { conn.close();} catch(SQLException e) {}
		}
		return list;
	}

	public List<CategoriDTO> getCategori() {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		List<CategoriDTO> list = null;
		
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			
			list = ItemDAO.getDAO().getCategori(conn);
			conn.commit();
			
		}catch (Exception e) {
			System.out.println(e);
		}finally {
			if(conn!=null) try { conn.close();} catch(SQLException e) {}
		}
		
		return list;
	}

	public void insertItem(ItemDTO dto) {
		DBConnection db = DBConnection.getInstance();
		Connection conn = null;
		
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			
			ItemDAO.getDAO().insertItem(conn, dto);
			
			conn.commit();
		}catch (Exception e) {
			System.out.println(e);
		}finally {
			if(conn!=null) try { conn.close();} catch(SQLException e) {}
		}
		
	}

	public ItemDTO getDetail(int itemNo) {
		DBConnection db = DBConnection.getInstance();
		ItemDTO dto = null;
		try(Connection conn = db.getConnection();){
			conn.setAutoCommit(false);
			dto = ItemDAO.getDAO().detailItem(conn, itemNo);
			
			conn.commit();
		}catch (Exception e) {
			System.out.println(e);
		}
		return dto;
	}

	public void updateItem(ItemDTO dto) {
		DBConnection db = DBConnection.getInstance();
		try(Connection conn = db.getConnection();){
			conn.setAutoCommit(false);
			
			ItemDAO.getDAO().updateItem(conn, dto);
			
			conn.commit();
		}catch (Exception e) {
			System.out.println(e);
		}
		
	}

	public void deleteItem(int itemNo) {
		DBConnection db = DBConnection.getInstance();
		try(Connection conn = db.getConnection();){
			conn.setAutoCommit(false);
			
			ItemDAO.getDAO().deleteItem(conn, itemNo);
			
			conn.commit();
		}catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deletAll(String[] arr) {
		DBConnection db = DBConnection.getInstance();
		try(Connection conn = db.getConnection();){
			conn.setAutoCommit(false);
			
			ItemDAO.getDAO().deleteItems(conn, arr);
			
			conn.commit();
		}catch (Exception e) {
			System.out.println(e);
		}	
		
	}

}
