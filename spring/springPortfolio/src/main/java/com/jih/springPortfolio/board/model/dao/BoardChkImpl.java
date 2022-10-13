package com.jih.springPortfolio.board.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springPortfolio.board.model.dto.BoardChkDTO;
import com.jih.springPortfolio.guestBook.model.dto.GuestBookDTO;

@Repository
public class BoardChkImpl implements BoardChkDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardChkDTO> getSelectAll(BoardChkDTO paramDto) {
		return sqlSession.selectList("boardChk.getSelectAll", paramDto);
	}

	@Override
	public BoardChkDTO getSelectOne(BoardChkDTO paramDto) {
		return sqlSession.selectOne("boardChk.getSelectOne", paramDto);
	}
	
	@Override
	public BoardChkDTO getSelectOne(String tbl) {
		return sqlSession.selectOne("boardChk.getSelectTbl", tbl);
	}

	@Override
	public int setInsert(BoardChkDTO paramDto) {
		return sqlSession.insert("boardChk.setInsert", paramDto);
	}

	@Override
	public int setUpdate(BoardChkDTO paramDto) {
		return sqlSession.update("boardChk.setUpdate", paramDto);
	}

	@Override
	public int setDelete(BoardChkDTO paramDto) {
		return sqlSession.delete("boardChk.setDelete", paramDto);
	}

	



}
