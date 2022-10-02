package exam.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import exam._mybatisConfig.MybatisManager;
import exam.model.dto.ApplicationDTO;


public class ApplicationDAO {
	
	public List<ApplicationDTO> getSelectAll() {
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<ApplicationDTO> list  = session.selectList("ApplicationBaepo.getSelectAll"); 
		session.close();
		
		return list;
	}
	
	public ApplicationDTO getSelectOne(ApplicationDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		ApplicationDTO dto = session.selectOne("ApplicationBaepo.getSelectOne", map);
		session.close();
		
		return dto;
	}
	
	public int setInsert(ApplicationDTO paramDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", paramDto);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.insert("ApplicationBaepo.setInsert", map);
		session.commit();
		session.close();
		
		return result;
	}
	
	
}
