package com.camily.dto;

import lombok.Data;

@Data
public class CampingQuestionDto {

	private String cqcode;
	private String cqcacode;
	private String cqmid;
	private String cqcontents;
	private String cqdate;
	private int cqstate;
	public String getCqcode() {
		return cqcode;
	}
	public void setCqcode(String cqcode) {
		this.cqcode = cqcode;
	}
	public String getCqcacode() {
		return cqcacode;
	}
	public void setCqcacode(String cqcacode) {
		this.cqcacode = cqcacode;
	}
	public String getCqmid() {
		return cqmid;
	}
	public void setCqmid(String cqmid) {
		this.cqmid = cqmid;
	}
	public String getCqcontents() {
		return cqcontents;
	}
	public void setCqcontents(String cqcontents) {
		this.cqcontents = cqcontents;
	}
	public String getCqdate() {
		return cqdate;
	}
	public void setCqdate(String cqdate) {
		this.cqdate = cqdate;
	}
	public int getCqstate() {
		return cqstate;
	}
	public void setCqstate(int cqstate) {
		this.cqstate = cqstate;
	}
	
	
	
}

