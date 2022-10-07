package com.jih.springStudy.member.model.dao;

import java.util.List;

import com.jih.springStudy.member.model.dto.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> getSelectAll();
	public MemberDTO getSelectOne(MemberDTO paramDto);
	public int setInsert(MemberDTO paramDto);
	public int setUpdate(MemberDTO paramDto);
	public int setDelete(MemberDTO paramDto);
	
	public int getLogin(MemberDTO paramDto);
}
