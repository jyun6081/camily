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
    
  
}
