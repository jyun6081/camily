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
	
}
