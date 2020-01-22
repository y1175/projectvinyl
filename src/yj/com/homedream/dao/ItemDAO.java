package yj.com.homedream.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yj.com.homedream.dto.CategoriDTO;
import yj.com.homedream.dto.ItemDTO;

public class ItemDAO {

	private static ItemDAO dao = new ItemDAO();
	
	private ItemDAO() {}
	
	public static ItemDAO getDAO() {
		return dao;
	}
	
	public List<ItemDTO> getList(Connection conn){
		ArrayList<ItemDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select item_no, name, content, price, stock, ctitle, file_name " 
				+ "from item inner join categori "
				+ "on categori.cat_no = item.cat_no");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setItemNo(rs.getInt("item_no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setFileName(rs.getString("file_name"));
				list.add(dto);
			}
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		close(pstmt);
		close(rs);
		
		return list;
	}	

	public List<CategoriDTO> getCategori(Connection conn) {
		List<CategoriDTO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select cat_no, ctitle from categori order by cat_no ");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();){
			while(rs.next()) {
				CategoriDTO dto = new CategoriDTO();
				dto.setcNo(rs.getInt("cat_no"));
				dto.setCname(rs.getString("ctitle"));
				list.add(dto);
			}
		}catch (Exception e) {
			System.out.println(e);
		}
			
		return list;
	}

	public void insertItem(Connection conn, ItemDTO dto) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into item(name, content, company, price, stock, cat_no, file_name) "
				+ " values(?, ?, ?, ?, ?, ?, ?)");
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getCompany());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setInt(5, dto.getStock());
			pstmt.setInt(6, dto.getCNo());
			pstmt.setString(7, dto.getFileName());
			
			pstmt.executeUpdate();
						
		}catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public ItemDTO detailItem(Connection conn, int itemNo) {
		ItemDTO dto = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select name, content, company, price, stock, file_name "
				+ "	from item "
				+ "	where item_no = ?");
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, itemNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ItemDTO();
				dto.setItemNo(itemNo);
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setCompany(rs.getString("company"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setFileName(rs.getString("file_name"));
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		close(rs);
		
		return dto;
	}
	
	public void updateItem(Connection conn, ItemDTO dto) {
		StringBuilder sql = new StringBuilder();
		sql.append("update item set"
				+ " name = ?, "
				+ " company = ?, "
				+ " content = ?, "
				+ " price = ?, "
				+ " stock = ?,"
				+ " cat_no = ?,"
				+ " sale = ? ");
		if(dto.getFileName() != null) {
			sql.append(", file_name = ? ");
		}
		sql.append(" where item_no = ? ");
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getCompany());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setInt(5, dto.getStock());
			pstmt.setInt(6, dto.getCNo());
			pstmt.setInt(7, dto.getSale());
			if(dto.getFileName() != null) {
				pstmt.setString(8, dto.getFileName());
				pstmt.setInt(9, dto.getItemNo());
			}else {
				pstmt.setInt(8, dto.getItemNo());
			}
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void close(PreparedStatement pstmt) {
		if(pstmt!=null) try { pstmt.close();} catch(SQLException e) {}
	}
	
	public void close(ResultSet rs) {
		if(rs!=null) try { rs.close();} catch(SQLException e) {}
	}

	public void deleteItem(Connection conn, int itemNo) {
		StringBuilder sql = new StringBuilder();
		sql.append(" delete from item "
				+ "	where item_no = ? ");
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString());){
			pstmt.setInt(1, itemNo);
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deleteItems(Connection conn, String[] arr) {
		StringBuilder sql = new StringBuilder();
		sql.append(" delete from item "
				+ "	where item_no in ( ?");
		for(int i=1; i< arr.length; i++) {
			sql.append(", ?");
		}
		
		sql.append(" ) ");
		try(PreparedStatement pstmt = conn.prepareStatement(sql.toString());){
			for(int i=0; i<arr.length; i++) {
				pstmt.setInt(i+1, Integer.parseInt(arr[i]));
			}
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
	}

}







