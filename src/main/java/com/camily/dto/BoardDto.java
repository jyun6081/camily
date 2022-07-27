package com.camily.dto;

import lombok.Data;

@Data
public class BoardDto {
	private int bocode;    	// 게시판 코드  
	private String bomid;		// 게시판 작성자 
	private int botype;			// 게시판 종류 (0: 공지게시판, 1: 건의게시판)
	private String botitle;		// 게시판 이름 
	private String bocontents;	// 게시판 글내용
	private String bodate;		// 게시판 작성일
	private int bostate;		// 게시판 상태 
	private int bohits;
	public int getBocode() {
		return bocode;
	}
	public void setBocode(int bocode) {
		this.bocode = bocode;
	}
	public String getBomid() {
		return bomid;
	}
	public void setBomid(String bomid) {
		this.bomid = bomid;
	}
	public int getBotype() {
		return botype;
	}
	public void setBotype(int botype) {
		this.botype = botype;
	}
	public String getBotitle() {
		return botitle;
	}
	public void setBotitle(String botitle) {
		this.botitle = botitle;
	}
	public String getBocontents() {
		return bocontents;
	}
	public void setBocontents(String bocontents) {
		this.bocontents = bocontents;
	}
	public String getBodate() {
		return bodate;
	}
	public void setBodate(String bodate) {
		this.bodate = bodate;
	}
	public int getBostate() {
		return bostate;
	}
	public void setBostate(int bostate) {
		this.bostate = bostate;
	}
	public int getBohits() {
		return bohits;
	}
	public void setBohits(int bohits) {
		this.bohits = bohits;
	}
	
	
	
}
