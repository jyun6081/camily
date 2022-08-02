package com.camily.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsDto {

	private String gcode; // 상품코드
	private String gcompanyname; // 상품회사이름
	private String gprice; // 상품가격
	private String gcategory; // 상품카테고리
	private String gcontents; // 상품정보
	private String gimage; // 상품이미지
	private String gname; // 상품이름
	private String gsideimage; // 상품사이드이미지
	private String gbackimage; // 상품백이미지
	private String gdetailimage; // 상품상세정보이미지
    private String gdate; // 상품 등록 시간 
    private String gstaravg;
	
	private MultipartFile gimagefile; //프로필 파일
	private MultipartFile gsideimagefile; //프로필 파일
	private MultipartFile gbackimagefile; //프로필 파일
	private MultipartFile gdetailimagefile; //프로필 파일
	
	
	
	private String gamount; // 내가 고른 상품 갯수
    private String price2; // ajax 장바구니 담김 가격들 모음
    private String gstate; // 상품의 상태값  
    private String gformatter; // 상품의 총합 콤마
        	
}
