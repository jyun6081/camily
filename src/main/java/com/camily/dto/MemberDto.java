package com.camily.dto;

import lombok.Data;

@Data
public class MemberDto {
	
    private String mid;           // 아이디
    private String mpw;           // 비밀번호
    private String mname;         // 이름
    private String mtel;          // 전화번호
    private String memail;        // 이메일
    private String mbirth;        // 생년월일
    private String maddr;         // 주소
    private String mstate;        // 회원상태
    private String mrank;         // 회원등급
    
    private String mkakaokey;        // 카카오 아이디키
    private String mnaverkey;     // 네이버 아이디키
    
    private String maddress;      // 주소
    private String mpostcode;     // 우편번호
    private String mextraAddr;    // 참고항목
    private String mdetailAddr;   // 상세주소
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMstate() {
		return mstate;
	}
	public void setMstate(String mstate) {
		this.mstate = mstate;
	}
	public String getMrank() {
		return mrank;
	}
	public void setMrank(String mrank) {
		this.mrank = mrank;
	}
	public String getMkakaokey() {
		return mkakaokey;
	}
	public void setMkakaokey(String mkakaokey) {
		this.mkakaokey = mkakaokey;
	}
	public String getMnaverkey() {
		return mnaverkey;
	}
	public void setMnaverkey(String mnaverkey) {
		this.mnaverkey = mnaverkey;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMpostcode() {
		return mpostcode;
	}
	public void setMpostcode(String mpostcode) {
		this.mpostcode = mpostcode;
	}
	public String getMextraAddr() {
		return mextraAddr;
	}
	public void setMextraAddr(String mextraAddr) {
		this.mextraAddr = mextraAddr;
	}
	public String getMdetailAddr() {
		return mdetailAddr;
	}
	public void setMdetailAddr(String mdetailAddr) {
		this.mdetailAddr = mdetailAddr;
	}
    
  
}
