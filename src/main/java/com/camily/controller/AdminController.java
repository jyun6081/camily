package com.camily.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.BannerDto;
import com.camily.dto.CampingDto;
import com.camily.dto.CampingRoomDto;
import com.camily.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService advc;

	

	// 관리자 회원관리
	@RequestMapping(value = "/adminMemberList")
	public ModelAndView adminMemberList(String page) {
		System.out.println("관리자 회원목록 페이지 이동 요청");
		ModelAndView mav = advc.adminMemberList(page);
		return mav;
	}

	// 관리자 회원상태 변경
	@RequestMapping(value = "/adminModifyMemberState")
	public @ResponseBody String adminModifyMemberState(String mid, String mstate) {
		System.out.println("관리자 회원상태 변경 요청");
		String updateResult = advc.adminModifyMemberState(mid, mstate);
		return updateResult;
	}

	// 관리자 회원정보 조회
	@RequestMapping(value = "/adminGetMemberInfo")
	public @ResponseBody String adminGetMemberInfo(String mid) {
		System.out.println("관리자 회원정보 조회 요청");
		String memberInfo = advc.adminGetMemberInfo(mid);
		return memberInfo;
	}
	
	// 관리자 캠핑장 목록 페이지
	@RequestMapping(value = "/adminCamping")
	public ModelAndView adminCamping(String page) {
		System.out.println("관리자 캠핑장 목록 페이지 이동 요청");
		ModelAndView mav = advc.getCampingList(page);

		return mav;
	}

	// 관리자 캠핑장 상태 변경
	@RequestMapping(value = "/modifyCampingState")
	public @ResponseBody String modifyCampingState(String cacode, String castate) {
		System.out.println("관리자 캠핑장 상태 변경 요청");

		String updateResult = advc.modifyCampingState(cacode, castate);

		return updateResult;
	}

	// 관리자 캠핑장 상세보기
	@RequestMapping(value = "/adminCampingInfo")
	public ModelAndView adminCampingInfo(String cacode) {
		System.out.println("관리자 캠핑장 상세보기 요청");

		ModelAndView mav = advc.getCampingInfo(cacode);
		return mav;
	}

	// 관리자 캠핑장 정보수정
	@RequestMapping(value = "/modifyCampingInfo")
	public ModelAndView modifyCampingInfo(CampingDto camping, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		System.out.println("관리자 캠핑장 정보수정 요청");

		ModelAndView mav = advc.modifyCampingInfo(camping, ra);
		return mav;
	}

	// 관리자 캠핑장 등록 페이지 이동
	@RequestMapping(value = "/adminCampingInsertPage")
	public String adminCampingInsertPage() {
		System.out.println("관리자 캠핑장 등록 페이지 이동요청");

		return "admin/AdminCampingInsert";
	}

	@RequestMapping(value = "/adminCampingRegister")
	public ModelAndView adminCampingRegister(CampingDto camping, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		System.out.println("관리자 캠핑장 등록 요청");

		ModelAndView mav = advc.registerCamping(camping, ra);
		return mav;
	}
	
	// 관리자 캠핑장 객실 조회
	@RequestMapping(value="/adminCheckRoomType")
	public @ResponseBody String adminCheckRoomType(String cacode) {
		System.out.println("관리자 객실타입 조회 요청");
		String roomType = advc.getCheckRoomType(cacode);
		return roomType;
	}
	// 관리자 캠핑장 객실 상태 변경
	@RequestMapping(value="/modifyCpRoomState")
	public @ResponseBody String modifyCpRoomState(CampingRoomDto campingRoom) {
		System.out.println("관리자 객실상태 변경 요청");
		
		String modifyResult = advc.modifyCpRoomState(campingRoom);
		return modifyResult; 
	}
	// 관리자 캠핑장 객실정보 변경
	@RequestMapping(value="/modifyCpRoomInfo")
	public ModelAndView modifyCpRoomInfo(CampingRoomDto campingRoom, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("캠핑장 객실정보 변경 요청");
		
		ModelAndView mav = advc.modifyCpRoomInfo(campingRoom,ra);
		return mav;
	}
	
	
	

	@RequestMapping(value = "bannerAdd")
	public ModelAndView bannerAdd(BannerDto bannerInfo, RedirectAttributes ra) {
		System.out.println("배너 추가 기능 호출");
		System.out.println(bannerInfo);
		ModelAndView mav = advc.bannerAdd(bannerInfo, ra);
		return mav;
	}

	@RequestMapping(value = "bannerModify")
	public ModelAndView bannerModify(BannerDto bannerInfo, RedirectAttributes ra) {
		System.out.println("배너 수정 기능 호출");
		System.out.println(bannerInfo);
		ModelAndView mav = advc.bannerModify(bannerInfo, ra);
		return mav;
	}

	@RequestMapping(value = "bannerDelete")
	public ModelAndView bannerDelete(BannerDto bannerInfo, RedirectAttributes ra) {
		System.out.println("배너 삭제 기능 호출");
		System.out.println(bannerInfo);
		ModelAndView mav = advc.bannerDelete(bannerInfo, ra);
		return mav;
	}
	
	// 관리자 게시판 리스트
	@RequestMapping(value = "/adminboardList")
	public ModelAndView adminboardList(String page) {
		System.out.println("관리자 게시판리스트 기능 호출");
		ModelAndView mav = advc.adminboardList(page);
		
		return mav;
	}
	
	@RequestMapping(value = "/modifyBoardState")
	public @ResponseBody String modifyBoardState(int bocode, int bostate) {
		System.out.println("관리자 게시판 상태 변경 요청");

		String updateResult = advc.modifyBoardState(bocode, bostate);

		return updateResult;
	}
	
	@RequestMapping(value = "/adminGoodsReviewList")
	public ModelAndView adminGoodsReviewList(String page) {
		System.out.println("관리자 캠핑용품리뷰 리스트 기능 호출");
		ModelAndView mav = advc.adminGoodsReviewList(page);
		
		return mav;
	}
	
	@RequestMapping(value = "/modifyGoodsReviewState")
	public @ResponseBody String modifyGoodsReviewState(int gorvcode, int gorvstate) {
		System.out.println("관리자 캠핑용품 리뷰 상태 변경요청");
		
		String updateResult = advc.modifyGoodsReviewState(gorvcode, gorvstate);
		
		return updateResult;
	}
	
	@RequestMapping(value = "/adminCampingReviewList")
	public ModelAndView adminCampingReviewList(String Page) {
		System.out.println("관리자 캠핑장리뷰 리스트 기능 호출");
		ModelAndView mav = advc.adminCampingReviewList(Page);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/modifyCampingReviewState")
	public @ResponseBody String modifyCampingReviewState(int cgrvcode, int cgrvstate) {
		System.out.println("관리자 캠핑장 리뷰 상태 변경요청");
		
		String updateResult = advc.modifyCampingReviewState(cgrvcode, cgrvstate);
		
		return updateResult;
	}

	@RequestMapping(value = "/adminCampingQuestionPage")
	public ModelAndView adminCampingQuestionPage() {
		System.out.println("관리자 캠핑장 문의게시글 페이지 이동");
		ModelAndView mav = advc.adminCampingQuestionPage();
		return mav;
	}
	
	@RequestMapping(value = "adminCampingQuestionList")
	public @ResponseBody String adminCampingQuestionList() {
		System.out.println("캠핑장 문의글 전체보기 ajax");
		String campingQuestionList_ajax = advc.adminCampingQuestionList();
		
		return campingQuestionList_ajax;
	}
	
	@RequestMapping(value = "adminCampingAnswer")
	public @ResponseBody String adminCampingAnswer(String cwcqcode, String cwcontents) {
		System.out.println("캠핑장 문의글 답변달기 ajax");
		String campingAnswer_ajax = advc.adminCampingAnswer(cwcqcode, cwcontents);
		return campingAnswer_ajax;
	}
	
	@RequestMapping(value = "adminCampingAnswerModify")
	public @ResponseBody String adminCampingAnswerModify(String cwcode, String cwcontents) {
		System.out.println("캠핑장 문의글 답변수정 ajax");
		String campingAnswer_ajax = advc.adminCampingAnswerModify(cwcode, cwcontents);
		return campingAnswer_ajax;
	}
	
	@RequestMapping(value = "/adminGoodsQuestionPage")
	public ModelAndView adminGoodsQuestionPage() {
		System.out.println("관리자 캠핑용품 문의 게시글 페이지 이동");
		ModelAndView mav = advc.adminGoodsQuestionPage();
		
		return mav;
	}
	
	@RequestMapping(value = "/adminGoodsQuestionList")
	public @ResponseBody String adminGoodsQuestionList() {
		System.out.println("캠핑용품 문의글 전체보기 ajax");
		String goodsQuestionList_ajax = advc.adminGoodsQuestionList();
		
		return goodsQuestionList_ajax;
	}
	
	@RequestMapping(value = "/adminGoodsAnswer")
	public @ResponseBody String adminGoodsAnswer(String gwgqcode, String gwcontents) {
		System.out.println("캠핑용품 문의글 답변달기 ajax");
		String goodsAnswer_ajax = advc.adminGoodsAnswer(gwgqcode, gwcontents);
		return goodsAnswer_ajax;
	}
	
	@RequestMapping(value = "adminGoodsAnswerModify")
	public @ResponseBody String adminGoodsAnswerModify(String gwcode, String gwcontents) {
		System.out.println("캠핑용품 문의글 답변수정 ajax");
		String goodsAnswer_ajax = advc.adminGoodsAnswerModify(gwcode,gwcontents);
		return goodsAnswer_ajax;
	}
	
	@RequestMapping(value = "deleteQustion")
	public @ResponseBody String deleteQustion(String cqcode) {
		System.out.println("캠핑장 문의글 삭제 ajax");
		String result = advc.deleteQustion(cqcode);
		return result;
	}
	
	@RequestMapping(value = "adminDeleteGoodsQuestion")
	public @ResponseBody String deleteGoodsQustion(String gqcode) {
		System.out.println("캠핑용품 문의글 삭제 ajax");
		String result = advc.deleteGoodsQustion(gqcode);
		return result;
	}
	
	@RequestMapping(value = "/adminAddCpRoom")
	public ModelAndView adminAddCpRoom(CampingRoomDto campingRoom, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("관리자 객실 추가 요청");
		ModelAndView mav = advc.addCampingRoom(campingRoom,ra);
		
		return mav;
	}
	
	@RequestMapping(value = "adminReservationPage")
	public ModelAndView adminReservationPage(@Param("page") String page) {
		System.out.println("관리자 예약 관리 페이지 이동");
		ModelAndView mav = advc.adminReservationPage(page);
		return mav;
	}
	
	@RequestMapping(value = "adminReservationInfo")
	public @ResponseBody String adminReservationInfo(@Param("recode") String recode) {
		System.out.println("관리자 예약정보 상세보기 ajax");
		String reservationInfo_json = advc.adminReservationInfo(recode);
		return reservationInfo_json;
	}
	
	@RequestMapping(value = "adminCancelReservation")
	public ModelAndView adminCancelReservation(@Param("recode") String recode, RedirectAttributes ra) {
		System.out.println("관리자 예약 취소");
		ModelAndView mav = advc.adminCancelReservation(recode, ra);
		return mav;
	}
	
	@RequestMapping(value = "getRoomImage")
	public @ResponseBody String getRoomImage(String cacode, String roomSel) {
		System.out.println("캠핑장 객실 이미지 불러오기");
		String img_json = advc.getRoomImage(cacode, roomSel);
		return img_json;
	}
	
}
