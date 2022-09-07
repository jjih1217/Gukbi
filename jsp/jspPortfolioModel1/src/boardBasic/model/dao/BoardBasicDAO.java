package boardBasic.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import boardBasic.model.dto.BoardBasicDTO;
import config.DB;

public class BoardBasicDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<BoardBasicDTO> getSelectAll() {
		ArrayList<BoardBasicDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select no, writer, subject, regiDate, hit , refNo, stepNo, levelNo, memberNo, ip, parentNo from boardBasic order by refNo desc, levelNo asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBasicDTO dto = new BoardBasicDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setHit(rs.getInt("hit"));
				
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setIp(rs.getString("ip"));
				dto.setParentNo(rs.getInt("parentNo"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public BoardBasicDTO getSelectOne (BoardBasicDTO paramDto) {
		BoardBasicDTO dto = new BoardBasicDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from boardBasic where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setIp(rs.getString("ip"));
				dto.setParentNo(rs.getInt("parentNo"));
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	// num = getMaxNum () + 1
	public int getMaxNum () {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "select nvl(max(num), 0) maxValue from boardBasic";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("maxValue");
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	//refNo 최댓값
	public int getMaxRefNo () {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "select nvl(max(refNo), 0) maxValue from boardBasic";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("maxValue");
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	
	// view 조회시 hit 추가
	public void setUpdateHit (BoardBasicDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update boardBasic set hit=(hit+1) where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
	}
	
	// level
	public void setUpdateRelevel (BoardBasicDTO paramDto) {
		conn = DB.dbConn();
		try {
		    //levelNo : 부모글의 refNo가 같은 것 중에서
			//부모글의 levelNo 보다 큰 값들은 1씩 증가시킨다.
			//그리고 levelNo + 1을 한다.
			String sql = "update boardBasic set levelNo = (levelNo + 1) where refNo=? and levelNo > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getRefNo());
			pstmt.setInt(2, paramDto.getLevelNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
	}
	
	public int setDeleteChild (BoardBasicDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete boardBasic where refNo=(refno) and stepNo > 0";
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
	
	public int setInsert (BoardBasicDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into boardBasic values (seq_boardBasic.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNum());
			pstmt.setString(2, paramDto.getWriter());
			pstmt.setString(3, paramDto.getSubject());
			pstmt.setString(4, paramDto.getContent());
			pstmt.setString(5, paramDto.getEmail());
			pstmt.setString(6, paramDto.getPasswd());
			pstmt.setInt(7, paramDto.getRefNo());
			pstmt.setInt(8, paramDto.getStepNo());
			pstmt.setInt(9, paramDto.getLevelNo());
			pstmt.setInt(10, paramDto.getHit());
			pstmt.setInt(11, paramDto.getMemberNo());
			pstmt.setString(12, paramDto.getIp());
			pstmt.setInt(13, paramDto.getParentNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate (BoardBasicDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update boardBasic set writer=?, subject=?, content=?, email=? where no=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getWriter());
			pstmt.setString(2, paramDto.getSubject());
			pstmt.setString(3, paramDto.getContent());
			pstmt.setString(4, paramDto.getEmail());
			pstmt.setInt(5, paramDto.getNo());
			pstmt.setString(6, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete (BoardBasicDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete boardBasic where no=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			pstmt.setString(2, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
