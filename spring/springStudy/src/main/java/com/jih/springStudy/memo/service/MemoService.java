package com.jih.springStudy.memo.service;

import java.util.List;

import com.jih.springStudy.memo.model.dto.MemoDTO;

public interface MemoService {
	public List<MemoDTO> getSelectAll();
	public MemoDTO getSelectOne(MemoDTO paramDto);
	public int setInsert(MemoDTO paramDto);
	public int setUpdate(MemoDTO paramDto);
	public int setDelete(MemoDTO paramDto);
}
