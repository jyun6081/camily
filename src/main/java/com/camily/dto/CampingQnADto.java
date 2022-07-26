package com.camily.dto;

import lombok.Data;

@Data
public class CampingQnADto {

	// campingQustion
	private String cqcode;
	private String cqcacode;
	private String cqmid;
	private String cqcontents;
	private String cqdate;
	private int cqstate;
	
	// java에서만 사용
	private String caname;
	
	// campingAnswer
	private String cwcode;
	private String cwcqcode;
	private String cwmid;
	private String cwcontents;
	private String cwdate;
	
}
