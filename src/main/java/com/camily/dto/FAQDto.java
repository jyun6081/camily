package com.camily.dto;

import lombok.Data;

@Data
public class FAQDto {
	int faqcode;
    String faqmid;  
    int faqtype;
    String faqtitle;     
    String faqcontents;
    int faqstate;
    String faqdate;
    int faqhits;
	public int getFaqcode() {
		return faqcode;
	}
	public void setFaqcode(int faqcode) {
		this.faqcode = faqcode;
	}
	public String getFaqmid() {
		return faqmid;
	}
	public void setFaqmid(String faqmid) {
		this.faqmid = faqmid;
	}
	public int getFaqtype() {
		return faqtype;
	}
	public void setFaqtype(int faqtype) {
		this.faqtype = faqtype;
	}
	public String getFaqtitle() {
		return faqtitle;
	}
	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}
	public String getFaqcontents() {
		return faqcontents;
	}
	public void setFaqcontents(String faqcontents) {
		this.faqcontents = faqcontents;
	}
	public int getFaqstate() {
		return faqstate;
	}
	public void setFaqstate(int faqstate) {
		this.faqstate = faqstate;
	}
	public String getFaqdate() {
		return faqdate;
	}
	public void setFaqdate(String faqdate) {
		this.faqdate = faqdate;
	}
	public int getFaqhits() {
		return faqhits;
	}
	public void setFaqhits(int faqhits) {
		this.faqhits = faqhits;
	}
    
    
}
