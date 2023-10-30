package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

public interface ProfileService {

	List<SaleBoardVO> getProductsById(int me_num, int state);

	List<SaleCategoryVO> getProductsByCTNum(int sb_sc_num);

	void updateProductDate(SaleBoardVO saleBoard);


	
}
