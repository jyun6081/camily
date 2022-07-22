package com.camily.dto;

import lombok.Data;

@Data
public class CampingShopDto {
  
	private String gcode; 
	private String gcompanyname; 
	private String gprice; 
	private String gcategory; 
	private String gcontents; 
	private String gimage; 
	private String gname;
	private String gsideimage;
	private String gbackimage;
	private String gdetailimage;
	
	private String gamount; // 내가 고른 상품 갯수

	public String getGcode() {
		return gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public String getGcompanyname() {
		return gcompanyname;
	}

	public void setGcompanyname(String gcompanyname) {
		this.gcompanyname = gcompanyname;
	}

	public String getGprice() {
		return gprice;
	}

	public void setGprice(String gprice) {
		this.gprice = gprice;
	}

	public String getGcategory() {
		return gcategory;
	}

	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}

	public String getGcontents() {
		return gcontents;
	}

	public void setGcontents(String gcontents) {
		this.gcontents = gcontents;
	}

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGsideimage() {
		return gsideimage;
	}

	public void setGsideimage(String gsideimage) {
		this.gsideimage = gsideimage;
	}

	public String getGbackimage() {
		return gbackimage;
	}

	public void setGbackimage(String gbackimage) {
		this.gbackimage = gbackimage;
	}

	public String getGdetailimage() {
		return gdetailimage;
	}

	public void setGdetailimage(String gdetailimage) {
		this.gdetailimage = gdetailimage;
	}

	public String getGamount() {
		return gamount;
	}

	public void setGamount(String gamount) {
		this.gamount = gamount;
	}
	
	
}
