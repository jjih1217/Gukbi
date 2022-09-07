package haksaSihum.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaSihum.model.dto.HaksaSihumDTO;

public class HaksaSihumDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HaksaSihumDTO> getSelectAll() {
		ArrayList<HaksaSihumDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaSihum order by sihumNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaSihumDTO dto = new HaksaSihumDTO();
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setSihumName(rs.getString("sihumName"));
				dto.setSihumDate(rs.getDate("sihumDate"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public HaksaSihumDTO getSelectOne(HaksaSihumDTO paramDto) {
		HaksaSihumDTO dto = new HaksaSihumDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaSihum where sihumNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSihumNo());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setSihumName(rs.getString("sihumName"));
				dto.setSihumDate(rs.getDate("sihumDate"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(HaksaSihumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into haksaSihum values(seq_haksaSihum.nextval, ?, ? ,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSihumName());
			pstmt.setDate(2, paramDto.getSihumDate());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(HaksaSihumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update haksaSihum set sihumName=?, sihumDate=? where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSihumName());
			pstmt.setDate(2, paramDto.getSihumDate());
			pstmt.setInt(3, paramDto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
		
	}
	
	public int setDelete(HaksaSihumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from haksaSihum where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			 e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
