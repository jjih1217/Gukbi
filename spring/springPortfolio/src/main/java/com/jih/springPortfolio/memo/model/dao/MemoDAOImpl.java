package com.jih.springPortfolio.memo.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springPortfolio.memo.model.dto.MemoDTO;


@Repository
public class MemoDAOImpl implements MemoDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemoDTO> getSelectAll() {
		return sqlSession.selectList("memo.getSelectAll");
	}

	@Override
	public MemoDTO getSelectOne(MemoDTO paramDto) {
		return sqlSession.selectOne("memo.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(MemoDTO paramDto) {
		return sqlSession.insert("memo.setInsert", paramDto);
	}

	@Override
	public int setUpdate(MemoDTO paramDto) {
		return sqlSession.update("memo.setUpdate", paramDto);
	}

	@Override
	public int setDelete(MemoDTO paramDto) {
		return sqlSession.delete("memo.setDelete", paramDto);
	}

}
