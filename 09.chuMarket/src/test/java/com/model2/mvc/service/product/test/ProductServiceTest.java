package com.model2.mvc.service.product.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

/*
 *	FileName :  ProductServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml" })
public class ProductServiceTest 
{

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	//@Test
	//테스트 완료!!
	public void testAddProduct() throws Exception 
	{
		Product product = new Product();
		product.setProdName("추추몬");
		product.setFileName("추추몬.jpg");
		product.setManuDate("20240304");
		product.setProdDetail("가성비 최고!");
		product.setPrice(90000);
		product.setProdStock(10);
		
		product = productService.addProduct(product);
		
		//==> console 확인
		System.out.println(product);
		
		//==> API 확인
		Assert.assertEquals("추추몬", product.getProdName());
		Assert.assertEquals("추추몬.jpg", product.getFileName());
		Assert.assertEquals("20240304", product.getManuDate());
		Assert.assertEquals("가성비 최고!", product.getProdDetail());
		Assert.assertEquals(90000, product.getPrice());
		Assert.assertEquals(10, product.getProdStock());
	}
	
	 //@Test
	 //테스트 완료!!
	 public void testGetProduct() throws Exception 
 	 {
		Product product = new Product();
		product = productService.getProduct(10008);
		
		//==> console 확인
		System.out.println(product);
		
	 }
	
	 //@Test
	 //테스트 완료!!
	 public void testUpdateProduct() throws Exception
	 {
		 
		Product product = productService.getProduct(10008);
		Assert.assertNotNull(product);
		
		Assert.assertEquals("추추몬", product.getProdName());
		Assert.assertEquals("추추몬.jpg", product.getFileName());
		Assert.assertEquals("20240304", product.getManuDate());
		Assert.assertEquals("가성비 최고!", product.getProdDetail());
		Assert.assertEquals(90000, product.getPrice());
		
		System.out.println(product);
		
		product.setProdStock(11);
		
		productService.updateProduct(product);
		
		product = productService.getProduct(10008);
		
		System.out.println(product);
		
		Assert.assertNotNull(product);
		
		//==> API 확인
		Assert.assertEquals("추추몬", product.getProdName());
		Assert.assertEquals("추추몬.jpg", product.getFileName());
		Assert.assertEquals("20240304", product.getManuDate());
		Assert.assertEquals("가성비 최고!", product.getProdDetail());
		Assert.assertEquals(90000, product.getPrice());
		Assert.assertEquals(11, product.getProdStock());
	 }
	
	 //@Test
	 //테스트 완료!!
	 public void testGetProductListAll() throws Exception
	 {
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 //@Test
	 //테스트 완료!!
	 public void testGetProductListByProdNo() throws Exception
	 {
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("10008");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 //테스트 완료!!
	 public void testGetProductListByProdName() throws Exception
	 {
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("추추몬");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 
	 
	 //@Test
	 //테스트 완료!!
	 public void testGetProductListByPrice() throws Exception
	 {
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("2");
	 	search.setSearchKeyword("10000");
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 
	 
	 //@Test
	 //테스트 완료!!
	 public void testGetProductTotal() throws Exception
	 {
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	int totalCount = productService.getProductTotal(search);
	 	
	 	System.out.println(totalCount);
	 }
}