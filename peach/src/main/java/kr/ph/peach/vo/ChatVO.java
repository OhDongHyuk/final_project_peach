package kr.ph.peach.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

//vo 패키지에 파일이 없으면 vo 패키지가 추가되지 않아 임시 파일을 등록함.
@Data
@NoArgsConstructor
public class ChatVO {
	private int ch_num, ch_sb_num, ch_me_num;
	private String ch_seller_nickname, ch_buyer_nickname, ch_sb_name, ch_last_date;
	private int unreadCount;
	
	List<MessageVO> messageVO;

}
