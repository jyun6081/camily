package com.camily.dto;

import lombok.Data;

@Data
public class CampingTypeDto {
	private String ctcacode;
	private String ctname;
	private String ctstnpeople;
	private String ctmaxpeople;
	private String ctimage;
	private String ctprice;
	public String getCtcacode() {
		return ctcacode;
	}
	public void setCtcacode(String ctcacode) {
		this.ctcacode = ctcacode;
	}
	public String getCtname() {
		return ctname;
	}
	public void setCtname(String ctname) {
		this.ctname = ctname;
	}
	public String getCtstnpeople() {
		return ctstnpeople;
	}
	public void setCtstnpeople(String ctstnpeople) {
		this.ctstnpeople = ctstnpeople;
	}
	public String getCtmaxpeople() {
		return ctmaxpeople;
	}
	public void setCtmaxpeople(String ctmaxpeople) {
		this.ctmaxpeople = ctmaxpeople;
	}
	public String getCtimage() {
		return ctimage;
	}
	public void setCtimage(String ctimage) {
		this.ctimage = ctimage;
	}
	public String getCtprice() {
		return ctprice;
	}
	public void setCtprice(String ctprice) {
		this.ctprice = ctprice;
	}
	
	
	
}

