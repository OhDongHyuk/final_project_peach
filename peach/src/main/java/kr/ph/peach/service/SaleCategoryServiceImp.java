package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.MemberDAO;
import kr.ph.peach.dao.SaleCategoryDAO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.StatementVO;

@Service
public class SaleCategoryServiceImp implements SaleCategoryService{

	@Autowired
	SaleCategoryDAO saleCategoryDao;
	
	@Autowired
	MemberDAO memberDao;
  
	@Override
	public List<SaleCategoryVO> getSaleCategoryList() {
		return saleCategoryDao.selectSaleCategoryList();

	}

	@Override
	public List<StatementVO> getMemberTypeList(MemberVO user) {
		
		return memberDao.selectMemberTypeList();
	}

}
