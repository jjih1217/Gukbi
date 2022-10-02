package com.jih.springStudy.member.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springStudy.member.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> getSelectAll() {
		return sqlSession.selectList("member.getSelectAll");
	}

	@Override
	public MemberDTO getSelectOne(MemberDTO paramDto) {
		return sqlSession.selectOne("member.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(MemberDTO paramDto) {
		return sqlSession.insert("member.setInsert", paramDto);
	}

	@Override
	public int setUpdate(MemberDTO paramDto) {
		return sqlSession.update("member.setUpdate", paramDto);
	}

	@Override
	public int setDelete(MemberDTO paramDto) {
		return sqlSession.delete("member.setDelete", paramDto);
	}
	
}
