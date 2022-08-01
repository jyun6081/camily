package com.camily.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BannerDto {
	private String bncode;
	private String bnimage; 
	private String bntitle; 
	private String bntitleeffect;
	private String bncontents; 
	private String bncontentseffect;
	private String bnlink; 
	private String bnlinkeffect;
	
	// java에서만 사용
	private String bntype;
	private MultipartFile bnimagefile;
	public String getBncode() {
		return bncode;
	}
	public void setBncode(String bncode) {
		this.bncode = bncode;
	}
	public String getBnimage() {
		return bnimage;
	}
	public void setBnimage(String bnimage) {
		this.bnimage = bnimage;
	}
	public String getBntitle() {
		return bntitle;
	}
	public void setBntitle(String bntitle) {
		this.bntitle = bntitle;
	}
	public String getBntitleeffect() {
		return bntitleeffect;
	}
	public void setBntitleeffect(String bntitleeffect) {
		this.bntitleeffect = bntitleeffect;
	}
	public String getBncontents() {
		return bncontents;
	}
	public void setBncontents(String bncontents) {
		this.bncontents = bncontents;
	}
	public String getBncontentseffect() {
		return bncontentseffect;
	}
	public void setBncontentseffect(String bncontentseffect) {
		this.bncontentseffect = bncontentseffect;
	}
	public String getBnlink() {
		return bnlink;
	}
	public void setBnlink(String bnlink) {
		this.bnlink = bnlink;
	}
	public String getBnlinkeffect() {
		return bnlinkeffect;
	}
	public void setBnlinkeffect(String bnlinkeffect) {
		this.bnlinkeffect = bnlinkeffect;
	}
	public String getBntype() {
		return bntype;
	}
	public void setBntype(String bntype) {
		this.bntype = bntype;
	}
	public MultipartFile getBnimagefile() {
		return bnimagefile;
	}
	public void setBnimagefile(MultipartFile bnimagefile) {
		this.bnimagefile = bnimagefile;
	}
	
	
	
}
