package com.camily.dto;

import lombok.Data;

@Data
public class GoodsQnADto {
	//질문
	private String gqcode;
	private String gqgcode;
	private String gqmid;
	private String gqcontents;
	private String gqdate;
	private int gqstate;
	//답변
	private String gwcode;
	private String gwgqcode;
	private String gwmid;
	private String gwcontents;
	private String gwdate;
	
	private String gname;
	


}
