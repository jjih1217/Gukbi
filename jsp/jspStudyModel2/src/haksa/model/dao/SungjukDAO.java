package haksa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import _common.DB;
import haksa.model.dto.SungjukDTO;

public class SungjukDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<SungjukDTO> getSelectAll() {
		ArrayList<SungjukDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql =""; 
			
			//(ANSI표준 : 테이블 2개씩 JOIN)
			sql += "select sj.*, m.name studentName, s.sihumName sihumName ";
			sql += "from haksaSungjuk sj ";
			sql += "inner join haksaMember m on sj.hakbun = m.hakbun ";
			sql += "inner join haksaSihum s on sj.sihumNo = s.sihumNo ";
			
			//sql표준
			/*
			sql += "select sj.*, m.name studentName, s.sihumName sihumName ";
			sql += "from haksaSungjuk sj, haksaMember m, haksaSihum s ";
			sql += "where sj.hakbun = m.hakbun and sj.sihumNo = s.sihumNo ";
			*/
			
			//서브쿼리
			/*
			sql += "select sj.*, ";
			sql += "(select name from haksaMember m where m.hakbun = sj.hakbun) studentName, "; //where 안쪽테이블 = 바깥쪽 테이블
			sql += "(select sihumName from haksaSihum s where s.sihumNo = sj.sihumNo) sihumName ";
			sql += "from haksaSungjuk sj ";
			sql += "order by s.sungjukNo desc";
			*/
			
			sql += "order by sungjukNo desc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SungjukDTO dto = new SungjukDTO();
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
				dto.setStudentName(rs.getString("studentName"));
				dto.setSihumName(rs.getString("sihumName"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public SungjukDTO getSelectOne(SungjukDTO paramDTO) {
		SungjukDTO dto = new SungjukDTO();
		conn = DB.dbConn();
		try {
			String sql =""; 
			
			//(ANSI표준 : 테이블 2개씩 JOIN)
			sql += "select sj.*, m.name studentName, s.sihumName sihumName ";
			sql += "from haksaSungjuk sj ";
			sql += "inner join haksaMember m on sj.hakbun = m.hakbun ";
			sql += "inner join haksaSihum s on sj.sihumNo = s.sihumNo ";
			
			//sql표준
			/*
			sql += "select sj.*, m.name studentName, s.sihumName sihumName ";
			sql += "from haksaSungjuk sj, haksaMember m, haksaSihum s ";
			sql += "where sj.hakbun = m.hakbun and sj.sihumNo = s.sihumNo ";
			*/
			
			//서브쿼리
			/*
			sql += "select sj.*, ";
			sql += "(select name from haksaMember m where m.hakbun = sj.hakbun) studentName, "; //where 안쪽테이블 = 바깥쪽 테이블
			sql += "(select sihumName from haksaSihum s where s.sihumNo = sj.sihumNo) sihumName ";
			sql += "from haksaSungjuk sj ";
			sql += "order by s.sungjukNo desc";
			*/
			sql += "where sungjukNo = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDTO.getSungjukNo());
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
				
				dto.setStudentName(rs.getString("studentName"));
				dto.setSihumName(rs.getString("sihumName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int setInsert(SungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into haksaSungjuk values (seq_haksaSungjuk.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
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
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(SungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update haksaSungjuk set kor=?, eng=?, mat=?, sci=?, his=?, tot=?, avg=?, grade=?, hakbun=?, sihumNo=? where sungjukNo=?";
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
			pstmt.setInt(11, paramDto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(SungjukDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from haksaSungjuk where sungjukNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSungjukNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
