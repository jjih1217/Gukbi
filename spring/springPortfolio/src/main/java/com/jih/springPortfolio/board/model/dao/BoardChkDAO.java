package com.jih.springPortfolio.board.model.dao;

import java.util.List;

import com.jih.springPortfolio.board.model.dto.BoardChkDTO;
import com.jih.springPortfolio.guestBook.model.dto.GuestBookDTO;

public interface BoardChkDAO {
	public List<BoardChkDTO> getSelectAll(BoardChkDTO paramDto);
	public BoardChkDTO getSelectOne(BoardChkDTO paramDto);
	public BoardChkDTO getSelectOne(String tbl);
	public int setInsert(BoardChkDTO paramDto);
	public int setUpdate(BoardChkDTO paramDto);
	public int setDelete(BoardChkDTO paramDto);
}