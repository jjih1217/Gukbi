package com.jih.springPortfolio.notice.model.dao;

import java.util.List;

import com.jih.springPortfolio.notice.model.dto.NoticeDTO;


public interface NoticeDAO {
	public List<NoticeDTO> getSelectAll(NoticeDTO paramDto);
	public NoticeDTO getSelectOne(NoticeDTO paramDto);
	public int setInsert(NoticeDTO arguDto);
	public int setUpdate(NoticeDTO paramDto);
	public int setDelete(NoticeDTO paramDto);
	
	public int getTotalRecord(NoticeDTO paramDto);
	public int getMaxNumRefNoNoticeNo(String gubun);
	public int setUpdateRelevel(NoticeDTO paramDto);
	public int setUpdateHit(NoticeDTO paramDto);
}