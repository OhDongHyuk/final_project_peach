package kr.ph.peach.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.ProfileDAO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

@Service
public class ProfileServiceImp implements ProfileService{
	
	@Autowired
	private ProfileDAO profileDao;
	
	String uploadPath = "D:\\uploadfiles";

	@Override
	public List<SaleBoardVO> getProductsById(int me_num, int state) {
		 List<SaleBoardVO> products = profileDao.getProductsById(me_num, state);
		  return products;
	}

	@Override
	public List<SaleCategoryVO> getProductsByCTNum(int sb_sc_num) {
		 List<SaleCategoryVO> category = profileDao.getCategoriesByScNum(sb_sc_num);
		    return category;
	}

	@Override
	public void dateUp(Integer sb_num) {
		profileDao.dateUp(sb_num);
	}

	@Override
	public boolean deletePD(Integer sb_num) {
		if(sb_num == null) {
			return false;
		}else {
		
		//게시글 삭제 
		profileDao.deleteBoard(sb_num);}
		return true;
	}

	@Override
	public List<CityVO> selectAllCategory() {
		
		return profileDao.selectAllCategory();
	}

	

}	

	

	/*
	@Override
	public List<MemberVO> getMemberList(String me_id) {
		return profileDao.selectMemberList(me_id);
	}
	*/
	
	
	
	
	
	
	
	
	
