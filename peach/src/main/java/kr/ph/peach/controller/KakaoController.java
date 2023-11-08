package kr.ph.peach.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ph.peach.service.KakaoService;
import kr.ph.peach.vo.KakaoMemberVO;
import kr.ph.peach.vo.KakaoVO;
import kr.ph.peach.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class KakaoController<JSONElement> {

	@Autowired
	private KakaoService kakaoService;

	private String clientId = "48d34ab3779ba344d7b7d355a84f5660";

	@GetMapping("/kakao/login")
	public String loginKakao(Model model, String code, String state) {

		KakaoVO kakao = getKakaoAccessToken(code);

		System.out.println(kakao);
		String res = getUserForKakao(kakao.getAccess_token());
		log.info(res);
		System.out.println(res);
		
		

		return "redirect:/";
	}
	@PostMapping("/kakao/login")
	public String signupPost(KakaoVO kakao,Model model) {
		
		//서비스에게 회원가입 시켜야 함 => 회원정보를 주면서 => 가입여부를 알려달라고 함
		boolean res = kakaoService.signup(kakao);
		if(res) {
			model.addAttribute("msg", "회원가입 성공!");
			model.addAttribute("url", "");
		}else {
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
																												// 설정

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
		} catch (Exception e) {
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
			String apiUrl = "https://kapi.kakao.com/v2/user/me";
			// URL 객체 생성
			URL url = new URL(apiUrl);

			// HTTP 연결 설정
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			// connection.setRequestProperty("Content-Type",
			// "application/x-www-form-urlencoded;charset=utf-8"); // 요청 헤더 설정
			connection.setRequestProperty("Authorization", "Bearer " + accessToken); // 요청 헤더 설정

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

				

				in.close();
				// 응답 출력
				ObjectMapper objectMapper = new ObjectMapper();
				
				/*
				 * KakaoMemberVO kakaoMemberVO = objectMapper.readValue(in,
				 * KakaoMemberVO.class); System.out.println(kakaoMemberVO);
				 */

				return response.toString();

			} else {
				log.debug("API 호출 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private String saveUserForKakao(String accessToken) {
		try {
			log.info(accessToken);
			
			String apiUrl = "https://kapi.kakao.com/v1/user/update_profile";
			// URL 객체 생성
			URL url = new URL(apiUrl);

			// HTTP 연결 설정
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "Bearer " + accessToken); // 요청 헤더 설정

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
				ObjectMapper objectMapper = new ObjectMapper();
				
				KakaoMemberVO kakaoMemberVO = objectMapper.readValue(in, KakaoMemberVO.class);
				System.out.println(kakaoMemberVO);
				
				HashMap<String, Object> kakaomember = new HashMap<>();
				in.close();


				return response.toString();

			} else {
				log.debug("API 호출 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
