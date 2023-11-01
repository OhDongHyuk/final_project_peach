package kr.ph.peach.pagination;

import lombok.Data;

@Data
public class MemberCriteria extends Criteria{
	int me_st_num;
	int me_ci_num;
	int me_num;
	String me_au;
	String me_name;
	String me_nick;
}
