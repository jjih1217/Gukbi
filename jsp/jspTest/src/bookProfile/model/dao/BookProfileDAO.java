package bookProfile.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookProfile.model.dto.BookProFileDTO;
import config.DB;

public class BookProfileDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String tableName_2 = "bookProfile";
	
	public ArrayList<BookProFileDTO> getSelectAll() {
		ArrayList<BookProFileDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_2 + " order by profileNo desc";
			pstmt =  conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookProFileDTO dto = new BookProFileDTO();
				dto.setProfileNo(rs.getInt("profileNo"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public BookProFileDTO getSelectOne(BookProFileDTO paramDto) {
		BookProFileDTO dto = new BookProFileDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_2 + " where profileNo = ?";
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProfileNo());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setProfileNo(rs.getInt("profileNo"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(BookProFileDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into " + tableName_2 + " values (seq_bookProfile.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProfile());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BookProFileDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update " + tableName_2 + " set profile = ? where profileNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getProfile());
			pstmt.setInt(2, paramDto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BookProFileDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from " + tableName_2 + " where profileNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
}
