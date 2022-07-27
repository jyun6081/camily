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
	
	public String getRecode() {
		return recode;
	}
	public void setRecode(String recode) {
		this.recode = recode;
	}
	public String getRecacode() {
		return recacode;
	}
	public void setRecacode(String recacode) {
		this.recacode = recacode;
	}
	public String getRemid() {
		return remid;
	}
	public void setRemid(String remid) {
		this.remid = remid;
	}
	public String getRemname() {
		return remname;
	}
	public void setRemname(String remname) {
		this.remname = remname;
	}
	public String getRemtel() {
		return remtel;
	}
	public void setRemtel(String remtel) {
		this.remtel = remtel;
	}
	public String getRememail() {
		return rememail;
	}
	public void setRememail(String rememail) {
		this.rememail = rememail;
	}
	public String getRerequest() {
		return rerequest;
	}
	public void setRerequest(String rerequest) {
		this.rerequest = rerequest;
	}
	public int getRepeople() {
		return repeople;
	}
	public void setRepeople(int repeople) {
		this.repeople = repeople;
	}
	public String getRecrname() {
		return recrname;
	}
	public void setRecrname(String recrname) {
		this.recrname = recrname;
	}
	public String getRecrnum() {
		return recrnum;
	}
	public void setRecrnum(String recrnum) {
		this.recrnum = recrnum;
	}
	public String getReday() {
		return reday;
	}
	public void setReday(String reday) {
		this.reday = reday;
	}
	public String getCaname() {
		return caname;
	}
	public void setCaname(String caname) {
		this.caname = caname;
	}
	public String getCrimage() {
		return crimage;
	}
	public void setCrimage(String crimage) {
		this.crimage = crimage;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getCrprice() {
		return crprice;
	}
	public void setCrprice(String crprice) {
		this.crprice = crprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

}

