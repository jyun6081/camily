package com.camily.dto;

import lombok.Data;

@Data
public class CampingDetailInformationDto {
   private String dimid;
   private String dicode;
   private String diname;   
   private String diimage;  
   private String diamount;  
   private String diaddr; 
   private String diprice;
   private int ditotalprice;
   
   private String formatter;
   
   private String gstate; // 상품 활성화 비활성화 확인 
   
   
public String getFormatter() {
	return formatter;
}
public void setFormatter(String formatter) {
	this.formatter = formatter;
}
public String getDimid() {
	return dimid;
}
public void setDimid(String dimid) {
	this.dimid = dimid;
}
public String getDicode() {
	return dicode;
}
public void setDicode(String dicode) {
	this.dicode = dicode;
}
public String getDiname() {
	return diname;
}
public void setDiname(String diname) {
	this.diname = diname;
}
public String getDiimage() {
	return diimage;
}
public void setDiimage(String diimage) {
	this.diimage = diimage;
}
public String getDiamount() {
	return diamount;
}
public void setDiamount(String diamount) {
	this.diamount = diamount;
}
public String getDiaddr() {
	return diaddr;
}
public void setDiaddr(String diaddr) {
	this.diaddr = diaddr;
}
public String getDiprice() {
	return diprice;
}
public void setDiprice(String diprice) {
	this.diprice = diprice;
}
public int getDitotalprice() {
	return ditotalprice;
}
public void setDitotalprice(int ditotalprice) {
	this.ditotalprice = ditotalprice;
}
   
   
}