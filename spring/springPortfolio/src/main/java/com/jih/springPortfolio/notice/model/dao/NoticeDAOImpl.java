package com.jih.springPortfolio.notice.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springPortfolio.notice.model.dto.NoticeDTO;



@Repository
public class NoticeDAOImpl implements NoticeDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> getSelectAll(NoticeDTO paramDto) {
		return sqlSession.selectList("notice.getSelectAll", paramDto);
	}

	@Override
	public NoticeDTO getSelectOne(NoticeDTO paramDto) {
		return sqlSession.selectOne("notice.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(NoticeDTO paramDto) {
		return sqlSession.insert("notice.setInsert", paramDto);
	}

	@Override
	public int setUpdate(NoticeDTO paramDto) {
		return sqlSession.update("notice.setUpdate", paramDto);
	}

	@Override
	public int setDelete(NoticeDTO paramDto) {
		return sqlSession.delete("notice.setDelete", paramDto);
	}
	
	@Override
	public int getTotalRecord(NoticeDTO paramDto) {
		return sqlSession.selectOne("notice.getTotalRecord", paramDto);
	}

	@Override
	public int getMaxNumRefNoNoticeNo(String gubun) {
		return sqlSession.selectOne("notice.getMaxNumRefNoNoticeNo", gubun);
	}

	@Override
	public int setUpdateRelevel(NoticeDTO paramDto) {
		return sqlSession.update("notice.setUpdateRelevel", paramDto);
		
	}

	@Override
	public int setUpdateHit(NoticeDTO paramDto) {
		return sqlSession.update("notice.setUpdateHit", paramDto);
	}
}
