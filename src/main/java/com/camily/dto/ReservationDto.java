package com.camily.dto;

import lombok.Data;

@Data
public class ReservationDto {

	private String recode;
	private String recacode;
	private String remid;
	private String remname;
	private String remtel;
	private String rememail;
	private String rerequest;
	private int repeople;
	private String recrname;
	private String recrnum;
	private String reday;
	
	// java에서만 사용
	private String caname;
	private String crimage;
	private String startday;
	private String endday;
	private String crprice;
	private int totalprice;

	private String myformatter; // 예약내역 가격 콤마
	
}

