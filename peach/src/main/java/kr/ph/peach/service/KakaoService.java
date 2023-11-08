package kr.ph.peach.service;

import kr.ph.peach.vo.KakaoVO;

public interface KakaoService {

	KakaoVO getKakaoInfo(String code) throws Exception;

	boolean signup(KakaoVO kakao);

}
