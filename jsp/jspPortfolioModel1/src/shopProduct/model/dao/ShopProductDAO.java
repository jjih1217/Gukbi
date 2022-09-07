package shopProduct.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import shopProduct.model.dto.ShopProductDTO;

public class ShopProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<ShopProductDTO> getSelectAll() {
		ArrayList<ShopProductDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "";//"select * from product order by productCode dese";
			sql += "select p.*, ( "; 
			sql += "select vendorName from vendor v where v.vendorCode = p.vendorCode"; 
			sql += ") vendorName ";
			sql += "from product p order by productCode desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ShopProductDTO dto = new ShopProductDTO();
				dto.setProductCode(rs.getInt("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setVendorCode(rs.getInt("vendorCode"));
				dto.setAttachInfo(rs.getString("AttachInfo"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setVendorName(rs.getString("vendorName"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public ShopProductDTO getSelectOne(ShopProductDTO paramDto) {
		ShopProductDTO dto = new ShopProductDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from product where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProductCode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setProductCode(rs.getInt("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setVendorCode(rs.getInt("vendorCode"));
				dto.setAttachInfo(rs.getString("AttachInfo"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(ShopProductDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into product (productCode, productName, productPrice, vendorCode, attachInfo, regiDate ) values (seq_product.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProductName());
			pstmt.setInt(2, paramDto.getProductPrice());
			pstmt.setInt(3, paramDto.getVendorCode());
			pstmt.setString(4, paramDto.getAttachInfo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(ShopProductDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update product set productName=?, productPrice=?, vendorCode=?, attachInfo=? where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProductName());
			pstmt.setInt(2, paramDto.getProductPrice());
			pstmt.setInt(3, paramDto.getVendorCode());
			pstmt.setString(4, paramDto.getAttachInfo());
			pstmt.setInt(5, paramDto.getProductCode());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(ShopProductDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from product where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProductCode());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
