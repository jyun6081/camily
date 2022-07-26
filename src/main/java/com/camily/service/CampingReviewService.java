package com.camily.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.CampingReviewDao;
import com.camily.dto.CampingReviewDto;
import com.camily.dto.GoodsReviewDto;
import com.camily.dto.PageDto;

@Service
public class CampingReviewService {

	@Autowired
	private HttpSession session;

	@Autowired
	CampingReviewDao crdao;

	public int insertCampingReview(CampingReviewDto review) {
		System.out.println("CampingReviewService.insertGoodsReview()호출");

		// 글번호 조회
		int cgrvno = crdao.getMaxCgrvcode() + 1;
		System.out.println("생성된 글번호 :" + cgrvno);
		review.setCgrvcode(cgrvno);

		String loginId = (String) session.getAttribute("loginId");
		review.setCgrvmid(loginId);

		String cgrvrecode = (String) session.getAttribute("recode");
		review.setCgrvrecode(cgrvrecode);
		
		String cgrvcacode = (String) session.getAttribute("recacode");
		review.setCgrvcacode(cgrvcacode);

		System.out.println("review" + review);
		int WriteReviewResult = crdao.insertCampingReview(review);

		return WriteReviewResult;

	}

	public ModelAndView CampingReviewList() {
		System.out.println("CampingReviewService.CampingReviewList() 호출");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<CampingReviewDto> campingreviewList = crdao.selectCampingReviewList();
		System.out.println(campingreviewList);
		
		mav.addObject("campingreviewList", campingreviewList);
		mav.setViewName("campingreview/CgReviewPage");
		return mav;
	}

	public ModelAndView CampingReviewDetail(int cgrvcode) {
		System.out.println("CampingReviewService.CampingReviewDetail() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		//조회수 증가
		int hitsResult = crdao.updateHits(cgrvcode);
		
		CampingReviewDto CampingReview = crdao.CampingReviewDetail(cgrvcode);
		System.out.println(CampingReview);
		
		mav.addObject("CampingReview", CampingReview);
		mav.setViewName("campingreview/CgReviewDetailPage");
		
		return mav;
	}

	public ModelAndView cgReviewModify(int cgrvcode) {
		System.out.println("GoodsReviewService.cgReviewModify()호출");
		ModelAndView mav = new ModelAndView();
		CampingReviewDto CampingReview = crdao.selectCampingReview(cgrvcode);
		System.out.println("CampingReview : " + CampingReview);

		mav.addObject("CampingReview", CampingReview);
		mav.setViewName("campingreview/CgReviewModify");

		return mav;
	}

	public ModelAndView cgReviewModifyForm(CampingReviewDto cgreview, RedirectAttributes ra) {
		System.out.println("GoodsReviewService.goReviewMoidfyForm()호출");
		ModelAndView mav = new ModelAndView();
		int updateResult = crdao.updateCampingReview(cgreview);
		
		ra.addFlashAttribute("msg", "게시글이 수정되었습니다!");
		mav.setViewName("redirect:/cgreviewdetail?cgrvcode=" + cgreview.getCgrvcode());
		return mav;
	}

	public ModelAndView cgReviewDelete(int cgrvcode, RedirectAttributes ra) {
		System.out.println("GoodsReviewService.cgreviewDelete() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제할 캠핑용품 후기 게시글 : " + cgrvcode);
		crdao.deleteCampingReview(cgrvcode);
		
		ra.addFlashAttribute("msg", "게시글이 삭제되었습니다!");
		mav.setViewName("redirect:/cgreviewpage");
		return mav;
	}


}
