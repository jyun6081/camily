package com.camily.dto;

import lombok.Data;

@Data
public class CampingQuestionDto {

	private String cqcode;
	private String cqcacode;
	private String cqmid;
	private String cqcontents;
	private String cqdate;
	private int cqstate;
	
	// java에서만 사용
	private String caname;
}
