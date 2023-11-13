package kr.ph.peach.vo;

import lombok.Data;

@Data
public class KakaoVO {
	String access_token;
	String token_type;
	String refresh_token;
	String scope;
	int expires_in;
	int refresh_token_expires_in;
	String target_id_type;
	String target_id;
}
