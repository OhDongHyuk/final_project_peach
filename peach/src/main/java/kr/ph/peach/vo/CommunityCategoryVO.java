package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommunityCategoryVO {

	
	private int cc_num;
	private String cc_name;
	
	public CommunityCategoryVO(int cc_num, String cc_name) {
		super();
		this.cc_num = cc_num;
		this.cc_name = cc_name;
	}
}