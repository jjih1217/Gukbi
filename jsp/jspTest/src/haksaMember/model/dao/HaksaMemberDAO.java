package haksaMember.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaMember.model.dto.HaksaMemberDTO;

public class HaksaMemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HaksaMemberDTO> getSelectAll() {
		ArrayList<HaksaMemberDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaMember order by hakbun desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaMemberDTO dto = new HaksaMemberDTO();
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setParentPhone(rs.getString("parentPhone"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				dto.setAddr4(rs.getString("addr4"));
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
	
	public HaksaMemberDTO getSelectOne(HaksaMemberDTO paramDto) {
		HaksaMemberDTO dto = new HaksaMemberDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaMember where hakbun=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getHakbun());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setParentPhone(rs.getString("parentPhone"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				dto.setAddr4(rs.getString("addr4"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(HaksaMemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into haksaMember values(seq_haksaMember.nextval, ?, ?, ?, ?, ?, ?, ? ,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getPhone());
			pstmt.setString(3, paramDto.getParentPhone());
			pstmt.setString(4, paramDto.getAddr1());
			pstmt.setString(5, paramDto.getAddr2());
			pstmt.setString(6, paramDto.getAddr3());
			pstmt.setString(7, paramDto.getAddr4());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(HaksaMemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update haksaMember set phone=?, parentPhone=?, addr1=?, addr2=?, addr3=?, addr4=? where hakbun = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getPhone());
			pstmt.setString(2, paramDto.getParentPhone());
			pstmt.setString(3, paramDto.getAddr1());
			pstmt.setString(4, paramDto.getAddr2());
			pstmt.setString(5, paramDto.getAddr3());
			pstmt.setString(6, paramDto.getAddr4());
			pstmt.setInt(7, paramDto.getHakbun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
		
	}
	
	public int setDelete(HaksaMemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from haksaMember where hakbun = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getHakbun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	
}
