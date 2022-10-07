package com.jih.springStudy.cart.service;

import java.util.List;

import com.jih.springStudy.cart.model.dto.CartDTO;

public interface CartService {
	public List<CartDTO> getSelectAll();
	public int setInsert(CartDTO paramDto);
	public int setUpdate(CartDTO paramDto);
	public int setDelete(CartDTO paramDto);
	public int cartClear(int memberNo);
}
