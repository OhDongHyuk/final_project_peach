package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.SaleBoardDAO;
import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.vo.SaleBoardVO;

@Service
public class SaleBoardServiceImp implements SaleBoardService {
	
	@Autowired
	SaleBoardDAO saleBoardDao;

	@Override
	public List<SaleBoardVO> getSaleBoardList(SaleBoardCriteria cri) {
		if(cri == null) {
			cri = new SaleBoardCriteria();
		}
		return saleBoardDao.selectSaleBoardList(cri);
	}

	@Override
	public int getTotalCount(SaleBoardCriteria cri) {
		if(cri == null) {
			cri = new SaleBoardCriteria();
		}
		return saleBoardDao.getTotalCount(cri);
		
	}

}
