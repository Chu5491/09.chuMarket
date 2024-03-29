package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDAO 
{
	public void addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;

	public void updateProduct(Product product) throws Exception;
	
	public List<Product> getProductList(Search search) throws Exception;
	
	public int getProductTotal(Search search) throws Exception;
	
	public List<Product> getMarketProductList(Map map) throws Exception;
}
