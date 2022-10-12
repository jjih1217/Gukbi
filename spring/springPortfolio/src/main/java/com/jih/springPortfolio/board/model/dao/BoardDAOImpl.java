package com.jih.springPortfolio.board.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springPortfolio.board.model.dto.BoardDTO;


@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> getSelectAll(BoardDTO paramDto) {
		return sqlSession.selectList("board.getSelectAll", paramDto);
	}

	@Override
	public BoardDTO getSelectOne(BoardDTO paramDto) {
		return sqlSession.selectOne("board.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(BoardDTO paramDto) {
		return sqlSession.insert("board.setInsert", paramDto);
	}

	@Override
	public int setUpdate(BoardDTO paramDto) {
		return sqlSession.update("board.setUpdate", paramDto);
	}

	@Override
	public int setDelete(BoardDTO paramDto) {
		return sqlSession.delete("board.setDelete", paramDto);
	}
	
	@Override
	public int getTotalRecord(BoardDTO paramDto) {
		return sqlSession.selectOne("board.getTotalRecord", paramDto);
	}

	@Override
	public int getMaxNumRefNo(String gubun) {
		return sqlSession.selectOne("board.getMaxNumRefNo", gubun);
	}

	@Override
	public int setUpdateRelevel(BoardDTO paramDto) {
		return sqlSession.update("board.setUpdateRelevel", paramDto);
		
	}
}
