package kr.ph.peach.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.dao.CommunityDAO;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;

@Service
public class CommunityServiceImp implements CommunityService{
	
	@Autowired
	private CommunityDAO communityDao;
	
	@Override
	public boolean insertCommunity(CommunityVO community, MemberVO user, MultipartFile[] fileList) {
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
		boolean res = communityDao.insertCommunity(community,user);
		
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
			/*
			try {
				//원래 파일명
				String fi_ori_name = file.getOriginalFilename();
				//서버에 업로드 후 업로드된 경로와 uuid가 포함된 파일명
				String fi_name = UploadFileUtils.uploadFile(uploadPath, fi_ori_name, file.getBytes());
				//파일 객체
				FileVO fileVo = new FileVO(board.getBo_num(), fi_name, fi_ori_name);
				communityDao.insertFile(fileVo);
			}catch(Exception e) {
				e.printStackTrace();
			}
			*/
		}
		
		return true;
	}

	@Override
	public CommunityCategoryVO selectCCategory(MemberVO user) {
			//여기부터 시작
		return null;
	}
}
	
	
	
	
	
	
	
	
	
	
