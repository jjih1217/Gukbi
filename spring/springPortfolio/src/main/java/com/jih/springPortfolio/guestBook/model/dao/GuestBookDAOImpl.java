package com.jih.springPortfolio.guestBook.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springPortfolio.guestBook.model.dto.GuestBookDTO;
import com.jih.springPortfolio.member.model.dto.MemberDTO;


@Repository
public class GuestBookDAOImpl implements GuestBookDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<GuestBookDTO> getSelectAll(GuestBookDTO paramDto) {
		return sqlSession.selectList("guestBook.getSelectAll", paramDto);
	}

	@Override
	public GuestBookDTO getSelectOne(GuestBookDTO paramDto) {
		return sqlSession.selectOne("guestBook.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(GuestBookDTO paramDto) {
		return sqlSession.insert("guestBook.setInsert", paramDto);
	}

	@Override
	public int setUpdate(GuestBookDTO paramDto) {
		return sqlSession.update("guestBook.setUpdate", paramDto);
	}

	@Override
	public int setDelete(GuestBookDTO paramDto) {
		return sqlSession.delete("guestBook.setDelete", paramDto);
	}
	
	@Override
	public int getTotalRecord(GuestBookDTO paramDto) {
		return sqlSession.selectOne("guestBook.getTotalRecord", paramDto);
	}
}
