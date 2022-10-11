package com.jih.springPortfolio.memo.model.dao;

import java.util.List;

import com.jih.springPortfolio.memo.model.dto.MemoDTO;


public interface MemoDAO {
	public List<MemoDTO> getSelectAll(MemoDTO paramDto);
	public MemoDTO getSelectOne(MemoDTO paramDto);
	public int setInsert(MemoDTO paramDto);
	public int setUpdate(MemoDTO paramDto);
	public int setDelete(MemoDTO paramDto);
	public int getTotalRecord(MemoDTO paramDto);
}
