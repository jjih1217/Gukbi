package project.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import project._mybatisConfig.MybatisManager;
import project.board.model.dto.BoardDTO;

public class BoardDAO {
String tableName01 = "board";

	public int getTotalRecord(BoardDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("board.getTotalRecord", map); 
		session.close();
		
		return result;
	}
	
	public List<BoardDTO> getSelectAll(BoardDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<BoardDTO> list = session.selectList("board.getSelectAll", map);
		session.close();
		
		return list;
	}
	
	public BoardDTO getSelectOne(BoardDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		BoardDTO dto = session.selectOne("board.getSelectOne", map);
		session.close();
		
		return dto;
	}
	
	public int setInsert(BoardDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("board.setInsert", map);
		session.commit();
		session.close();
		
		return result;
	}
	
	public int setUpdate(BoardDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("board.setUpdate", map);
		session.commit();
		session.close();
		
		return result;
	}
	
	public int setDelete(BoardDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.delete("board.setDelete", map);
		session.commit();
		session.close();
		
		return result;
	}
	
	public int getMaxNumRefNo(String gubun) {
		Map<String, Object> map = new HashMap<>();
		map.put("gubun", gubun);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result  = session.selectOne("board.getMaxNumRefNo", map);
		session.close();
		return result;
	}
	
	public void setUpdateRelevel(BoardDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result  = session.update("board.setUpdateRelevel", map);
		session.close();
		
	}
}
