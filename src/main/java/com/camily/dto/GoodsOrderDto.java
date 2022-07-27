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
    
	
}
