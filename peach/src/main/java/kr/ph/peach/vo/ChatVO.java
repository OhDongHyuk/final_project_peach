package kr.ph.peach.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatVO {
	private int ch_num, ch_sb_num, ch_me_num;
	private String ch_seller_nickname, ch_buyer_nickname, ch_sb_name, ch_last_date;
	private int unreadCount;
	
	List<MessageVO> messageVO;

}
