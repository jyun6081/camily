package com.camily.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.MemberDto;
import com.camily.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService msvc;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger LOGGER = LoggerFactory.getLogger(MemberController.class);

	// 메인 페이지 이동
	@RequestMapping(value = "/main")
	public String main() {
		System.out.println("메인 페이지 이동");
		return "main";
	}

	// 회원가입 아이디 중복 체크
	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberIdCheck(String inputId) {
		System.out.println("inputId : " + inputId);
		// memberIdCheck 서비스 호출
		String memberIdCheck = msvc.memberIdCheck(inputId);
		
		return memberIdCheck;
	}
	
	// 회원가입 이메일 인증
	@RequestMapping(value = "/mailCheck")
	public @ResponseBody String mailCheck(String email, RedirectAttributes ra) {
		System.out.println("이메일 인증 요청");

		String checkNum = msvc.emailCheck(email, ra);

		return checkNum;
	}

	// 회원가입
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto member, RedirectAttributes ra) {
		System.out.println("회원가입 요청");
		ModelAndView mav = msvc.memberJoin(member, ra);
		return mav;
	}


	// 로그인 처리
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("로그인 요청");
		ModelAndView mav = msvc.memberLogin(mid, mpw, ra);
		return mav;
	}
	
	// 로그아웃 처리
	@RequestMapping(value = "/memberLogout")
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		ModelAndView mav = msvc.memberLogout(ra);
		return mav;
	}
	
	// 내 정보 조회
	@RequestMapping(value = "/memberInfo")
	public @ResponseBody String MemberInfo(String loginId) {
		System.out.println("내정보 페이지 이동");
		System.out.println("내정보 확인 ID : " + loginId);
		String memberInfo = msvc.getMemberInfo(loginId);
		return memberInfo;
	}
	// 비밀번호 변경시 현재 비밀번호 확인
	@RequestMapping(value ="/modifyPwCheck")
	public @ResponseBody String modifyPwCheck(String loginId) {
		System.out.println("현재 비밀번호 확인 요청");
		String loginPw = msvc.getloginPw(loginId);
		return loginPw;
	}
	// 비밀번호 변경
	@RequestMapping(value ="/modifyMemberPw")
	public @ResponseBody String modifyMemberPw(String loginId, String modifyPw) {
		System.out.println("비밀번호 변경 요청");
		
		String pwUpdateResult = msvc.modifyMemberPw(loginId,modifyPw);
		return pwUpdateResult;
	}
	
	// 내 정보 변경
	@RequestMapping(value ="/modifyMemberInfo")
	public ModelAndView modifyMemberInfo(MemberDto member,RedirectAttributes ra) {
		System.out.println("내 정보 수정 요청");
		
		ModelAndView mav = msvc.modifyMemberInfo(member,ra);
		return mav;
	}
	
	// 회원탈퇴
	@RequestMapping(value ="/deleteMember")
	public ModelAndView deleteMember(String loginId,RedirectAttributes ra) {
		System.out.println("회원 탈퇴 요청");
		
		ModelAndView mav = msvc.deleteMember(loginId,ra);
		return mav;
	}
	//아이디 찾기
	@RequestMapping(value ="/getFindId")
	public @ResponseBody String getFindId(String email, String name) {
		System.out.println("아이디 찾기 요청");
		
		String findId = msvc.getFindId(email,name);
		
		return findId;
	}
	//비밀번호 찾기 비밀번호 변경
	@RequestMapping(value= "/findPwModifyPw")
	public ModelAndView findPwModifyPw(String mid, String newPw,RedirectAttributes ra) {
		System.out.println("비밀번호 찾기 비밀번호 변경 요청");
		
		ModelAndView mav = msvc.findPwModifyPw(mid, newPw, ra);
		return mav;
	}
	// 카카오 아이디 체크
	@RequestMapping(value= "/kakaoidSelect")
	public @ResponseBody String kakaoidSelect(String kakaokey){
		System.out.println("카카오 로그인 아이디 체크 요청");
		
		String kakaoMember_json = msvc.getkakaoId(kakaokey);
		
		return kakaoMember_json;
	}

}
