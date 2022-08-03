package com.camily.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.controller.MemberController;
import com.camily.dao.MemberDao;
import com.camily.dto.MemberDto;
import com.google.gson.Gson;

@Service
public class MemberService {

	@Autowired
	MemberDao mdao;

	@Autowired
	private HttpSession session;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger LOGGER = LoggerFactory.getLogger(MemberController.class);

	// 회원가입 아이디 중복 체크
	public String memberIdCheck(String inputId) {
		System.out.println("MemberService.memberIdCheck()호출");
		// memberIdCheck dao 호출
		String memberIdCheck = mdao.memberIdCheck(inputId);
		System.out.println(memberIdCheck);
		if (memberIdCheck == null) {
			return "OK";
		} else {
			return "NO";
		}

	}
    // 회원가입
	public ModelAndView memberJoin(MemberDto member, RedirectAttributes ra) {
		System.out.println("MemberService.memberJoin()호출");
		ModelAndView mav = new ModelAndView();

		// 주소
		member.setMaddr(member.getMpostcode() + "_" + member.getMaddress() + "_" + member.getMdetailAddr() + "_"
				+ member.getMextraAddr());

		int joinResult = mdao.memberJoin(member);
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		mav.setViewName("redirect:/");

		return mav;
	}
    // 이메일 인증
	public String emailCheck(String email, RedirectAttributes ra) {
		System.out.println("MemberService.emailCheck()호출");

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		LOGGER.info("이메일 데이터 전송 확인");
		LOGGER.info("인증번호 : " + email);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		LOGGER.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "campingcamily@gmail.com";
		String toMail = email;
		String title = "(CAMILY)회원가입 인증 이메일 입니다.";
		String content = "CAMILY 홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			System.out.println("메세지 전송 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메세지 전송 실패");
		}

		String num = Integer.toString(checkNum);
		return num;
	}

	// 로그인 기능
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("MemberService.memberLogin() 호출");
		System.out.println("입력한 아이디 : " + mid);
		System.out.println("입력한 비밀번호 : " + mpw);

		ModelAndView mav = new ModelAndView();

		MemberDto loginMember = mdao.memberLogin(mid, mpw);
		System.out.println(loginMember);
        
		if (loginMember != null) {
			
			String mState = loginMember.getMstate().substring(2);
			System.out.println(mState);
			if(mState.equals("99")) {
				System.out.println("탈퇴된 회원");
				ra.addFlashAttribute("msg","회원탈퇴된 계정입니다.");
				mav.setViewName("redirect:/");
			} else if(mState.equals("00")) {
				System.out.println("정지된 회원");
				ra.addFlashAttribute("msg","이용정지된 계정입니다.");
				mav.setViewName("redirect:/");
			} else if(loginMember.getMid().equals("admin") && loginMember.getMpw().equals("admin123")) {
					System.out.println("admin 접속 : " + loginMember);
					session.setAttribute("loginId", loginMember.getMid());
					ra.addFlashAttribute("msg", "관리자 아이디로 로그인 하였습니다.");
					mav.setViewName("redirect:/admin");
					System.out.println(session.getAttribute("loginId"));			
			} else {
			    session.setAttribute("loginId", loginMember.getMid());
				mav.setViewName("redirect:/");
				System.out.println(session.getAttribute("loginId"));
			}
		} else {
			System.out.println("로그인 실패");
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 로그아웃 기능
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("MemberService.memberLogout() 호출");
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		ra.addFlashAttribute("msg", "로그아웃 되었습니다.");
		mav.setViewName("redirect:/");
		return mav;
	}
	
	// 내정보 조회
	public String getMemberInfo(String loginId) {
		System.out.println("MemberService.getMemberInfo() 호출");
		
		MemberDto memberInfo = mdao.selectMemberInfo(loginId);
		
		Gson gson = new Gson();
		String memberInfo_json = gson.toJson(memberInfo);
		System.out.println(memberInfo_json);
		
		return memberInfo_json;
	}
	
	// 비밀번호 변경시 현재 비밀번호 확인
	public String getloginPw(String loginId) {
		System.out.println("MemberService.getloginPw() 호출");
		
		String loginPw = mdao.selectLoginPw(loginId);
		return loginPw;
	}
	// 비밀번호 변경
	
	public String modifyMemberPw(String loginId, String modifyPw) {
		System.out.println("MemberService.modifyMemberPw() 호출");
		System.out.println("비밀번호 변경할 id : " + loginId);
		System.out.println("비밀번호 변경 PW : " + modifyPw);
		int pwUpdateResult = mdao.updateMemberPw(loginId,modifyPw);
		session.invalidate();
		return pwUpdateResult+"";
	}
	
	// 내 정보 변경
	public ModelAndView modifyMemberInfo(MemberDto member,RedirectAttributes ra) {
		System.out.println("MemberService.findPwModifyPw() 호출");
		ModelAndView mav = new ModelAndView();
		
		member.setMaddr(member.getMpostcode() + "_" + member.getMaddress() + "_" + member.getMdetailAddr() + "_"
				+ member.getMextraAddr());
		int updateResult = mdao.updateMemberInfo(member);
		
		if(updateResult > 0) {
			ra.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 회원탈퇴
	public ModelAndView deleteMember(String loginId,RedirectAttributes ra) {
		System.out.println("MemberService.deleteMember() 호출");
		ModelAndView mav = new ModelAndView();
		MemberDto memberInfo = mdao.selectMemberInfo(loginId);
		
		String mState2 = memberInfo.getMstate().substring(0,2);
		System.out.println(mState2);
		String mState = mState2 + "99";
		int deleteResult = mdao.deleteMember(loginId,mState);
		
		session.invalidate();
		ra.addFlashAttribute("msg", "회원탈퇴 되었습니다.");
		mav.setViewName("redirect:/");
		return mav;
	}
	// 아이디 찾기
	public String getFindId(String email, String name) {
		System.out.println("MemberService.getFindId() 호출");
		System.out.println("찾을 아이디 이메일 : " + email);
		System.out.println("찾을 아이디 이름 : " + name);
		
		String findId = mdao.selectFindId(email,name);
		return findId;
	}
	// 비밀번호 찾기 비밀번호 변경
	public ModelAndView findPwModifyPw(String mid, String newPw, RedirectAttributes ra) {
		System.out.println("MemberService.findPwModifyPw() 호출");
		System.out.println("비밀번호 변경 ID : " + mid);
		System.out.println("변경할 비밀번호 : " + newPw);
		
		ModelAndView mav = new ModelAndView();
		int updateResult = mdao.findPwModifyPw(mid,newPw,ra);
		
		ra.addFlashAttribute("msg", "비밀번호가 변경되었습니다.");
		mav.setViewName("redirect:/"); 
			
		return mav;
	}
	// 카카오 아이디 체크
	public String getkakaoId(String kakaokey) {
		System.out.println("MemberService.getkakaoId() 호출");
		
		MemberDto kakaoMember = mdao.selectKakaoId(kakaokey);
		Gson gson = new Gson();
		String kakaoMember_json = gson.toJson(kakaoMember);
		return kakaoMember_json;
	}
	

}
