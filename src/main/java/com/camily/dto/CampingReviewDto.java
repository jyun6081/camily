package com.camily.dto;

import lombok.Data;

@Data
public class CampingReviewDto {
	int cgrvcode;        
    String cgrvmid;     
    String cgrvcacode;
    String cgrvtitle;
    String cgrvcontents;
    String cgrvdate;
    int cgrvstate;
    String caname;
    String cgrvrecode;
    String caimage;
    String cgrvhits;
    int cgstarating;
	public int getCgrvcode() {
		return cgrvcode;
	}
	public void setCgrvcode(int cgrvcode) {
		this.cgrvcode = cgrvcode;
	}
	public String getCgrvmid() {
		return cgrvmid;
	}
	public void setCgrvmid(String cgrvmid) {
		this.cgrvmid = cgrvmid;
	}
	public String getCgrvcacode() {
		return cgrvcacode;
	}
	public void setCgrvcacode(String cgrvcacode) {
		this.cgrvcacode = cgrvcacode;
	}
	public String getCgrvtitle() {
		return cgrvtitle;
	}
	public void setCgrvtitle(String cgrvtitle) {
		this.cgrvtitle = cgrvtitle;
	}
	public String getCgrvcontents() {
		return cgrvcontents;
	}
	public void setCgrvcontents(String cgrvcontents) {
		this.cgrvcontents = cgrvcontents;
	}
	public String getCgrvdate() {
		return cgrvdate;
	}
	public void setCgrvdate(String cgrvdate) {
		this.cgrvdate = cgrvdate;
	}
	public int getCgrvlike() {
		return cgrvlike;
	}
	public void setCgrvlike(int cgrvlike) {
		this.cgrvlike = cgrvlike;
	}
	public int getCgrvstate() {
		return cgrvstate;
	}
	public void setCgrvstate(int cgrvstate) {
		this.cgrvstate = cgrvstate;
	}
	public String getRecrname() {
		return recrname;
	}
	public void setRecrname(String recrname) {
		this.recrname = recrname;
	}
	public String getCgrvrecode() {
		return cgrvrecode;
	}
	public void setCgrvrecode(String cgrvrecode) {
		this.cgrvrecode = cgrvrecode;
	}
	public String getCaimage() {
		return caimage;
	}
	public void setCaimage(String caimage) {
		this.caimage = caimage;
	}
	public String getCgrvhits() {
		return cgrvhits;
	}
	public void setCgrvhits(String cgrvhits) {
		this.cgrvhits = cgrvhits;
	}
	public int getCgstarating() {
		return cgstarating;
	}
	public void setCgstarating(int cgstarating) {
		this.cgstarating = cgstarating;
	}
    
    
    
}
