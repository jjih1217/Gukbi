package bookInfo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookInfo.model.dto.BookInfoDTO;
import config.DB;

public class BookInfoDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BookInfoDTO> getSelectAll() {
		ArrayList<BookInfoDTO> list = new ArrayList<BookInfoDTO>();
		conn = DB.dbConn();
		
		try {
			
			//String sql = "select * from bookInfo order by infoNo desc";
			
			String sql = ""; 
			sql += "select bi.*, ("; 
			sql += "select author from bookAuthor ba where ba.authorNo = bi.authorNo"; 
			sql +=  ") author, ("; 
			sql += "select profile from bookProfile bp where bp.profileNo = bi.profileNo"; 
			sql += ") profile from bookInfo bi order by infoNo desc";
			 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookInfoDTO dto = new BookInfoDTO();
				dto.setInfoNo(rs.getInt("infoNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setCreated(rs.getDate("created"));
				dto.setAuthorNo(rs.getInt("authorNo"));
				dto.setProfileNo(rs.getInt("profileNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				dto.setAuthor(rs.getString("author"));
				dto.setProfile(rs.getString("profile"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		System.out.println("list:"  + list);
		
		return list;
	}
	
	public BookInfoDTO getSelectOne(BookInfoDTO paramDto) {
		
		BookInfoDTO dto = new BookInfoDTO();
		conn = DB.dbConn();
		
		try {
			String sql="select * from bookInfo where infoNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getInfoNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setInfoNo(rs.getInt("infoNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setCreated(rs.getDate("created"));
				dto.setAuthorNo(rs.getInt("authorNo"));
				dto.setProfileNo(rs.getInt("profileNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int setInsert(BookInfoDTO paramDto) {
		int result = 0;
		
		conn = DB.dbConn();
		
		try {
			String sql="insert into bookInfo values (seq_bookInfo.nextval,?,?,?,?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setDate(2, paramDto.getCreated());
			pstmt.setInt(3, paramDto.getAuthorNo());
			pstmt.setInt(4, paramDto.getProfileNo());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int setUpdate(BookInfoDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();

		try {
			String sql="update bookInfo set subject=?,created=?,authorNo=?,profileNo=? where infoNo=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setDate(2, paramDto.getCreated());
			pstmt.setInt(3, paramDto.getAuthorNo());
			pstmt.setInt(4, paramDto.getProfileNo());
			pstmt.setInt(5, paramDto.getInfoNo());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BookInfoDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		
		try {
			String sql="delete from bookInfo where infoNo = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getInfoNo());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
