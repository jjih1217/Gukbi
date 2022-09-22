package factory.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import _common.DB;
import factory.model.dto.JepumDTO;

public class JepumDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<JepumDTO> getSelectAll() {
		ArrayList<JepumDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from jepum order by code desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JepumDTO dto = new JepumDTO();
				dto.setCode(rs.getInt("code"));
				dto.setName(rs.getString("name"));
				dto.setStandard(rs.getString("standard"));
				dto.setUnit(rs.getString("unit"));
				dto.setBarcode(rs.getString("barcode"));
				dto.setUnit(rs.getString("unit"));
				dto.setWdate(rs.getDate("wdate"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public JepumDTO getSelectOne(JepumDTO paramDTO) {
		JepumDTO dto = new JepumDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from buseo where buseoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDTO.getBuseoNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setBuseoNo(rs.getInt("buseoNo"));
				dto.setBuseoName(rs.getString("buseoName"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int setInsert(JepumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into buseo values (seq_buseo.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getBuseoName());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(JepumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update buseo set buseoName=? where buseoNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getBuseoName());
			pstmt.setInt(2, paramDto.getBuseoNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(JepumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from buseo where buseoNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getBuseoNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
