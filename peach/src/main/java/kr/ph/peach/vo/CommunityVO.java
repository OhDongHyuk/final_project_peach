package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommunityVO {

	
	private int co_num, co_like, co_reply, co_me_num, co_cc_num;
	private String co_title, co_info, co_date;
	
	public CommunityVO(int co_num, int co_like, int co_reply, int co_me_num, int co_cc_num, String co_title,
			String co_info, String co_date) {
		this.co_num = co_num;
		this.co_like = co_like;
		this.co_reply = co_reply;
		this.co_me_num = co_me_num;
		this.co_cc_num = co_cc_num;
		this.co_title = co_title;
		this.co_info = co_info;
		this.co_date = co_date;
	}
	
	public CommunityVO(String co_title, String co_info, int co_me_num) {
		this.co_title = co_title;
		this.co_info = co_info;
		this.co_me_num = co_me_num;
	}
}