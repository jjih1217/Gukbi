package com.jih.springStudy.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jih.springStudy.cart.model.dao.CartDAO;
import com.jih.springStudy.cart.model.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService{

	@Inject
	CartDAO cartDao;
	
	@Override
	public List<CartDTO> getSelectAll() {
		return cartDao.getSelectAll();
	}

	@Override
	public int setInsert(CartDTO paramDto) {
		return cartDao.setInsert(paramDto);
	}

	@Override
	public int setUpdate(CartDTO paramDto) {
		return cartDao.setUpdate(paramDto);
	}

	@Override
	public int setDelete(CartDTO paramDto) {
		return cartDao.setDelete(paramDto);
	}

	@Override
	public int cartClear(int memberNo) {
		return cartDao.cartClear(memberNo);
	}

}
