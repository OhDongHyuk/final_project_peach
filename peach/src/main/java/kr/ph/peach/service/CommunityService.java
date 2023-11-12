package kr.ph.peach.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.pagination.CriteriaProfile;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;

public interface CommunityService {

	boolean insertCommunity(CommunityVO community, MemberVO user, MultipartFile[] fileList, int cc_num);
	
	List<CommunityCategoryVO> selectCCategory();
	
	 int selectCIname(String CICategory);

	List<CommunityVO> getBoardList(CriteriaCom cri);

	String getMeNick(CommunityVO tmp);

	int getTotalCount(CriteriaCom cri);

	CommunityVO selectDetail(int co_num);



}
