package kr.ph.peach.service;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.MemberDAO;
import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean signup(MemberVO member) {
		if (member == null) {
			return false;
		}

		// 아이디 중복 확인
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		// 가입하려는 아이디가 이미 가입된 경우
		if (dbMember != null) {
			return false;
		}
		MemberVO dbMember2 = memberDao.selectMemberByNickName(member.getMe_nick());
		if(dbMember2 != null ) {
			return false;
		}
		MemberVO dbMember3 = memberDao.selectMemberByPhoneNum(member.getMe_phone());
		if(dbMember3 != null ) {
			return false;
		}
		MemberVO dbMember4 = memberDao.selectMemberByAcc(member.getMe_acc());
		if(dbMember4 != null ) {
			return false;
		}
		// 아이디, 비번 null 체크 + 유효성 검사
		// 아이디는 이메일 형식
		String idRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\\-.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";
		// 비번은 영문,숫자,!@#$%로 이루어지고 6~15자
		String pwRegex = "^[a-zA-Z0-9!@#$%]{6,15}$";

		// 아이디가 유효성에 맞지 않으면
		if (!Pattern.matches(idRegex, member.getMe_id())) {
			return false;
		}
		// 비번이 유효성에 맞지 않으면
		if (!Pattern.matches(pwRegex, member.getMe_pw())) {
			return false;
		}

		// 비번 암호화
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
		System.out.println(member);
		// 회원가입
		return memberDao.insertMember(member);
	}

	
		
	@Override
	public boolean checkId(String id) {
		return memberDao.selectMember(id) == null;
	}
	
	@Override
	public MemberVO login(MemberVO member) {
		if(!checkIdRegex(member.getMe_id()) || !checkPwRegex(member.getMe_pw())) {
			return null;
		}
		//아이디와 일치하는 회원 정보를 가져옴
		MemberVO user = memberDao.selectMember(member.getMe_id());
		
		//아이디와 일치하는 회원 정보가 있고, 비번이 일치하면 
		if(user != null && passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			return user;
		}
		return null;
	}
	private boolean checkIdRegex(String id) {
		//아이디는 영문,숫자,@._-로 이루어지고 8~20자 
		String regexId = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\\-.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i";
		
		if(id == null) {
			return false;
		}
		return Pattern.matches(regexId, id);
	}
	private boolean checkPwRegex(String pw) {
		
		//비번은 영문,숫자,특수문자로 이루어지고 8~20자 
		String regexPw = "^[a-zA-Z0-9!@#$%^&*()_+|~]{8,20}$";
		if(pw == null) {
			return false;
		}
		return Pattern.matches(regexPw, pw);
	}
	
	@Override
	public void updateMemberSession(MemberVO user) {
		if(user == null) {
			return;
		}
		memberDao.updateMemberSession(user);
		
	}
	
	@Override
	public MemberVO getMemberBySessionId(String sId) {
		return memberDao.selectMemberBySessionId(sId);
	}


	@Override
	public List<CityVO> getLargeCity() {
		// TODO Auto-generated method stub
		return memberDao.selectLargeCity();
	}


	@Override
	public List<CityVO> getMediumCity(String large) {
		return memberDao.selectMediumCity(large);
	}


	@Override
	public List<CityVO> getSmall(String medium) {
		// TODO Auto-generated method stub
		return memberDao.selectSmallCity(medium);
	}
	
	@Override
	public List<BankVO> getBank() {
		return  memberDao.selectBank();
	}


	@Override
	public boolean checkNick(String nick) {
		return memberDao.selectMemberByNickName(nick) == null;
		
	}



	
	

}
