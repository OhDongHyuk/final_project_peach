package kr.ph.peach.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

//vo 패키지에 파일이 없으면 vo 패키지가 추가되지 않아 임시 파일을 등록함.
@Data
@NoArgsConstructor
public class CityVO {

	private int ci_num;
	private String ci_large;
	private String ci_medium;
	private String ci_small;
	
	public CityVO(int ci_num, String ci_large, String ci_medium, String ci_small) {
		this.ci_num = ci_num;
		this.ci_large = ci_large;
		this.ci_medium = ci_medium;
		this.ci_small = ci_small;
	}
}
