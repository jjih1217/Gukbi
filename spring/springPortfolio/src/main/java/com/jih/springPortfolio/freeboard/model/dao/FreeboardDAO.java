package com.jih.springPortfolio.freeboard.model.dao;

import java.util.List;

import com.jih.springPortfolio.freeboard.model.dto.FreeboardDTO;


public interface FreeboardDAO {
	public List<FreeboardDTO> getSelectAll(FreeboardDTO paramDto);
	public FreeboardDTO getSelectOne(FreeboardDTO paramDto);
	public int setInsert(FreeboardDTO arguDto);
	public int setUpdate(FreeboardDTO paramDto);
	public int setDelete(FreeboardDTO paramDto);
	
	public int getTotalRecord(FreeboardDTO paramDto);
	public int getMaxNumRefNoNoticeNo(String gubun);
	public int setUpdateRelevel(FreeboardDTO paramDto);
	public int setUpdateHit(FreeboardDTO paramDto);
}