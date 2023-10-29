package kr.ph.peach.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;


import kr.ph.peach.vo.SaleCategoryVO;

public interface SaleCategoryDAO {


	List<SaleCategoryVO> selectSaleCategoryList();

}
