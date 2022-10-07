package com.jih.springStudy.guestBook.model.dao;

import java.util.List;

import com.jih.springStudy.guestBook.model.dto.GuestBookDTO;
import com.jih.springStudy.member.model.dto.MemberDTO;

public interface GuestBookDAO {
	public List<GuestBookDTO> getSelectAll();
	public GuestBookDTO getSelectOne(GuestBookDTO paramDto);
	public int setInsert(GuestBookDTO paramDto);
	public int setUpdate(GuestBookDTO paramDto);
	public int setDelete(GuestBookDTO paramDto);
}