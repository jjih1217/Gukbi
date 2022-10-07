package com.jih.myProject.sungjuk.model.dao;

import java.util.List;

import com.jih.myProject.sungjuk.model.dto.SungjukDTO;


public interface SungjukDAO {
	public List<SungjukDTO> getSelectAll();
	public SungjukDTO getSelectOne(SungjukDTO paramDto);
	public int setInsert(SungjukDTO paramDto);
	public int setUpdate(SungjukDTO paramDto);
	public int setDelete(SungjukDTO paramDto);
}
