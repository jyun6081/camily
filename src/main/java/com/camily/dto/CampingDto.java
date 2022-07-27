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
	
	private MultipartFile cafile;
	
	private String RESERVECOUNT;

	private String cformatter; // 캠핑장 콤마표시
	
	
	
	
	public String getCacode() {
		return cacode;
	}

	public void setCacode(String cacode) {
		this.cacode = cacode;
	}

	public String getCaname() {
		return caname;
	}

	public void setCaname(String caname) {
		this.caname = caname;
	}

	public String getCalatitude() {
		return calatitude;
	}

	public void setCalatitude(String calatitude) {
		this.calatitude = calatitude;
	}

	public String getCalongitude() {
		return calongitude;
	}

	public void setCalongitude(String calongitude) {
		this.calongitude = calongitude;
	}

	public String getCatype() {
		return catype;
	}

	public void setCatype(String catype) {
		this.catype = catype;
	}

	public String getCacontents() {
		return cacontents;
	}

	public void setCacontents(String cacontents) {
		this.cacontents = cacontents;
	}

	public String getCalinecontents() {
		return calinecontents;
	}

	public void setCalinecontents(String calinecontents) {
		this.calinecontents = calinecontents;
	}

	public String getCainfo() {
		return cainfo;
	}

	public void setCainfo(String cainfo) {
		this.cainfo = cainfo;
	}

	public String getCaimage() {
		return caimage;
	}

	public void setCaimage(String caimage) {
		this.caimage = caimage;
	}

	public int getCastate() {
		return castate;
	}

	public void setCastate(int castate) {
		this.castate = castate;
	}

	public String getCrprice() {
		return crprice;
	}

	public void setCrprice(String crprice) {
		this.crprice = crprice;
	}

	public MultipartFile getCafile() {
		return cafile;
	}

	public void setCafile(MultipartFile cafile) {
		this.cafile = cafile;
	}

	public String getRESERVECOUNT() {
		return RESERVECOUNT;
	}

	public void setRESERVECOUNT(String rESERVECOUNT) {
		RESERVECOUNT = rESERVECOUNT;
	}
	
	
	
}
