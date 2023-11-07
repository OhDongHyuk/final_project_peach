package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.ProductsDAO;
import kr.ph.peach.vo.ProductsVO;

@Service
public class ProductsServiceImp implements ProductsService{
	
	@Autowired
	private ProductsDAO productsDao;
	
	String uploadPath = "D:\\uploadfiles";

	@Override
	public List<ProductsVO> getProductsById(int me_num, int state) {
		System.out.println(me_num);
		 List<ProductsVO> products = productsDao.getProductsById(me_num, state);
		System.out.println(products);
		  return products;
	}

}
