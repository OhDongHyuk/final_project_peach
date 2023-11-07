package kr.ph.peach.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaleBoardVO {
	private int sb_num;
	private String sb_name;
	private Integer sb_price;
	private String sb_info;
	private Date sb_date;
	private int sb_wish;
	private int sb_me_num;
	private int sb_ss_num;
	private int sb_sc_num;
	private String sb_me_nickname;
	
	private List<SaleImageVO> saleImageVOList;
	
	public SaleBoardVO(String sb_name, int sb_price, String sb_info, int sb_sc_num) {
		this.sb_name = sb_name;
		this.sb_price = sb_price;
		this.sb_info = sb_info;
		this.sb_sc_num = sb_sc_num;
	}
	
	public String get_sb_price(int sb_price) {
		DecimalFormat decFormat = new DecimalFormat("###,###");
		return decFormat.format(sb_price);
	}
	
	public String get_sb_date(Date sb_date) {		
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return timeFormat.format(sb_date);
	}	

}
