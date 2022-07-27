package com.camily.dto;

import lombok.Data;

@Data
public class ReplyDto {

	private int rpcode; 		// 덧글 코드 (PK)
	private String rpmid;		// 덧글 작성자 (FK)
	private String rpbocode;	// 덧글 작성한 글 코드 (FK)
	private String rpdate;		// 덧글 날짜
	private String rpcontents;	// 덧글 내용 (NOT NULL)
	private String rpstate;
	public int getRpcode() {
		return rpcode;
	}
	public void setRpcode(int rpcode) {
		this.rpcode = rpcode;
	}
	public String getRpmid() {
		return rpmid;
	}
	public void setRpmid(String rpmid) {
		this.rpmid = rpmid;
	}
	public String getRpbocode() {
		return rpbocode;
	}
	public void setRpbocode(String rpbocode) {
		this.rpbocode = rpbocode;
	}
	public String getRpdate() {
		return rpdate;
	}
	public void setRpdate(String rpdate) {
		this.rpdate = rpdate;
	}
	public String getRpcontents() {
		return rpcontents;
	}
	public void setRpcontents(String rpcontents) {
		this.rpcontents = rpcontents;
	}
	public String getRpstate() {
		return rpstate;
	}
	public void setRpstate(String rpstate) {
		this.rpstate = rpstate;
	}
	
	
	
}
