package com.jih.springSihum.book.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springSihum.book.model.dto.BookDTO;


@Repository
public class BookDAOImpl implements BookDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BookDTO> getSelectAll() {
		return sqlSession.selectList("book.getSelectAll");
	}

	@Override
	public BookDTO getSelectOne(BookDTO paramDto) {
		return sqlSession.selectOne("book.getSelectOne", paramDto);
	}

	@Override
	public int setInsert(BookDTO paramDto) {
		return sqlSession.insert("book.setInsert", paramDto);
	}

	@Override
	public int setUpdate(BookDTO paramDto) {
		return sqlSession.update("book.setUpdate", paramDto);
	}

	@Override
	public int setDelete(BookDTO paramDto) {
		return sqlSession.delete("book.setDelete", paramDto);
	}

	
}
