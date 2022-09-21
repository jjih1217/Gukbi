package factory.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import _common.DB;
import factory.model.dto.EmployeeDTO;

public class EmployeeDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<EmployeeDTO> getSelectAll() {
		ArrayList<EmployeeDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "";
			sql += "select e.*, b.buseoName buseoName ";
			sql += "from employee e inner join buseo b on e.buseoNo = b.buseoNo ";
			sql += "order by sabun desc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EmployeeDTO dto = new EmployeeDTO();
				dto.setSabun(rs.getInt("sabun"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setHireDate(rs.getDate("hireDate"));
				dto.setEmail(rs.getString("email"));
				dto.setSalary(rs.getInt("salary"));
				//dto.setBuseo(rs.getString("buseo"));
				dto.setBuseoNo(rs.getInt("buseoNo"));
				dto.setBuseoName(rs.getString("buseoName"));
				//dto.setPositionNo(rs.getInt("positionNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public EmployeeDTO getSelectOne(EmployeeDTO paramDTO) {
		EmployeeDTO dto = new EmployeeDTO();
		conn = DB.dbConn();
		try {
			String sql = "";
			sql += "select e.*, b.buseoName buseoName ";
			sql += "from employee e inner join buseo b on e.buseoNo = b.buseoNo ";
			sql += "where sabun = ?";
			sql += "order by sabun desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDTO.getSabun());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSabun(rs.getInt("sabun"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setHireDate(rs.getDate("hireDate"));
				dto.setEmail(rs.getString("email"));
				dto.setSalary(rs.getInt("salary"));
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
	
	public int setInsert(EmployeeDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into employee values (seq_employee.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getPhone());
			pstmt.setDate(3, paramDto.getHireDate());
			pstmt.setString(4, paramDto.getEmail());
			pstmt.setInt(5, paramDto.getSalary());
			pstmt.setInt(6, paramDto.getBuseoNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(EmployeeDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update employee set name=?, Phone=?, hireDate=?, email=?, salary=?, buseoNo=? where sabun=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getPhone());
			pstmt.setDate(3, paramDto.getHireDate());
			pstmt.setString(4, paramDto.getEmail());
			pstmt.setInt(5, paramDto.getSalary());
			pstmt.setInt(6, paramDto.getBuseoNo());
			pstmt.setInt(7, paramDto.getSabun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(EmployeeDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from employee where sabun=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSabun());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
