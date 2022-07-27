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
	public String getCrcacode() {
		return crcacode;
	}
	public void setCrcacode(String crcacode) {
		this.crcacode = crcacode;
	}
	public String getCrname() {
		return crname;
	}
	public void setCrname(String crname) {
		this.crname = crname;
	}
	public String getCrstnpeople() {
		return crstnpeople;
	}
	public void setCrstnpeople(String crstnpeople) {
		this.crstnpeople = crstnpeople;
	}
	public String getCrmaxpeople() {
		return crmaxpeople;
	}
	public void setCrmaxpeople(String crmaxpeople) {
		this.crmaxpeople = crmaxpeople;
	}
	public String getCrimage() {
		return crimage;
	}
	public void setCrimage(String crimage) {
		this.crimage = crimage;
	}
	public String getCrprice() {
		return crprice;
	}
	public void setCrprice(String crprice) {
		this.crprice = crprice;
	}
	public String getCrstate() {
		return crstate;
	}
	public void setCrstate(String crstate) {
		this.crstate = crstate;
	}
	public String getCrnum() {
		return crnum;
	}
	public void setCrnum(String crnum) {
		this.crnum = crnum;
	}
	
	
}
