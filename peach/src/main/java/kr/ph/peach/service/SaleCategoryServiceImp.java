package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.SaleCategoryDAO;
import kr.ph.peach.vo.SaleCategoryVO;

@Service
public class SaleCategoryServiceImp implements SaleCategoryService{

	@Autowired
	SaleCategoryDAO saleCategoryDao;
  
	@Override
	public List<SaleCategoryVO> getSaleCategoryList() {
		return saleCategoryDao.selectSaleCategoryList();

	}

}
