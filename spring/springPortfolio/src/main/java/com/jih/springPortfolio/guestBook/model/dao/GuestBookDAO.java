package com.jih.springPortfolio.guestBook.model.dao;

import java.util.List;

import com.jih.springPortfolio.guestBook.model.dto.GuestBookDTO;

public interface GuestBookDAO {
	public List<GuestBookDTO> getSelectAll(GuestBookDTO paramDto);
	public GuestBookDTO getSelectOne(GuestBookDTO paramDto);
	public int setInsert(GuestBookDTO paramDto);
	public int setUpdate(GuestBookDTO paramDto);
	public int setDelete(GuestBookDTO paramDto);
	
	public int getTotalRecord(GuestBookDTO paramDto);
}