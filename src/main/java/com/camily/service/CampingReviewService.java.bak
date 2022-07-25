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

@Service
public class CampingReviewService {

	@Autowired
	private HttpSession session;

	@Autowired
	CampingReviewDao crdo;

	public int insertCampingReview(CampingReviewDto review) {
		System.out.println("CampingReviewService.insertGoodsReview()호출");

		// 글번호 조회
		int cgrvno = crdo.getMaxCgrvcode() + 1;
		System.out.println("생성된 글번호 :" + cgrvno);
		review.setCgrvcode(cgrvno);

		String loginId = (String) session.getAttribute("loginId");
		review.setCgrvmid(loginId);

		String cgrvimage = (String) session.getAttribute("image");
		review.setCgrvimage(cgrvimage);

		String cgrvrecode = (String) session.getAttribute("recode");
		review.setCgrvrecode(cgrvrecode);

		String cgrvcacode = (String) session.getAttribute("recacode");
		review.setCgrvcacode(cgrvcacode);

		System.out.println("review" + review);
		int WriteReviewResult = crdo.insertCampingReview(review);

		return WriteReviewResult;

	}

	public ModelAndView CampingReviewList() {
		System.out.println("CampingReviewService.CampingReviewList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<CampingReviewDto> campingreviewList = crdo.selectCampingReviewList();
		System.out.println(campingreviewList);

		mav.addObject("campingreviewList", campingreviewList);
		mav.setViewName("campingreview/CgReviewPage");
		return mav;
	}

}
