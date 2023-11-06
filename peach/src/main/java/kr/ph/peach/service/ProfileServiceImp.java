package kr.ph.peach.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.dao.ProfileDAO;
import kr.ph.peach.util.UploadFileUtils;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ProfileImageVO;
import kr.ph.peach.vo.ProfileVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

@Service
public class ProfileServiceImp implements ProfileService{
	
	@Autowired
	private ProfileDAO profileDao;
	
	String uploadPath = "D:\\uploadfiles";

	@Override
	public List<SaleBoardVO> getProductsById(int me_num, int state) {
		 List<SaleBoardVO> products = profileDao.getProductsById(me_num, state);
		  return products;
	}

	@Override
	public List<SaleCategoryVO> getProductsByCTNum(int sb_sc_num) {
		 List<SaleCategoryVO> category = profileDao.getCategoriesByScNum(sb_sc_num);
		    return category;
	}

	@Override
	public void dateUp(Integer sb_num) {
		profileDao.dateUp(sb_num);
	}

	@Override
	public boolean deletePD(Integer sb_num) {
		if(sb_num == null) {
			return false;
		}else {
		
		//게시글 삭제 
		profileDao.deleteBoard(sb_num);}
		return true;
	}

	@Override
	public List<CityVO> getMediumCity(String large) {
		return profileDao.selectMediumCity(large);
	}

	@Override
	public List<CityVO> getSmall(String medium) {
		return profileDao.selectSmallCity(medium);
	}

	@Override
	public List<CityVO> getLargeCity() {
		return profileDao.selectLargeCity();
	}

	@Override
	public boolean updateProfile(MemberVO user, MultipartFile[] files) {
		if(user == null) {
			return false;
		}
		profileDao.updateUserId(user);
		profileDao.updateUserPw(user);
		
		if(files == null || files.length == 0) {
			return true;
		}
		
		//uploadFileAndInsert(files, user.getMe_num());
		
		return true;
	}
	/*
	private void uploadFileAndInsert(MultipartFile[] files, int me_num) {
		if(files == null || files.length == 0) {
			return;
		}
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}
			int pi_num2 = 2;
			try {
				int pi_num = pi_num2;
				String pi_name = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				ProfileImageVO profileImage = new ProfileImageVO(pi_num, pi_name, me_num);
				profileDao.insertFile(profileImage);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	*/

	@Override
	public void updateCity(MemberVO user, int me_ci_num) {
		profileDao.updateCity(user, me_ci_num);
	}

	@Override
	public void updateText(MemberVO user, String pf_text) {
		profileDao.updateText(user, pf_text);
	}

	@Override
	public ProfileVO getPfText(MemberVO user) {
		
		return profileDao.selectPfText(user);
	}

	@Override
	public List<ProfileVO> getPF(MemberVO user) {
		return profileDao.getPF(user);
	}

	@Override
	public void updateText2(MemberVO user, List<ProfileVO> pfList) {
		profileDao.updateText2(user, pfList);
	}
	

}	

	

	/*
	@Override
	public List<MemberVO> getMemberList(String me_id) {
		return profileDao.selectMemberList(me_id);
	}
	*/
	
	
	
	
	
	
	
	
	
