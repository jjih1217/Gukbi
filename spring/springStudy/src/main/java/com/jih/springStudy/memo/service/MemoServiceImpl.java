package com.jih.springStudy.memo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jih.springStudy.memo.model.dao.MemoDAO;
import com.jih.springStudy.memo.model.dto.MemoDTO;

@Service
public class MemoServiceImpl implements MemoService{
	
	@Inject
	MemoDAO memoDao;
	
	@Override
	public List<MemoDTO> getSelectAll() {
		return memoDao.getSelectAll();
	}

	@Override
	public MemoDTO getSelectOne(MemoDTO paramDto) {
		return memoDao.getSelectOne(paramDto);
	}

	@Override
	public int setInsert(MemoDTO paramDto) {
		return memoDao.setInsert(paramDto);
	}

	@Override
	public int setUpdate(MemoDTO paramDto) {
		return memoDao.setUpdate(paramDto);
	}

	@Override
	public int setDelete(MemoDTO paramDto) {
		return memoDao.setDelete(paramDto);
	}

}
