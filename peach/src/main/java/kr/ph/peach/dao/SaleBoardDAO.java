package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.vo.SaleBoardVO;

public interface SaleBoardDAO {

	int getTotalCount(@Param("cri")SaleBoardCriteria cri);

	List<SaleBoardVO> selectSaleBoardList(@Param("cri")SaleBoardCriteria cri);
	

}
