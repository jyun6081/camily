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

    private int gorvstate;

	public int getGorvcode() {
		return gorvcode;
	}
	public void setGorvcode(int gorvcode) {
		this.gorvcode = gorvcode;
	}
	public String getGorvmid() {
		return gorvmid;
	}
	public void setGorvmid(String gorvmid) {
		this.gorvmid = gorvmid;
	}
	public String getGorvgcode() {
		return gorvgcode;
	}
	public void setGorvgcode(String gorvgcode) {
		this.gorvgcode = gorvgcode;
	}
	public String getGorvtitle() {
		return gorvtitle;
	}
	public void setGorvtitle(String gorvtitle) {
		this.gorvtitle = gorvtitle;
	}
	public String getGorvcontents() {
		return gorvcontents;
	}
	public void setGorvcontents(String gorvcontents) {
		this.gorvcontents = gorvcontents;
	}
	public String getGorvdate() {
		return gorvdate;
	}
	public void setGorvdate(String gorvdate) {
		this.gorvdate = gorvdate;
	}
	public int getGorvlike() {
		return gorvlike;
	}
	public void setGorvlike(int gorvlike) {
		this.gorvlike = gorvlike;
	}
	public String getGoimage() {
		return goimage;
	}
	public void setGoimage(String goimage) {
		this.goimage = goimage;
	}
	public String getGorvgocode() {
		return gorvgocode;
	}
	public void setGorvgocode(String gorvgocode) {
		this.gorvgocode = gorvgocode;
	}
	public String getGoname() {
		return goname;
	}
	public void setGoname(String goname) {
		this.goname = goname;
	}
	public int getGorvhits() {
		return gorvhits;
	}
	public void setGorvhits(int gorvhits) {
		this.gorvhits = gorvhits;
	}
	public int getGorvstarating() {
		return gorvstarating;
	}
	public void setGorvstarating(int gorvstarating) {
		this.gorvstarating = gorvstarating;
	}
	
}
