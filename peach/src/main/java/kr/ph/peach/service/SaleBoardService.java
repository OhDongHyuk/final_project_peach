package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.vo.SaleBoardVO;


public interface SaleBoardService {

	List<SaleBoardVO> getSaleBoardList(SaleBoardCriteria cri);
	int getTotalCount(SaleBoardCriteria cri);


}
