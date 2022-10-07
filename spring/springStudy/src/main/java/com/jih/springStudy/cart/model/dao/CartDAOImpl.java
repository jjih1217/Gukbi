package com.jih.springStudy.cart.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springStudy.cart.model.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CartDTO> getSelectAll() {
		return sqlSession.selectList("cart.getSelectAll");
	}

	@Override
	public int setInsert(CartDTO paramDto) {
		return sqlSession.insert("cart.setInsert",  paramDto);
	}

	@Override
	public int setUpdate(CartDTO paramDto) {
		return sqlSession.update("cart.setUpdate",  paramDto);
	}

	@Override
	public int setDelete(CartDTO paramDto) {
		return sqlSession.delete("cart.setDelete",  paramDto);
	}

	@Override
	public int cartClear(int memberNo) {
		return sqlSession.delete("cart.cartClear",  memberNo);
	}
}
