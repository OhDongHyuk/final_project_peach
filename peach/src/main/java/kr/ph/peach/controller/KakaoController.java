
package kr.ph.peach.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ph.peach.service.KakaoService;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.ProfileService;
import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.KakaoVO;
import kr.ph.peach.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@Controller

@Log4j
public class KakaoController<JSONElement> {

	@Autowired
	private KakaoService kakaoService;

	@Autowired
	MemberService memberService;

	@Autowired
	private ProfileService profileService;

	private String clientId = "48d34ab3779ba344d7b7d355a84f5660";

	@SuppressWarnings({ "unchecked", "unused" })
	@GetMapping("/kakao/login")
	public String loginKakao(Model model, String code, String state, MemberVO member, HttpSession session)
			throws IOException {

		KakaoVO kakao = getKakaoAccessToken(code);

		System.out.println(kakao);
		String res = getUserForKakao(kakao.getAccess_token());
		log.info(res);

		Map<String, Object> kakaoinfo = getKakaologin(res);
//		String userid = (String) ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("email");

		MemberVO kakaouser = new MemberVO();
		kakaouser.setMe_id((String) ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("email"));
		String kakaoemail = (String) ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("email");
		kakaouser.setMe_id(kakaoemail);
		String p = (String) ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("phone_number");
		String R = p.replace("+82 ", "0");
		kakaouser.setMe_phone(R);
		System.out.println(kakaouser);

		MemberVO user = memberService.kakaologin(kakaouser);

		if (kakao != null || user.getMe_id() == null) {
			// 유저정보
			session.setAttribute("user", user);
			// 카카오톡에서 받은 토큰
			session.setAttribute("kakao", kakao);
			return "redirect:/";
		} else {
			model.addAttribute("kakaoinfo", kakaoinfo);
			List<CityVO> list = memberService.getLargeCity();
			model.addAttribute("title", "회원가입");
			model.addAttribute("large", list);
			List<BankVO> bankList = memberService.getBank();
			model.addAttribute("bankList", bankList);
			model.addAttribute("R", R);
			return "/member/kakaosignup";
		}

//		session.setAttribute("user", user);

	}

	@GetMapping("/kakao/logout")
	public String logout(Model model, String code, String state, HttpSession session) {

		
		
		session.invalidate();

		return "redirect:https://kauth.kakao.com/oauth/logout?client_id=48d34ab3779ba344d7b7d355a84f5660&logout_redirect_uri=http://localhost:8080/peach";

	}

	/*
	 * @GetMapping("/member/logout") public String kakaoLogout(HttpSession session,
	 * String code) {
	 * 
	 * KakaoVO kakao = getKakaoAccessToken(code);
	 * 
	 * if (kakao != null && !"".equals("access_Token")) {
	 * session.removeAttribute("access_Token"); session.removeAttribute("user"); }
	 * else { System.out.println("access_Token is null");
	 * 
	 * }
	 * 
	 * return "redirect:/";
	 * 
	 * }
	 */

	@PostMapping("/member/kakaosignup")
	public String signupPost(MemberVO member, Model model) {
		System.out.println(member);

		MemberVO dbMemberByPhone = memberService.selectMemberByPhoneNum(member.getMe_phone());
		if (dbMemberByPhone != null) {
			model.addAttribute("msg", "핸드폰 번호가 이미 존재합니다.");
			model.addAttribute("url", "/member/kakaosignup");
			return "main/message";
		}

		MemberVO dbMemberByAcc = memberService.selectMemberByAcc(member.getMe_acc());
		if (dbMemberByAcc != null) {
			model.addAttribute("msg", "계좌 번호가 이미 존재합니다.");
			model.addAttribute("url", "/member/kakaosignup");
			return "main/message";
		}

		// 서비스에게 회원가입 시켜야 함 => 회원정보를 주면서 => 가입여부를 알려달라고 함
		boolean res = memberService.signup(member);
		if (res) {
			model.addAttribute("msg", "회원가입 성공!");
			model.addAttribute("url", "member/login");
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "member/kakaosignup");
		}
		profileService.addProfileNum(member.getMe_num());
		return "/main/message";
	}

	@SuppressWarnings("unchecked")
	private Map<String, Object> getKakaologin(String res) throws IOException {

		ObjectMapper objectMapper = new ObjectMapper(); // 발급받은 통행증을 map화
		Map<String, Object> kakaoinfo = objectMapper.readValue(res, new TypeReference<Map<String, Object>>() {
		});
		System.out.println(kakaoinfo);
		System.out.println("유저 ID = " + kakaoinfo.get("id"));
		System.out.println("유저 연동시간 = " + kakaoinfo.get("connected_at"));
		System.out.println("유저 닉네임 = " + ((Map<String, Object>) kakaoinfo.get("properties")).get("nickname"));
		System.out.println("유저 이름 = " + ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("name"));
		System.out.println("유저 핸드폰번호 = " + ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("phone_number"));
		System.out.println("유저 이메일 = " + ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("email"));
//		System.out.println(kakaoinfo.keyset("properties"));

		MemberVO member = new MemberVO();
		member.setMe_id((String) ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("email"));
		member.setMe_nick((String) ((Map<String, Object>) kakaoinfo.get("properties")).get("nickname"));
		member.setMe_name((String) ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("name"));
		String p = (String) ((Map<String, Object>) kakaoinfo.get("kakao_account")).get("phone_number");
		p.replace("+82 ", "0");
		member.setMe_phone(p);
//		String userID = (String)kakaoinfo.get("id");

		return kakaoinfo;

		/*
		 * for(String key: kakaoinfo.keySet()) { System.out.println("{" + key+ " => " +
		 * kakaoinfo.get(key) + "}"); System.out.println("=================");
		 * for(String K : kakaoinfo.keySet()) { System.out.println(K); }
		 */

	}

	@PostMapping("/kakao/login")
	public String signupPost(KakaoVO kakao, Model model) {

		// 서비스에게 회원가입 시켜야 함 => 회원정보를 주면서 => 가입여부를 알려달라고 함
		boolean res = kakaoService.signup(kakao);
		if (res) {
			model.addAttribute("msg", "회원가입 성공!");
			model.addAttribute("url", "");
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "member/signup");
		}
		return "/main/message";
	}

	private KakaoVO getKakaoAccessToken(String code) {
		try {
			String apiUrl = "https://kauth.kakao.com/oauth/token";
			Map<String, String> params = new HashMap<String, String>();
			params.put("client_id", clientId);
			params.put("redirect_url", "Http://localhost:8080/spring/login/kakao");
			params.put("grant_type", "authorization_code");
			params.put("code", code);
			apiUrl = addParams(apiUrl, params);

			URL url = new URL(apiUrl);

			// HTTP 연결 설정
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8"); // 요청 헤더
																												// // 설정

			// 응답 코드 확인
			int responseCode = connection.getResponseCode();

			// 응답 데이터 읽기
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String inputLine;
				StringBuilder response = new StringBuilder();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();

				ObjectMapper objectMapper = new ObjectMapper();

				KakaoVO person = objectMapper.readValue(response.toString(), KakaoVO.class);
				return person;
			} else {
				log.debug("API 호출 실패");
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private String addParams(String url, Map<String, String> parameters) {
		// StringBuilder를 사용하여 URL 문자열 생성
		StringBuilder urlBuilder = new StringBuilder(url);
		// 파라미터 추가
		if (!parameters.isEmpty()) {
			urlBuilder.append("?");
			for (Map.Entry<String, String> entry : parameters.entrySet()) {
				try {
					String key = URLEncoder.encode(entry.getKey(), "UTF-8");
					String value = URLEncoder.encode(entry.getValue(), "UTF-8");
					urlBuilder.append(key).append("=").append(value).append("&");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			// 마지막 '&' 문자 제거
			urlBuilder.deleteCharAt(urlBuilder.length() - 1);
		}

		// 최종 URL 출력
		return urlBuilder.toString();
	}

	private String getUserForKakao(String accessToken) {

		try {
			log.info(accessToken);
			String apiUrl = "https://kapi.kakao.com/v2/user/me"; // URL 객체 생성
			URL url = new URL(apiUrl);

			// HTTP 연결 설정
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET"); //
			connection.setRequestProperty("Content-Type", //
					"application/x-www-form-urlencoded;charset=utf-8"); // 요청 헤더 설정
			connection.setRequestProperty("Authorization", "Bearer " + accessToken);
			// 요청 헤더 설정

			// 응답 코드 확인
			int responseCode = connection.getResponseCode();
			log.info("HTTP 응답 코드: " + responseCode);

			// 응답 데이터 읽기
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String inputLine;
				StringBuilder response = new StringBuilder();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}

				in.close(); // 응답 출력
				/*
				 * KakaoMemberVO kakaoMemberVO = objectMapper.readValue(in,
				 * KakaoMemberVO.class); System.out.println(kakaoMemberVO);
				 */
				return response.toString();

			} else {
				log.debug("API 호출 실패");
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private KakaoVO kakaoLogout(String code) {
		try {
			
			
			String apiUrl = "https://kauth.kakao.com/oauth/logout?client_id=48d34ab3779ba344d7b7d355a84f5660&logout_redirect_uri=Http://localhost:8080/peach";
			URL url = new URL(apiUrl);

			// HTTP 연결 설정
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8"); // 요청 헤더
																												// // 설정

			// 응답 코드 확인
			int responseCode = connection.getResponseCode();

			// 응답 데이터 읽기
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String inputLine;
				StringBuilder response = new StringBuilder();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();

			} else {
				System.out.println("호출실패");
			}
		} catch (

		Exception e) {
			e.printStackTrace();
			System.out.println("호출실패");
		}
		return null;
	}
}
