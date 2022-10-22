package com.jih.springPortfolio.board.model.dao;

import java.util.List;

import com.jih.springPortfolio.board.model.dto.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> getSelectAll(BoardDTO paramDto);
	public BoardDTO getSelectOne(BoardDTO paramDto);
	public int setInsert(BoardDTO arguDto);
	public int setUpdate(BoardDTO paramDto);
	public int setDelete(BoardDTO paramDto);
	
	public int getTotalRecord(BoardDTO paramDto);
	public int getMaxNumRefNoNoticeNo(String gubun);
	public int setUpdateRelevel(BoardDTO paramDto);
	public int setUpdateHit(BoardDTO paramDto);
}