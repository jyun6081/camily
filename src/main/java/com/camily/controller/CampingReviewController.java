package com.camily.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.CampingReviewDao;
import com.camily.dto.CampingReviewDto;
import com.camily.service.CampingReviewService;

@Controller
public class CampingReviewController {

	@Autowired
	private HttpSession session;

	@Autowired
	private CampingReviewService crsv;

	@RequestMapping(value = "/cgreviewpage")
	public ModelAndView cgreviewpage() {
		
			System.out.println("캠핑용품 리뷰 페이지 이동 요청");
			ModelAndView mav = crsv.CampingReviewList();

			return mav;
			
	}

	@GetMapping(value = "/cpWrite")
	public String cpWrite(String recacode,String recode) {
		System.out.println("캠핑장 리뷰 글쓰기 페이지 이동요청");

		session.setAttribute("recacode", recacode);
		session.setAttribute("recode", recode);

		return "campingreview/CgReviewWrite";
	}

	@RequestMapping("cpWrite2")
	public String cgWrite2(CampingReviewDto review, RedirectAttributes ra) {
		System.out.println("CampingReviewController.cpWrite2()호출");
		System.out.println("review :" + review);
		
		int insertResult = crsv.insertCampingReview(review);
		ra.addFlashAttribute("msg", "게시글이 등록되었습니다!");
	
		return "redirect:/cgreviewpage";
	}
	
	//캠핑장 후기 상세페이지 이동
	@RequestMapping("cgreviewdetail")
	public ModelAndView cgreviewdetail(int cgrvcode) {
		System.out.println("CampingReviewController.cgreviewdetail()호출");
		System.out.println("cgrvcode :" + cgrvcode);
		
		ModelAndView mav = crsv.CampingReviewDetail(cgrvcode);
	
		return mav;
	}
	
	
	@RequestMapping(value = "/cgReviewModify")
	public ModelAndView cgReviewModify(int cgrvcode) {
		System.out.println("게시글 수정 기능 요청");
		ModelAndView mav = crsv.cgReviewModify(cgrvcode);
		return mav;
	}
	
	// 캠핑장 후기 수정
	@RequestMapping(value = "/cgReviewModifyForm")
	public ModelAndView cgReviewModifyForm(CampingReviewDto cgreview, RedirectAttributes ra) {
		System.out.println("게시글 수정 기능 요청");
		System.out.println("cgreview :" + cgreview);
		ModelAndView mav = crsv.cgReviewModifyForm(cgreview,ra);
		return mav;
	}

	// 캠핑용품 후기 게시글 삭제
	@RequestMapping(value = "/cgReviewDelete")
	public ModelAndView cgReviewDelete(int cgrvcode, RedirectAttributes ra) {
		System.out.println("캠핑용품 후기 게시물 삭제 요청");
		ModelAndView mav = crsv.cgReviewDelete(cgrvcode, ra);

		return mav;
	}
	

}
