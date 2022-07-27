package com.camily.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.BoardDto;
import com.camily.dto.FAQDto;
import com.camily.dto.ReplyDto;
import com.camily.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bsvc;

	// 게시판 리스트 기능
	@RequestMapping(value = "/boardList")
	public ModelAndView boardList() {
		System.out.println("게시판 리스트 요청");
		ModelAndView mav = bsvc.boardList();
		return mav;
	}

	// 게시판 상세보기 기능
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(int bocode) {
		System.out.println("게시판 상세보기 요청");
		ModelAndView mav = bsvc.boardView(bocode);
		return mav;
	}

	// 게시글 작성 기능
	@GetMapping("write")
	public String boardWrite() {
		System.out.println("BoardController.boardwrite()호출");
		return "board/BoardWrite";
	}

	// 게시글 작성 기능
	@RequestMapping("write2")
	public String boardWrite(BoardDto bo, RedirectAttributes ra) {
		System.out.println("BoardController.boardwrite()호출");
		System.out.println(bo);
		int insertResult = bsvc.insertBoard(bo, ra);
		return "redirect:/boardView?bocode=" + bo.getBocode();
	}

	// 게시글 수정 기능
	@RequestMapping(value = "/boardModify")
	public ModelAndView boardModify(int bocode) {
		System.out.println("게시글 수정 기능 요청");
		ModelAndView mav = bsvc.boardMoidfy(bocode);
		return mav;
	}

	// 게시글 수정기능
	@RequestMapping(value = "/boardModifyForm")
	public ModelAndView boardModifyForm(BoardDto board, RedirectAttributes ra) {
		System.out.println("게시글 수정 기능 요청");
		System.out.println("board :" + board);
		ModelAndView mav = bsvc.boardMoidfyForm(board, ra);
		return mav;
	}

	// 게시글 삭제 기능
	@RequestMapping(value = "/boardDelete")
	public ModelAndView boardDelete(int bocode, RedirectAttributes ra) {
		System.out.println("게시글 삭제 요청");
		ModelAndView mav = bsvc.boardDelete(bocode, ra);
		return mav;
	}

	// 댓글리스트_ajax
	@RequestMapping(value = "/replyList")
	public @ResponseBody String replyList(int bocode) {
		System.out.println("댓글 리스트 요청");
		String replyList = bsvc.replyList(bocode);
		return replyList;
	}

	// 댓글작성_ajax
	@RequestMapping(value = "/replyWrite")
	public @ResponseBody String replyWrite(ReplyDto reply) {
		System.out.println("댓글 작성 요청");

		String insertReplyResult = bsvc.replyWrite(reply);
		return insertReplyResult;
	}

	// 댓글삭제_ajax
	@RequestMapping(value = "/replyDelete")
	public @ResponseBody String replyDelete(int delRno) {
		System.out.println("댓글 삭제요청");

		String deleteReplyResult = bsvc.replyDelete(delRno);
		return deleteReplyResult;
	}

	// 댓글수정정보_ajax
	@RequestMapping(value = "/replyModifyInfo")
	public @ResponseBody String replyModifyInfo(String rpcode) {
		System.out.println("댓글 수정 상세정보 요청");

		String replyInfo = bsvc.replyModifyInfo(rpcode);
		return replyInfo;
	}

	// 댓글수정_ajax
	@RequestMapping(value = "/replyModify")
	public @ResponseBody String replyModify(ReplyDto reply) {
		System.out.println("댓글 수정요청");
		System.out.println("reply " + reply);
		String updateResut = bsvc.replyModify(reply);
		return updateResut;
	}

	// FAQ 리스트 호출
	@RequestMapping(value = "/FAQList")
	public ModelAndView FAQList() {
		System.out.println("FAQ게시판 리스트 요청");
		ModelAndView mav = bsvc.FAQList();
		return mav;
	}

	// FAQ 작성 기능
	@GetMapping("FAQwrite")
	public String FAQWrite() {
		System.out.println("BoardController.FAQwrite()호출");
		return "faq/FAQWrite";
	}

	// FAQ 작성 기능
	@RequestMapping("FAQwrite2")
	public String FAQWrite(FAQDto faq, RedirectAttributes ra) {
		System.out.println("BoardController.FAQwrite2()호출");
		System.out.println(faq);
		int insertResult = bsvc.insertFAQ(faq, ra);
		return "redirect:/FAQView?faqcode=" + faq.getFaqcode();
	}

	// FAQ 상세보기 기능
	@RequestMapping(value = "/FAQView")
	public ModelAndView FAQView(int faqcode) {
		System.out.println("게시판 상세보기 요청");
		ModelAndView mav = bsvc.FAQView(faqcode);
		return mav;
	}

	// FAQ게시판 글 수정 페이지 이동
	@RequestMapping(value = "/FAQModify")
	public ModelAndView FAQModify(int faqcode) {
		System.out.println("FAQ 수정 페이지 이동 요청");
		ModelAndView mav = bsvc.FAQModify(faqcode);
		return mav;
	}

	// FAQ 게시판 글 수정 기능
	@RequestMapping(value = "/FAQModifyForm")
	public ModelAndView FAQModifyForm(FAQDto faq, RedirectAttributes ra) {
		System.out.println("FAQ 글 수정 기능 요청");
		System.out.println("board :" + faq);
		ModelAndView mav = bsvc.faqMoidfyForm(faq, ra);
		return mav;
	}

	// FAQ 게시판 삭제 기능
	@RequestMapping(value = "/FAQDelete")
	public ModelAndView FAQDelete(int faqcode, RedirectAttributes ra) {
		System.out.println("FAQ 글 삭제 요청");
		ModelAndView mav = bsvc.FAQDelete(faqcode, ra);
		return mav;
	}

}
