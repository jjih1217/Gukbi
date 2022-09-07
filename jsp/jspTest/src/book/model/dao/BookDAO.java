//jspTest/src/book/model/dao/BookDAO.java
package book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import book.model.dto.BookDTO;
import config.DB;

public class BookDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BookDTO> getSelectAll() {
		ArrayList<BookDTO> list = new ArrayList<>();
		Connection conn = DB.dbConn();
		try {
			String sql = "select * from book order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setSubject(rs.getString("subject"));
				dto.setAuthor(rs.getString("author"));
				dto.setCreated(rs.getDate("created"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegiDate(rs.getDate("regiDate"));
				list.add(dto);
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public BookDTO getSelectOne(BookDTO paramDto) {
		BookDTO dto = new BookDTO();
		Connection conn = DB.dbConn();
		try {
			String sql = "select * from book where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setSubject(rs.getString("subject"));
				dto.setAuthor(rs.getString("author"));
				dto.setCreated(rs.getDate("created"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(BookDTO paramDto) {
		int result = 0;
		Connection conn = DB.dbConn();
		try {
			String sql = "insert into book values (seq_book.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setString(2, paramDto.getAuthor());
			pstmt.setDate(3, paramDto.getCreated());
			pstmt.setString(4, paramDto.getProfile());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BookDTO paramDto) {
		int result = 0;
		Connection conn = DB.dbConn();
		try {
			String sql = "update book set subject=?, author=?, created=?, profile=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setString(2, paramDto.getAuthor());
			pstmt.setDate(3, paramDto.getCreated());
			pstmt.setString(4, paramDto.getProfile());
			pstmt.setInt(5, paramDto.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BookDTO paramDto) {
		int result = 0;
		Connection conn = DB.dbConn();
		try {
			String sql = "delete from book where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
