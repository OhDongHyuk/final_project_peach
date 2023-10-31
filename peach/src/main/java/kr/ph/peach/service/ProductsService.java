package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.ProductsVO;

public interface ProductsService {

	List<ProductsVO> getProductsById(int me_num, int state);

}
