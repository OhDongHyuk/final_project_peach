package kr.ph.peach.vo;

import java.text.SimpleDateFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

//vo 패키지에 파일이 없으면 vo 패키지가 추가되지 않아 임시 파일을 등록함.
@Data
@NoArgsConstructor
public class WishVO {
	private int wi_num, wi_me_num, wi_sb_num;
	
	public WishVO(int wi_me_num, int wi_sb_num) {
		this.wi_me_num = wi_me_num;
		this.wi_sb_num = wi_sb_num;
	}

}
