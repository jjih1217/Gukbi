package member.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DB;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemberDTO> getSelectAll(){
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			conn = DB.dbConn();
			//-------------------------------------
			String sql ="select memberNo, memberId, memberName, memberJumin, memberPhone, memberEmail, memberAddress, regiDate from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setMemberJumin(rs.getString("memberJumin"));
				dto.setMemberPhone(rs.getString("memberPhone"));
				dto.setMemberEmail(rs.getString("memberEmail"));
				dto.setMemberAddress(rs.getString("memberAddress"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(dto);
			}
			//-------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public MemberDTO getSelectOne(MemberDTO paramDto) {
		MemberDTO dto = new MemberDTO();
		try {
			conn = DB.dbConn();
			//---------------------------------------
			String sql ="select * from member where memberNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getMemberNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setMemberJumin(rs.getString("memberJumin"));
				dto.setMemberPhone(rs.getString("memberPhone"));
				dto.setMemberEmail(rs.getString("memberEmail"));
				dto.setMemberAddress(rs.getString("memberAddress"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
			//-------------------------------------------
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	
	public int setInsert(MemberDTO dto) {
		//DB db = new DB();
		int result = 0;
		try {
			conn = DB.dbConn();
			//---------------------------------------
			String sql = "insert into member values (seq_member.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberId());
			pstmt.setString(2, dto.getMemberPasswd());
			pstmt.setString(3, dto.getMemberName());
			pstmt.setString(4, dto.getMemberJumin());
			pstmt.setString(5, dto.getMemberPhone());
			pstmt.setString(6, dto.getMemberEmail());
			pstmt.setString(7, dto.getMemberAddress());
			//pstmt.executeUpdate(); 
			//insert update delete 
			//수행결과로 Int 타입의 값을 반환
			result = pstmt.executeUpdate(); //경우의 수 0,1
			//---------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
			//try문에서 거짓이면 catch
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		//db.dbConnClose(rs, pstmt, conn);
		return result;
		
	}
	
	public int setUpdate(MemberDTO dto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//---------------------------------------
			String sql = "update member set memberPhone=?, memberEmail=?, memberAddress=? where memberNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberPhone());
			pstmt.setString(2, dto.getMemberEmail());
			pstmt.setString(3, dto.getMemberAddress());
			pstmt.setInt(4, dto.getMemberNo());
			result = pstmt.executeUpdate(); //n개를 수정했다 -->memberNo는 unique이기때문에 한번만 실행됨
			//---------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(MemberDTO dto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//---------------------------------------
			String sql = "delete from member where memberNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dto.getMemberNo());
			result = pstmt.executeUpdate();
			//---------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	
	
}
