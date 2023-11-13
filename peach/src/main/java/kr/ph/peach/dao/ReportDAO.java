package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.vo.ReportVO;

public interface ReportDAO {

	void insertReport(@Param("reportVo") ReportVO reportVo);

	List<ReportVO> getreportList(@Param("cri")MemberCriteria cri);


}