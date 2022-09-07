package test220819.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;

public class EmployeesDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	public EmployeesDTO getSelectOne(EmployeesDTO paramDto) {
		EmployeesDTO dto = new EmployeesDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from employees where first_name=? and last_name=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getFirst_name());
			pstmt.setString(2, paramDto.getLast_name());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setEmployee_id(rs.getInt("employee_id"));
				dto.setFirst_name(rs.getString("first_name"));
				dto.setLast_name(rs.getString("last_name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setHire_date(rs.getDate("hire_date"));
				dto.setJob_id(rs.getString("job_id"));
				dto.setSalary(rs.getInt("salary"));
				dto.setCommission_pct(rs.getInt("commission_pct"));
				dto.setMamager_id(rs.getInt("mamager_id"));
				dto.setDepartment_id(rs.getInt("department_id"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
}


