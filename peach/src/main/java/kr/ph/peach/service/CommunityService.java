package kr.ph.peach.service;

import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;

public interface CommunityService {

	boolean insertCommunity(CommunityVO community, MemberVO user, MultipartFile[] fileList);

	CommunityCategoryVO selectCCategory(MemberVO user);

}
