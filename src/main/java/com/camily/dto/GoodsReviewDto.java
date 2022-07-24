package com.camily.dto;

import lombok.Data;

@Data
public class GoodsReviewDto {
	private int gorvcode;			// 상품 리뷰 코드
	private String gorvmid;			// 상품 리뷰 작성자
	private String gorvgcode;		// 리뷰 쓸 상품 코드
	private String gorvtitle;		// 상품 리뷰 제목
	private String gorvcontents;	// 상품 리뷰 내용
	private String gorvdate;		// 상품 리뷰 날짜
	private String goimage;
	private String gorvgocode;
	private String goname;
	private int gorvhits;
	private int gorvstarating;      // 캠핑용품 별점
	
}
