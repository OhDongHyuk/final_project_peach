
package kr.ph.peach.vo;

import lombok.Data;

@Data
public class KakaoMemberVO {

	private String target_id_type;
	private Long target_id;
	private String access_token;
	/*
	 * { id=3153540712, connected_at=2023-11-08T06:32:19Z, properties={nickname=정신},
	 * kakao_account={profile_nickname_needs_agreement=false, profile={nickname=정신},
	 * name_needs_agreement=false, name=정병찬, has_email=true,
	 * email_needs_agreement=false, is_email_valid=true, is_email_verified=true,
	 * email=gun6377@naver.com, has_phone_number=true,
	 * phone_number_needs_agreement=false, phone_number=+82 10-2198-6577} }
	 */

	/*
	 * public void setTarget_id(long id) { this.target_id = id+""; }
	 */
}
