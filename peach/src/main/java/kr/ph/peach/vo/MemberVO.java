package kr.ph.peach.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private int me_num;
	private String me_id;
	private String me_pw; 
	private String me_name;
	private String me_acc;
	private String me_phone;
	private String me_nick; 
	private String me_au;
	private Date me_date; 
	private String me_sugar; 
	private String me_st_num; 
	private String me_ci_num; 
	private String me_bk_name; 
	private int me_point;
	private String me_session_id;
	private Date me_session_limit;
	
	public String getme_date_str() {
		if(me_date == null) {
			return "";
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(me_date);
	}
	

}
