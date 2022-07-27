package com.camily.dto;

import lombok.Data;

@Data
public class GoodsOrderDto {

	private String gocode;    // 주문 코드    o
	private String gomid;     // 주문자 아이디 o
	private String gomaddr;   // 주문 주소    o
	private String gogcode;   // 주문 상품 코드 o
	private String goamount;  // 주문 수량 o
	private String goprice;   // 주문 상품 가격 o
	private String goname;    // 상품 이름   o
	private String goimage;   // 상품 이미지 o
	
	private String gostate;   // 상품 상태
    private String godate;    // 주문 일자 o  

    private String divisionsum; // 원래 가격 찾기 

    private String gocancel; // 상품 취소 사유
    
    private String goformatter; // 상품 총가격 콤마 
    private String goformatter2; // 상품 총가격 관리자 페이지 콤마
    
    
    
	public String getGoformatter2() {
		return goformatter2;
	}

	public void setGoformatter2(String goformatter2) {
		this.goformatter2 = goformatter2;
	}

	public String getGoformatter() {
		return goformatter;
	}

	public void setGoformatter(String goformatter) {
		this.goformatter = goformatter;
	}

	public String getDivisionsum() {
		return divisionsum;
	}

	public void setDivisionsum(String divisionsum) {
		this.divisionsum = divisionsum;
	}

	public String getGocancel() {
		return gocancel;
	}

	public void setGocancel(String gocancel) {
		this.gocancel = gocancel;
	}

	public String getGodate() {
		return godate;
	}

	public void setGodate(String godate) {
		this.godate = godate;
	}

	public String getGocode() {
		return gocode;
	}

	public void setGocode(String gocode) {
		this.gocode = gocode;
	}

	public String getGomid() {
		return gomid;
	}

	public void setGomid(String gomid) {
		this.gomid = gomid;
	}

	public String getGomaddr() {
		return gomaddr;
	}

	public void setGomaddr(String gomaddr) {
		this.gomaddr = gomaddr;
	}

	public String getGogcode() {
		return gogcode;
	}

	public void setGogcode(String gogcode) {
		this.gogcode = gogcode;
	}

	public String getGoamount() {
		return goamount;
	}

	public void setGoamount(String goamount) {
		this.goamount = goamount;
	}

	public String getGoprice() {
		return goprice;
	}

	public void setGoprice(String goprice) {
		this.goprice = goprice;
	}

	public String getGoname() {
		return goname;
	}

	public void setGoname(String goname) {
		this.goname = goname;
	}

	public String getGoimage() {
		return goimage;
	}

	public void setGoimage(String goimage) {
		this.goimage = goimage;
	}

	public String getGostate() {
		return gostate;
	}

	public void setGostate(String gostate) {
		this.gostate = gostate;
	}
	
	
	
}
