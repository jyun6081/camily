package com.camily.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CampingDto {

	private String cacode;
	private String caname;
	private String calatitude;
	private String calongitude;
	private String catype;
	private String cacontents;
	private String calinecontents;
	private String cainfo;
	private String caimage;
	private int castate;
	
	private String crprice;
	private String castaravg;
	
	private MultipartFile cafile;
	
	private String RESERVECOUNT;

	private String cformatter; // 캠핑장 콤마표시
   
	// java에서만 사용 
	private String formatprice;
}
