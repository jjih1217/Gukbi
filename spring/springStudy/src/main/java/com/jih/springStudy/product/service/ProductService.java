package com.jih.springStudy.product.service;

import java.util.List;

import com.jih.springStudy.product.model.dto.ProductDTO;

public interface ProductService {
	public List<ProductDTO> getSelectAll();
	public ProductDTO getSelectOne(ProductDTO paramDto);
	public int setInsert(ProductDTO paramDto);
	public int setUpdate(ProductDTO paramDto);
	public int setDelete(ProductDTO paramDto);
}
