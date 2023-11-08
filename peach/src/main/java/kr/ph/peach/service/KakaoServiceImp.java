package kr.ph.peach.service;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class KakaoServiceImp implements KakaoService {
	


	/*
	 * 
	 * private String KAKAO_CLIENT_ID = "48d34ab3779ba344d7b7d355a84f5660"; private
	 * String KAKAO_CLIENT_SECRET = "V6tcNX7iCNfAYG26W6ws2s7LrFhXYYO4"; private
	 * String KAKAO_REDIRECT_URL = "http://localhost:8080/peach/kakao/login";
	 * 
	 * private final static String KAKAO_AUTH_URI = "https://kauth.kakao.com";
	 * private final static String KAKAO_API_URI = "https://kapi.kakao.com";
	 * 
	 * public String getKakaoLogin() { return KAKAO_AUTH_URI + "/oauth/authorize" +
	 * "?client_id=" + KAKAO_CLIENT_ID + "&redirect_uri=" + KAKAO_REDIRECT_URL +
	 * "&response_type=code"; }
	 * 
	 * @Override public KakaoVO getKakaoInfo(String code) throws Exception { if
	 * (code == null) throw new Exception("Failed get authorization code"); String
	 * accessToken = ""; String refreshToken = ""; try { HttpHeaders headers = new
	 * HttpHeaders(); headers.add("Content-type",
	 * "application/x-www-form-urlencoded");
	 * 
	 * MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	 * params.add("grant_type", "authorization_code"); params.add("client_id",
	 * KAKAO_CLIENT_ID); params.add("client_secret", KAKAO_CLIENT_SECRET);
	 * params.add("code", code); params.add("redirect_uri", KAKAO_REDIRECT_URL);
	 * 
	 * RestTemplate restTemplate = new RestTemplate();
	 * HttpEntity<MultiValueMap<String, String>> httpEntity = new
	 * HttpEntity<>(params, headers);
	 * 
	 * ResponseEntity<String> response = restTemplate.exchange(KAKAO_AUTH_URI +
	 * "/oauth/token", HttpMethod.POST, httpEntity, String.class);
	 * 
	 * JSONParser jsonParser = new JSONParser(); JSONObject jsonObj = (JSONObject)
	 * jsonParser.parse(response.getBody());
	 * 
	 * accessToken = (String) jsonObj.get("access_token"); refreshToken = (String)
	 * jsonObj.get("refresh_token"); } catch (Exception e) { throw new
	 * Exception("API call failed"); } return getUserInfoWithToken(accessToken); }
	 * 
	 * private KakaoVO getUserInfoWithToken(String accessToken) throws Exception {
	 * // HttpHeader 생성 HttpHeaders headers = new HttpHeaders();
	 * headers.add("Authorization", "Bearer " + accessToken);
	 * headers.add("Content-type",
	 * "application/x-www-form-urlencoded;charset=utf-8");
	 * 
	 * // HttpHeader 담기 RestTemplate rt = new RestTemplate();
	 * HttpEntity<MultiValueMap<String, String>> httpEntity = new
	 * HttpEntity<>(headers); ResponseEntity<String> response =
	 * rt.exchange(KAKAO_API_URI + "/v2/user/me", HttpMethod.POST, httpEntity,
	 * String.class);
	 * 
	 * // Response 데이터 파싱 JSONParser jsonParser = new JSONParser(); JSONObject
	 * jsonObj = (JSONObject) jsonParser.parse(response.getBody()); JSONObject
	 * account = (JSONObject) jsonObj.get("kakao_account"); JSONObject profile =
	 * (JSONObject) account.get("profile");
	 * 
	 * long id = (long) jsonObj.get("id"); String email =
	 * String.valueOf(account.get("email")); String nickname =
	 * String.valueOf(profile.get("nickname")); String name =
	 * String.valueOf(account.get("name")); String phnum =
	 * String.valueOf(profile.get("phone_number"));
	 * 
	 * return
	 * KakaoVO.builder().id(id).email(email).nickname(nickname).name(name).phnum(
	 * phnum).build(); }
	 */

}
