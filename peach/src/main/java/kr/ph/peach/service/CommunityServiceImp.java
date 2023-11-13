package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.dao.CommunityDAO;
import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.pagination.CriteriaProfile;
import kr.ph.peach.util.UploadFileUtils;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityImageVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReplyVO;

@Service
public class CommunityServiceImp implements CommunityService{
	
	@Autowired
	private CommunityDAO communityDao;
	
	String uploadPath = "C:\\finalImg\\img";
	
	@Override
	public boolean insertCommunity(CommunityVO community, MemberVO user, MultipartFile[] fileList, int cc_num) {
		if(community == null || 
			community.getCo_title() == null || community.getCo_title().trim().length() == 0 ||
			community.getCo_info() == null) {
			return false;
		}
		//작성자가 없으면 안되기 때문
		if(user == null) {
			return false;
		}
		
		//게시글을 DB에 저장
		boolean res = communityDao.insertCommunity(community,user , cc_num);
		if(!res) {
			return false;
		}

		//첨부파일 등록
		if(fileList == null || fileList.length == 0) {
			return true;
		}
		
		for(MultipartFile file : fileList) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			
			try {
				//원래 파일명
				String ci_ori_name = file.getOriginalFilename();
				//서버에 업로드 후 업로드된 경로와 uuid가 포함된 파일명
				String fi_name = UploadFileUtils.uploadFile(uploadPath, ci_ori_name, file.getBytes());
				//파일 객체
				CommunityImageVO CommunityImageVo = new CommunityImageVO(community.getCo_num(), fi_name, ci_ori_name);
				communityDao.insertCommunityImage(CommunityImageVo);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return true;
	}
	
	@Override
	public List<CommunityCategoryVO> selectCCategory() {
	    List<CommunityCategoryVO> CCategory = communityDao.selectCCategory();
	    return CCategory;
	}
	
	@Override
	public int selectCIname(String CICategory) {
	
		int cc_num = communityDao.selectCICategory(CICategory);
		return cc_num;
	}

	@Override
	public List<CommunityVO> getBoardList(CriteriaCom cri) {
		if(cri == null) {
			cri = new CriteriaCom();
		}
		return communityDao.selectBoardList(cri);
	}

	@Override
	public String getMeNick(CommunityVO list) {
		return communityDao.selectMeNick(list);
	}

	@Override
	public int getTotalCount(CriteriaCom cri) {
			if(cri == null) {
			cri = new CriteriaCom();
		}
		return communityDao.selectCountBoardList(cri);
	}

	@Override
	public CommunityVO selectDetail(int co_num) {
		CommunityVO detail = communityDao.selectDetail(co_num);
		return detail;
	}

	@Override
	public MemberVO selectWriter(CommunityVO detail) {
		MemberVO Writer = communityDao.selectWriter(detail);
		return Writer;
	}

	@Override
	public void insertReply(String re_info, int co_num, MemberVO user) {
		communityDao.insertReply(re_info,co_num, user);
	}

	public List<ReplyVO> selectReply(int co_num) {
	    return communityDao.selectReply(co_num);
	    
	}

	@Override
	public String getReNick(ReplyVO reply) {
		return communityDao.selectReNick(reply);
	}

}
	
	
	
	
	
	
	
	
	
	
