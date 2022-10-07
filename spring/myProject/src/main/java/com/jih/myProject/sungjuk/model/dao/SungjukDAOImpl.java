package com.jih.myProject.sungjuk.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.myProject.sungjuk.model.dto.SungjukDTO;

@Repository
public class SungjukDAOImpl implements SungjukDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<SungjukDTO> getSelectAll() {
		return sqlSession.selectList("sungjuk.getSelectAll");
	}

	@Override
	public SungjukDTO getSelectOne(SungjukDTO paramDto) {
		return sqlSession.selectOne("sungjuk.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(SungjukDTO paramDto) {
		return sqlSession.insert("sungjuk.setInsert", paramDto);
	}

	@Override
	public int setUpdate(SungjukDTO paramDto) {
		return sqlSession.update("sungjuk.setUpdate", paramDto);
	}

	@Override
	public int setDelete(SungjukDTO paramDto) {
		return sqlSession.delete("sungjuk.setDelete", paramDto);
	}

}
