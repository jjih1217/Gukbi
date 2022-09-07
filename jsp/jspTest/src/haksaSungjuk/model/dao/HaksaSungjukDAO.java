package haksaSungjuk.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaSungjuk.model.dto.HaksaSungjukDTO;


public class HaksaSungjukDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HaksaSungjukDTO> getSelectAll() {
		ArrayList<HaksaSungjukDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			//String sql = "select * from haksaSungjuk order by sungjukNo desc";
			String sql = "";
			sql += "select sj.*, (";
			sql += "select name from haksaMember mb where mb.hakbun = sj.hakbun";
			sql += ") name, (";
			sql += "select sihumName from haksaSihum sh where sh.sihumNo = sj.sihumNo";
			sql += ") sihumName from haksasungjuk sj order by sungjukNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaSungjukDTO dto = new HaksaSungjukDTO();
				dto.setSungjukNo(rs.getInt("sungjukNo"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				dto.setGrade(rs.getString("grade"));
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				dto.setName(rs.getString("name"));
				dto.setSihumName(rs.getString("sihumName"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		//System.out.println("list:"  + list);
		return list;
	}
	
	public HaksaSungjukDTO getSelectOne(HaksaSungjukDTO paramDto) {
		HaksaSungjukDTO dto = new HaksaSungjukDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from haksaSungjuk where sungjukNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSungjukNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSungjukNo(rs.getInt("sungjukNo"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				dto.setGrade(rs.getString("grade"));
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(HaksaSungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into haksaSungjuk values(seq_haksaSungjuk.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getKor());
			pstmt.setInt(2, paramDto.getEng());
			pstmt.setInt(3, paramDto.getMat());
			pstmt.setInt(4, paramDto.getSci());
			pstmt.setInt(5, paramDto.getHis());
			pstmt.setInt(6, paramDto.getTot());
			pstmt.setDouble(7, paramDto.getAvg());
			pstmt.setString(8, paramDto.getGrade());
			pstmt.setInt(9, paramDto.getHakbun());
			pstmt.setInt(10, paramDto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(HaksaSungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update haksaSungjuk set kor=?, eng=?, mat=?, sci=?, his=?, tot=?, avg=?, grade=?, sihumNo=? where sungjukNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getKor());
			pstmt.setInt(2, paramDto.getEng());
			pstmt.setInt(3, paramDto.getMat());
			pstmt.setInt(4, paramDto.getSci());
			pstmt.setInt(5, paramDto.getHis());
			pstmt.setInt(6, paramDto.getTot());
			pstmt.setDouble(7, paramDto.getAvg());
			pstmt.setString(8, paramDto.getGrade());
			pstmt.setInt(9, paramDto.getSihumNo());
			pstmt.setInt(10, paramDto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
		
	}
	
	public int setDelete(HaksaSungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from haksaSungjuk where sungjukNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// // e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
