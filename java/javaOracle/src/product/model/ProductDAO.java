package product.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DB;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<ProductDTO> getSelectAll() {//[dto, dto, dto...]
		ArrayList<ProductDTO> list = new ArrayList<>(); //큰 가방, 크기 제한 없음
		try {
			conn = DB.dbConn();
			//------------------------------------------
			String sql = "select * from product order by productCode desc";//내림차순 신상품순
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int productCode = rs.getInt("productCode");
				String productName = rs.getString("productName");
				int productPrice = rs.getInt("productPrice");
				String vendor = rs.getString("vendor");
				Date regiDate = rs.getDate("regiDate");
				
				ProductDTO dto = new ProductDTO(); //작은 가방, 반복해서 새로 만들어서 dto에 저장, 1개 레이블 new
				dto.setProductCode(productCode);
				dto.setProductName(productName);
				dto.setProductPrice(productPrice);
				dto.setVendor(vendor);
				dto.setRegiDate(regiDate);
				
				list.add(dto);//작은 가방을 큰가방에 넣기
				//------------------------------------------
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public ProductDTO getSelectOne(ProductDTO paramDto) {//parameter
		ProductDTO dto = new ProductDTO();
		try {
			conn = DB.dbConn();
			//------------------------------------------
			String sql = "select * from product where productCode = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProductCode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setProductCode(rs.getInt("productCode"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));;
				dto.setProductContent(rs.getString("productContent"));
				dto.setVendor(rs.getString("vendor"));
				dto.setRegiDate(rs.getDate("regiDate"));		
			}
			//------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(ProductDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------			
			String sql = "insert into product values(seq_product.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProductName());
			pstmt.setInt(2, paramDto.getProductPrice());
			pstmt.setString(3, paramDto.getProductContent());
			pstmt.setString(4, paramDto.getVendor());
			result = pstmt.executeUpdate();
			//------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(ProductDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------
			String sql = "update product set productName=?, productPrice=?, productContent=? , vendor=? where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProductName());
			pstmt.setInt(2, paramDto.getProductPrice());
			pstmt.setString(3, paramDto.getProductContent());
			pstmt.setString(4, paramDto.getVendor());
			pstmt.setInt(5, paramDto.getProductCode());
			result = pstmt.executeUpdate();
			//------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(ProductDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------
			String sql = "delete from product where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProductCode());
			result = pstmt.executeUpdate();
			//------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
}

