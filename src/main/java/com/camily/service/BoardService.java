package com.camily.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.BoardDao;
import com.camily.dao.ReplyDao;
import com.camily.dto.BoardDto;
import com.camily.dto.FAQDto;
import com.camily.dto.ReplyDto;
import com.google.gson.Gson;

@Service
public class BoardService {

	@Autowired
	private BoardDao badao;

	@Autowired
	private ReplyDao rdao;

	@Autowired
	private HttpSession session;

	// 게시판 리스트 기능
	public ModelAndView boardList() {
		System.out.println("BoardService.boardList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<BoardDto> boardList = badao.selectBoardList();

		mav.addObject("boardList", boardList);
		mav.setViewName("board/BoardList");
		return mav;
	}

	// 게시글 상세보기
	public ModelAndView boardView(int bocode) {
		System.out.println("BoardService.boardView() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판코드 : " + bocode);
		
		//조회수 증가
		
		int hitResult = badao.updateHits(bocode);
		
		BoardDto boardView = badao.selectBoardView(bocode);
		System.out.println(boardView);

		mav.addObject("boardView", boardView);
		mav.setViewName("board/BoardView");
		return mav;
	}

	// 게시글 작성
	public int insertBoard(BoardDto bo, RedirectAttributes ra) {
		System.out.println("BoardService.insertBoard()호출");

		// 글번호 조회
		int bno = badao.getMaxBocode() + 1;
		System.out.println("생성된 글번호 :" + bno);
		bo.setBocode(bno);

		String loginId = (String) session.getAttribute("loginId");
		bo.setBomid(loginId);
		System.out.println(bo);

		int insertResult = badao.insertBoard(bo);
		ra.addFlashAttribute("msg", "게시글이 등록되었습니다!");
		return insertResult;

	}

	public ModelAndView boardMoidfy(int bocode) {
		System.out.println("boardService.boardModify()호출");
		ModelAndView mav = new ModelAndView();
		BoardDto board = badao.selectBoard(bocode);
		System.out.println("board : " + board);

		mav.addObject("board", board);
		mav.setViewName("board/BoardModify");

		return mav;
	}

	public ModelAndView boardMoidfyForm(BoardDto board, RedirectAttributes ra) {
		System.out.println("boardService.boardModifyForm()호출");
		ModelAndView mav = new ModelAndView();
		int updateResult = badao.updateBoard(board);
		
		ra.addFlashAttribute("msg", "게시글이 수정되었습니다!");
		mav.setViewName("redirect:/boardView?bocode=" + board.getBocode());
		return mav;
	}

	// 게시글 삭제
	public ModelAndView boardDelete(int bocode, RedirectAttributes ra) {
		System.out.println("BoardService.boardDelete()호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 게시물 : " + bocode);
		badao.deleteBoard(bocode);

		ra.addFlashAttribute("msg", "게시글이 삭제 되었습니다!");
		mav.setViewName("redirect:/boardList");
		return mav;
	}
	
	public String replyList(int bocode) {
		System.out.println("BoardService.replyList()호출");

		ArrayList<ReplyDto> replyList = rdao.selectReplyList(bocode);
		System.out.println(replyList);
		
		Gson gson = new Gson();
		String replyList_json = gson.toJson(replyList);
		System.out.println(replyList_json);
		return replyList_json;
	}

	// 댓글 작성
	public String replyWrite(ReplyDto reply) {
		System.out.println("BoardService.replyWrite()호출");

		// 댓글 번호 조회
		int reno = rdao.getMaxRpcode() + 1;
		System.out.println("생성된 댓글번호 :" + reno);
		reply.setRpcode(reno);

		String loginId = (String) session.getAttribute("loginId");
		reply.setRpmid(loginId);
		
		int insertResult = rdao.insertReplyWrite(reply);	
		return insertResult+"";
	}
	
	public String replyDelete(int delRno) {
		System.out.println("BoardService.replyDelete() 호출");
		
		int deleteReplyResult = rdao.deleteReply(delRno);
		return deleteReplyResult+"";
	}
	
	public String replyModifyInfo(String rpcode) {
		System.out.println("BoardService.replyModifyInfo");
		System.out.println("수정할 댓글 코드 : " + rpcode);
		
		ReplyDto reInfo = rdao.selectReplyInfo(rpcode);
		
		Gson gson = new Gson();
		String reInfo_json = gson.toJson(reInfo);
		System.out.println(reInfo_json);
		return reInfo_json;
		
	}
	
	
	public String replyModify(ReplyDto reply) {
		System.out.println("BoardService.replyModify");
		System.out.println("수정할 댓글 정보");

		System.out.println(reply);
		
		int updateResult = rdao.updateReply(reply);
		System.out.println("updateResult " + updateResult);
		return updateResult+"";
	}

	// FAQ 리스트 기능
	public ModelAndView FAQList() {
		System.out.println("BoardService.FAQList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<FAQDto> FAQList = badao.selectFAQList();

		mav.addObject("FAQList", FAQList);
		mav.setViewName("faq/FAQList");
		return mav;
	}
	
	//FAQ 글작성
		public int insertFAQ(FAQDto faq, RedirectAttributes ra) {
			System.out.println("BoardService.insertFAQ()호출");

			// 글번호 조회
			int faqno = badao.getFAQMaxBocode() + 1;
			System.out.println("생성된 글번호 :" + faqno);
			faq.setFaqcode(faqno);

			String loginId = (String) session.getAttribute("loginId");
			faq.setFaqmid(loginId);

			int insertResult = badao.insertFAQ(faq);
			ra.addFlashAttribute("msg", "게시글이 등록되었습니다!");
			return insertResult;

		}

		public ModelAndView FAQView(int faqcode) {
			System.out.println("BoardService.FAQView()호출");
			
				ModelAndView mav = new ModelAndView();
				System.out.println("게시판코드 : " + faqcode);
				//조회수 증가
				int hitsResult = badao.updateFAQHits(faqcode);
				FAQDto FAQView = badao.selectFAQView(faqcode);
				System.out.println(FAQView);

				mav.addObject("FAQView", FAQView);
				mav.setViewName("faq/FAQView");
				return mav;
			
		}

		
		public ModelAndView FAQModify(int faqcode) {
			System.out.println("boardService.FAQModify()호출");
			ModelAndView mav = new ModelAndView();
			FAQDto faq = badao.selectFAQ(faqcode);
			System.out.println("faq : " + faq);

			mav.addObject("faq", faq);
			mav.setViewName("faq/FAQModify");

			return mav;
		}

		public ModelAndView faqMoidfyForm(FAQDto faq, RedirectAttributes ra) {
			System.out.println("boardService.boardModifyForm()호출");
			ModelAndView mav = new ModelAndView();
			int updateResult = badao.updateFAQ(faq);
			
			ra.addFlashAttribute("msg", "게시글이 수정되었습니다!");
			mav.setViewName("redirect:/FAQView?faqcode=" + faq.getFaqcode());
			return mav;
		}

		public ModelAndView FAQDelete(int faqcode, RedirectAttributes ra) {
			System.out.println("BoardService.FAQDelete()호출");
			ModelAndView mav = new ModelAndView();
			System.out.println("삭제할 게시물 : " + faqcode);
			int updateFAQ = badao.deleteFAQ(faqcode);

			ra.addFlashAttribute("msg", "게시글이 삭제 되었습니다!");
			mav.setViewName("redirect:/FAQList");
			return mav;
		}
}
