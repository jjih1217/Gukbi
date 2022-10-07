package com.jih.springStudy.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jih.springStudy.product.model.dao.ProductDAO;
import com.jih.springStudy.product.model.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	ProductDAO productDao;
	
	@Override
	public List<ProductDTO> getSelectAll() {
		return productDao.getSelectAll();
	}

	@Override
	public ProductDTO getSelectOne(ProductDTO paramDto) {
		return productDao.getSelectOne(paramDto);
	}

	@Override
	public int setInsert(ProductDTO paramDto) {
		return productDao.setInsert(paramDto);
	}

	@Override
	public int setUpdate(ProductDTO paramDto) {
		return productDao.setUpdate(paramDto);
	}

	@Override
	public int setDelete(ProductDTO paramDto) {
		return productDao.setDelete(paramDto);
	}

}