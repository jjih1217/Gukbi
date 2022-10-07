package com.jih.springStudy.product.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jih.springStudy.product.model.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Inject
	SqlSession sqlSqssion;
	
	@Override
	public List<ProductDTO> getSelectAll() {
		return sqlSqssion.selectList("product.getSelectAll");
	}

	@Override
	public ProductDTO getSelectOne(ProductDTO paramDto) {
		return sqlSqssion.selectOne("product.getSelectOne",paramDto);
	}

	@Override
	public int setInsert(ProductDTO paramDto) {
		return sqlSqssion.insert("product.setInsert",paramDto);
	}

	@Override
	public int setUpdate(ProductDTO paramDto) {
		return sqlSqssion.update("product.setUpdate",paramDto);
	}

	@Override
	public int setDelete(ProductDTO paramDto) {
		return sqlSqssion.delete("product.setDelete",paramDto);
	}

}
