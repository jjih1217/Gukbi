package com.jih.springPortfolio.freeboard.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springPortfolio.freeboard.model.dto.FreeboardDTO;



@Repository
public class FreeboardDAOImpl implements FreeboardDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<FreeboardDTO> getSelectAll(FreeboardDTO paramDto) {
		return sqlSession.selectList("freeboard.getSelectAll", paramDto);
	}

	@Override
	public FreeboardDTO getSelectOne(FreeboardDTO paramDto) {
		return sqlSession.selectOne("freeboard.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(FreeboardDTO paramDto) {
		return sqlSession.insert("freeboard.setInsert", paramDto);
	}

	@Override
	public int setUpdate(FreeboardDTO paramDto) {
		return sqlSession.update("freeboard.setUpdate", paramDto);
	}

	@Override
	public int setDelete(FreeboardDTO paramDto) {
		return sqlSession.delete("freeboard.setDelete", paramDto);
	}
	
	@Override
	public int getTotalRecord(FreeboardDTO paramDto) {
		return sqlSession.selectOne("freeboard.getTotalRecord", paramDto);
	}

	@Override
	public int getMaxNumRefNoNoticeNo(String gubun) {
		return sqlSession.selectOne("freeboard.getMaxNumRefNoNoticeNo", gubun);
	}

	@Override
	public int setUpdateRelevel(FreeboardDTO paramDto) {
		return sqlSession.update("freeboard.setUpdateRelevel", paramDto);
		
	}

	@Override
	public int setUpdateHit(FreeboardDTO paramDto) {
		return sqlSession.update("freeboard.setUpdateHit", paramDto);
	}
}
