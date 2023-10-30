package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.ProfileDAO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

@Service
public class ProfileServiceImp implements ProfileService{
	
	@Autowired
	private ProfileDAO profileDao;
	
	String uploadPath = "D:\\uploadfiles";

	@Override
	public List<SaleBoardVO> getProductsById(int me_num, int state) {
		System.out.println(me_num);
		 List<SaleBoardVO> products = profileDao.getProductsById(me_num, state);
		System.out.println(products);
		  return products;
	}

	@Override
	public List<SaleCategoryVO> getProductsByCTNum(int sb_sc_num) {
		 List<SaleCategoryVO> category = profileDao.getCategoriesByScNum(sb_sc_num);
		 System.out.println("saleCategory"+category);
		    return category;
	}

	@Override
	public void updateProductDate(SaleBoardVO saleBoard) {
		if(saleBoard == null) {
			return;
		}
		profileDao.updateBoardViews(saleBoard);

	}

	
	
}
	
	
	
	
	
	
	
	
	
	
