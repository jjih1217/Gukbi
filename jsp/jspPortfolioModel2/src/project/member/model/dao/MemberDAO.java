package project.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.common.DB;
import project.member.model.dto.MemberDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemberDTO> getSelectAll(){
		ArrayList<MemberDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setJumin1(rs.getString("jumin1"));
				dto.setJumin2(rs.getString("jumin2"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
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
	
	public MemberDTO getSelectOne(MemberDTO paramDto) {
		MemberDTO dto = new MemberDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from member where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setJumin1(rs.getString("jumin1"));
				dto.setJumin2(rs.getString("jumin2"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setPostcode(rs.getString("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setDetailAddress(rs.getString("detailAddress"));
				dto.setExtraAddress(rs.getString("extraAddress"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(MemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into member values(seq_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getId());	
			pstmt.setString(2, paramDto.getPasswd());	
			pstmt.setString(3, paramDto.getName());	
			pstmt.setString(4, paramDto.getJumin1());	
			pstmt.setString(5, paramDto.getJumin2());	
			pstmt.setString(6, paramDto.getPhone1());	
			pstmt.setString(7, paramDto.getPhone2());	
			pstmt.setString(8, paramDto.getPhone3());	
			pstmt.setString(9, paramDto.getEmail1());	
			pstmt.setString(10, paramDto.getEmail2());	
			pstmt.setString(11, paramDto.getPostcode());	
			pstmt.setString(12, paramDto.getAddress());	
			pstmt.setString(13, paramDto.getDetailAddress());	
			pstmt.setString(14, paramDto.getExtraAddress());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(MemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update member set phone1=?, phone2=?, phone3=?, email1=?, email2=?, postcode=?, address=?, detailAddress=?, extraAddress=? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getPhone1());	
			pstmt.setString(2, paramDto.getPhone2());	
			pstmt.setString(3, paramDto.getPhone3());	
			pstmt.setString(4, paramDto.getEmail1());	
			pstmt.setString(5, paramDto.getEmail2());	
			pstmt.setString(6, paramDto.getPostcode());	
			pstmt.setString(7, paramDto.getAddress());	
			pstmt.setString(8, paramDto.getDetailAddress());	
			pstmt.setString(9, paramDto.getExtraAddress());
			pstmt.setInt(10, paramDto.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(MemberDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from member where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
}
