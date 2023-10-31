package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.StatementVO;

public interface SaleCategoryService {

	List<SaleCategoryVO> getSaleCategoryList();

	List<StatementVO> getMemberTypeList(MemberVO user);

}
