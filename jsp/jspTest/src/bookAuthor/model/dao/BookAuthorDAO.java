//bookAuthor/model/dao/BookAuthorDAO.java
package bookAuthor.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookAuthor.model.dto.BookAuthorDTO;
import config.DB;

public class BookAuthorDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String tableName_1 = "bookAuthor";

	public ArrayList<BookAuthorDTO> getSelectAll() {
		ArrayList<BookAuthorDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_1 + " order by authorNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookAuthorDTO resultDto = new BookAuthorDTO(); // 선언위치
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(resultDto);
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public BookAuthorDTO getSelectOne(BookAuthorDTO paramDTO) {
		BookAuthorDTO resultDto = new BookAuthorDTO(); // 선언위치
		conn = DB.dbConn();
		try {
			String sql = "select * from " + tableName_1 + " where authorNo = ?"; // 넘어오는 값이 있음 > 매개변수
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDTO.getAuthorNo());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return resultDto; // 반환
	}
	
	public int setInsert(BookAuthorDTO paramDto) { // 외부에서 메소드에 값을 넣어주려면 전역변수 또는 매개변수 사용
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into "  + tableName_1 + " values(seq_bookAuthor.nextval, ?, sysdate)"; //sequence는 중복이 안되기때문에 레코드 1개만 저장됨
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getAuthor());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BookAuthorDTO paramDto) { 
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update " + tableName_1 + " set author = ? where authorNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getAuthor());
			pstmt.setInt(2, paramDto.getAuthorNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int setDelete(BookAuthorDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from " + tableName_1 + " where authorNo = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getAuthorNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
}
