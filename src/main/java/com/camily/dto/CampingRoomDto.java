package com.camily.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CampingRoomDto {
	private String crcacode;		// 캠핑장코드
	private String crname;			// 캠핑장 객실 이름
	private String crstnpeople;	// 캠핑장 객실 기준 인원
	private String crmaxpeople;	// 캠핑장 객실 최대 인원
	private String crimage;			// 캠핑장 객실 대표 이미지
	private String crprice;			// 캠핑장 객실 가격
	private String crstate;			// 캠핑장 객실 사용가능 유무
	private String crnum;			// 캠핑장 객실 번호
	
	private MultipartFile crfile;	
}
