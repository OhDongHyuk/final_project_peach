package kr.ph.peach.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

//vo 패키지에 파일이 없으면 vo 패키지가 추가되지 않아 임시 파일을 등록함.
@Data
@NoArgsConstructor
public class MessageVO {
	private int ms_num, ms_me_num, ms_ch_num, ms_unread;
	private String ms_info, ms_date;

}
