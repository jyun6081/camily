package com.camily.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.GoodsReviewDao;
import com.camily.dto.BoardDto;
import com.camily.dto.GoodsReviewDto;

@Service
public class GoodsReviewService {
	
	@Autowired
	private GoodsReviewDao grdao;
	
	@Autowired
	private HttpSession session;
	
	// 캠핑용품 후기 리스트
	public ModelAndView goreviewpage() {
		System.out.println("GoodsReviewService.goreviewpage() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<GoodsReviewDto> goreviewpage = grdao.selectGoodsReviewList();
		System.out.println(goreviewpage);
		
		mav.addObject("goodsReviewList", goreviewpage);
		mav.setViewName("goodsreview/GoReviewPage");
		return mav;
	}
	
	// 캠핑용품 후기 상세보기
	public ModelAndView goreviewdetailpage(int gorvcode) {
		System.out.println("GoodsReviewService.goreviewdetailpage() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("상품리뷰 코드 : " + gorvcode);
		
		//조회수 증가
		int hitsResult = grdao.updateHits(gorvcode);
		
		GoodsReviewDto goreviewdetailpage = grdao.selectGoodsReviewDetail(gorvcode);
		System.out.println(goreviewdetailpage);
		
		mav.addObject("gorvDetail", goreviewdetailpage);
		mav.setViewName("goodsreview/GoReviewDetailPage");
		return mav;
	}

	public int insertGoodsReview(GoodsReviewDto grdo, RedirectAttributes ra) {
		System.out.println("GoodsReviewService.insertGoodsReview()호출");
		
		//글번호 조회
		int gno = grdao.getMaxCgcode() + 1;
		System.out.println("생성된 글번호 :" + gno);		
		grdo.setGorvcode(gno);

		String loginId = (String) session.getAttribute("loginId");
		grdo.setGorvmid(loginId);
		
		String gorvimage = (String)session.getAttribute("cgimage");
		grdo.setGoimage(gorvimage);
		
		String gogcode = (String)session.getAttribute("cggcode");
		grdo.setGorvgcode(gogcode);
		
		String gocode = (String)session.getAttribute("gocode");
		grdo.setGorvgocode(gocode);
		
		System.out.println("grdo"+grdo);
		int insertResult = grdao.insertGoodsReview(grdo);
		ra.addFlashAttribute("msg","게시글이 등록되었습니다!");
		return insertResult;
		
	}
	
	public ModelAndView goreviewModify(int gorvcode) {
		System.out.println("GoodsReviewService.goReviewModify()호출");
		ModelAndView mav = new ModelAndView();
		GoodsReviewDto goodsReview = grdao.selectGoodsReview(gorvcode);
		System.out.println("goodsReview : " + goodsReview);

		mav.addObject("goodsReview", goodsReview);
		mav.setViewName("goodsreview/GoReviewModify");

		return mav;
	}

	public ModelAndView goreviewModifyForm(GoodsReviewDto goreview, RedirectAttributes ra) {
		System.out.println("GoodsReviewService.goReviewMoidfyForm()호출");
		ModelAndView mav = new ModelAndView();
		int updateResult = grdao.updateGoodsReview(goreview);
		
		ra.addFlashAttribute("msg", "게시글이 수정되었습니다!");
		mav.setViewName("redirect:/goreviewdetailpage?gorvcode=" + goreview.getGorvcode());
		return mav;
	}

	public ModelAndView goreviewDelete(int gorvcode, RedirectAttributes ra) {
		System.out.println("GoodsReviewService.cgreviewDelete() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 캠핑용품 후기 게시글 : " + gorvcode);
		grdao.deleteGoodsReview(gorvcode);
		
		ra.addFlashAttribute("msg", "게시글이 삭제되었습니다!");
		mav.setViewName("redirect:/goreviewpage");
		return mav;
	}
}
