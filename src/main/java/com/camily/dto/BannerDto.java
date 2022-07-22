package com.camily.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BannerDto {
	private String bncode;
	private String bnimage; 
	private String bntitle; 
	private String bntitleeffect;
	private String bncontents; 
	private String bncontentseffect;
	private String bnlink; 
	private String bnlinkeffect;
	
	// java에서만 사용
	private String bntype;
	private MultipartFile bnimagefile;
}
