package com.camily.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.MemberDto;

public interface MemberDao {
    
	// 회원가입 아이디 중복체크 
	String memberIdCheck(String inputId);

	// 회원가입 
	int memberJoin(MemberDto member);
    
	// 로그인 
	MemberDto memberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	// 내 정보 조회
	MemberDto selectMemberInfo(String loginId);
    
	// 비밀번호 변경 현재 비밀번호 조회
	String selectLoginPw(String loginId);
	
    // 비밀번호 변경 
	int updateMemberPw(@Param("loginId") String loginId, @Param("modifyPw") String modifyPw);
    
	// 회원탈퇴 (mstate 99로 업데이트)
	int deleteMember(@Param("loginId") String loginId, @Param("mState") String mState);
    
	// 아이디 찾기
	String selectFindId(@Param("email") String email, @Param("name") String name);
	
    // 비밀번호 찾기(비밀번호 변경)
	int findPwModifyPw(@Param("mid") String mid,@Param("newPw") String newPw, RedirectAttributes ra);
    
	// 회원정보 수정
	int updateMemberInfo(MemberDto member);
	
    // 카카오 아이디 조회
	MemberDto selectKakaoId(String kakaokey);
	
}
