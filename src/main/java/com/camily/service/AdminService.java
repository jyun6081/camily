package com.camily.service;

import java.io.File;
import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.helper.HttpConnection.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.AdminDao;
import com.camily.dao.MemberDao;
import com.camily.dto.BannerDto;
import com.camily.dto.BoardDto;
import com.camily.dto.CampingDto;
import com.camily.dto.CampingQnADto;
import com.camily.dto.CampingReviewDto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.GoodsQnADto;
import com.camily.dto.GoodsReviewDto;
import com.camily.dto.MemberDto;
import com.camily.dto.PageDto;
import com.camily.dto.ReservationDto;
import com.google.gson.Gson;

@Service
public class AdminService {
	
	@Autowired
	AdminDao addao;

	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	private String savePath = "C:\\Users\\user\\Desktop\\git\\camily\\src\\main\\webapp\\resources\\caimageUpload";
	private String bannerSavePath = "C:\\Users\\user\\Desktop\\git\\camily\\src\\main\\webapp\\resources\\bannerUpload";
	
	public ModelAndView adminMemberList(String page) {
		System.out.println("AdminService.adminMemberList() 호출");
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
        
		int memberTotalCount = addao.getMemberTotalCount();
		
		int pageCount = 10;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > memberTotalCount) {
			endRow = memberTotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<MemberDto> memberList = addao.getMemberList(startRow, endRow);
		int maxPage = (int)( Math.ceil(  (double)memberTotalCount/pageCount  ) );
		
		int startPage = (int)(( Math.ceil((double)selPage/pageNumCount)) - 1) * pageNumCount + 1;
		
		int endPage = startPage + pageNumCount - 1;
		
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		PageDto pageDto = new PageDto();
		pageDto.setPage(selPage);
		pageDto.setMaxPage(maxPage);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		
		ModelAndView mav = new ModelAndView();
		
	      mav.addObject("pageDto", pageDto);			
		  mav.addObject("memberList", memberList);
		  mav.setViewName("admin/AdminMemberList"); 
		  return mav;
		 
	}

	public String adminModifyMemberState(String mid, String mstate) {
		System.out.println("AdminService.adminModifyMemberState() 호출");
		System.out.println("mid : " + mid);
		System.out.println("mstate : " + mstate);
		
		int updateResult = addao.updateMemberState(mid, mstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public String adminGetMemberInfo(String mid) {
		System.out.println("AdminService.adminGetMemberInfo() 호출");
		MemberDto memInfo = addao.selectMemberInfo(mid);
		Gson gson = new Gson();
		String memInfo_Json = gson.toJson(memInfo);
		return memInfo_Json;
	}
	
	// 관리자 캠핑장 목록 출력
	public ModelAndView getCampingList(String page) {
		System.out.println("AdminService.getCampingList() 호출");
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
				
		int campTotalCount = addao.getCampTotalCount();
		
		int pageCount = 20;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campTotalCount) {
			endRow = campTotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<CampingDto> campingList = addao.getCampingList(startRow, endRow);
		int maxPage = (int)( Math.ceil(  (double)campTotalCount/pageCount  ) );
		
		int startPage = (int)(( Math.ceil((double)selPage/pageNumCount)) - 1) * pageNumCount + 1;
		
		int endPage = startPage + pageNumCount - 1;
		
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		PageDto pageDto = new PageDto();
		pageDto.setPage(selPage);
		pageDto.setMaxPage(maxPage);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("campingList", campingList);
		mav.addObject("pageDto", pageDto);
		mav.setViewName("admin/AdminCamping");
		return mav;
	}

    // 관리자 캠핑장 상태 변경
	public String modifyCampingState(String cacode, String castate) {
		System.out.println("AdminService.getCampingList() 호출");
		System.out.println("변경할 캠핑장 코드 : " + cacode);
		System.out.println("변경할 state  : " + castate);
		
		int updateResult = addao.updateCampingState(cacode,castate);
		return updateResult+"";
	}
    // 관리자 캠핑장 상세보기0
	public ModelAndView getCampingInfo(String cacode) {
		System.out.println("AdminService.getCampingInfo() 호출");
	    System.out.println("상세보기 캠핑장 코드 : " + cacode);
		ModelAndView mav = new ModelAndView();
		
		CampingDto campingInfo = addao.selectCampingInfo(cacode);
	    mav.addObject("campingInfo", campingInfo);
		mav.setViewName("admin/AdminCampingInfo");
		return mav;
	}
    // 관리자 캠핑장 정보수정
	public ModelAndView modifyCampingInfo(CampingDto camping, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("AdminService.modifyCampingInfo() 호출");
		ModelAndView mav = new ModelAndView();
		MultipartFile cafile = camping.getCafile();
		String caimage = "";
		
		if( !cafile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			caimage = uuid.toString()+"_"+cafile.getOriginalFilename();
			//프로필 이미지 파일 저장
			cafile.transferTo(  new File(savePath, caimage)   );
		} 
		System.out.println("caimage : " + caimage);		
		camping.setCaimage(caimage);
		 
		System.out.println(camping);
		
		int updateResult = addao.updateCampingInfo(camping);
		if(updateResult > 0 ) {
			ra.addFlashAttribute("msg","캠핑장 정보가 변경되었습니다.");
		}
		mav.setViewName("redirect:/adminCamping");
		return mav;
	}

	public ModelAndView registerCamping(CampingDto camping, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("AdminService.registerCamping() 호출");
		ModelAndView mav = new ModelAndView();
		
		//캠핑장 코드 생성
		String maxCacode = addao.getMaxCacode();
		String caCode = "";
		if(maxCacode == null) {
			caCode = "CA0001";
		}else {
			int intMaxCacode = Integer.parseInt(maxCacode.substring(2)) + 1;
			if(intMaxCacode < 10) {
				caCode = "CA000" + intMaxCacode;
			}else if(intMaxCacode < 100){
				caCode = "CA00" + intMaxCacode;
			}else if(intMaxCacode <1000) {
				caCode = "CA0" + intMaxCacode;
			}else if(intMaxCacode < 10000){
				caCode = "CA" + intMaxCacode;
			}else {
				System.out.println("범위 초과");
			}
		}
		camping.setCacode(caCode);
		System.out.println(caCode);
		
		//파일 업로드
		MultipartFile cafile = camping.getCafile();
		String caimage = "";
		if( !cafile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			caimage = uuid.toString()+"_"+cafile.getOriginalFilename();
			//프로필 이미지 파일 저장
			cafile.transferTo(  new File(savePath, caimage)   );
		} 
		camping.setCaimage(caimage);
		System.out.println(camping);
		
		int insertResult = addao.insertCamping(camping);
		ra.addFlashAttribute("msg", "캠핑장 등록에 성공하였습니다.");
		mav.setViewName("/AdminMain");
		
		return mav;
	}
	
    // 관리자 캠핑장 객실 조회
	public String getCheckRoomType(String cacode) {
		System.out.println("CampingService.getCheckRoomType() 호출");
		Gson gson = new Gson();
		ArrayList<CampingRoomDto> roomType = addao.selectCampingRommList(cacode);
		
		String roomType_json = gson.toJson(roomType);
		return roomType_json;
	}
    // 관리자 캠핑장 객실 상태 변경
	public String modifyCpRoomState(CampingRoomDto campingRoom) {
		System.out.println("CampingService.modifyCpRoomState() 호출");
		System.out.println(campingRoom);
		
		int updateResult = addao.updateCpRoomState(campingRoom);
		return updateResult+"";
	}
	// 관리자 캠핑장 객실정보 변경
	public ModelAndView modifyCpRoomInfo(CampingRoomDto campingRoom, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("CampingService.modifyCpRoomState() 호출");
		ModelAndView mav = new ModelAndView();
		
		//파일 업로드
		MultipartFile crfile = campingRoom.getCrfile();
		String crimage = "";
		if( !crfile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			crimage = uuid.toString()+"_"+crfile.getOriginalFilename();
			//프로필 이미지 파일 저장
			crfile.transferTo(  new File(savePath, crimage)   );
		} 
		campingRoom.setCrimage(crimage);
		System.out.println(campingRoom);
		
		int updateResult = addao.updateCpRoomInfo(campingRoom);
		ra.addFlashAttribute("msg", "객실 정보가 변경되었습니다.");
		mav.setViewName("redirect:/adminCamping");
		return mav;
	}

	
	
	
	

	public ModelAndView homeComponent() {
		System.out.println("AdminService.homeComponent() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId : " + loginId);
		ModelAndView mav = new ModelAndView();
		if(loginId.equals("admin")){
			ArrayList<BannerDto> bannerList = addao.getBannerList();
			mav.addObject("bannerList", bannerList);
			System.out.println(bannerList);
			mav.setViewName("AdminMain");			
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	public ModelAndView bannerAdd(BannerDto bannerInfo, RedirectAttributes ra) {
		System.out.println("AdminService.bannerAdd() 호출");
		ModelAndView mav = new ModelAndView();
		//배너 코드 생성
		String maxBncode = addao.getMaxBncode();
		String bnCode = "";
		if(maxBncode == null) {
			bnCode = "BN01";
		}else {
			int intMaxBncode = Integer.parseInt(maxBncode.substring(2)) + 1;
			System.out.println(intMaxBncode);
			if(intMaxBncode < 10){
				bnCode = "BN0" + intMaxBncode;
			}else if(intMaxBncode <100) {
				bnCode = "BN" + intMaxBncode;
			}else {
				System.out.println("범위 초과");
			}
		}
		bannerInfo.setBncode(bnCode);
		System.out.println(bnCode);
				
		//파일 업로드
		MultipartFile bnfile = bannerInfo.getBnimagefile();
		String bnimage = "";
		if( !bnfile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			bnimage = uuid.toString()+"_"+bnfile.getOriginalFilename();
			//프로필 이미지 파일 저장
			try {
				bnfile.transferTo(  new File(bannerSavePath, bnimage)   );
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		bannerInfo.setBnimage(bnimage);
		System.out.println(bannerInfo);
		int insertResult = addao.bannerAdd(bannerInfo);
		if(insertResult > 0) {
			ra.addFlashAttribute("msg", "배너가 등록되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "배너가 등록에 실패하였습니다.");
		}
		mav.setViewName("redirect:/admin");
		return mav;
	}

	public ModelAndView bannerModify(BannerDto bannerInfo, RedirectAttributes ra) {
		System.out.println("AdminService.bannerModify() 호출");
		ModelAndView mav = new ModelAndView();
		// 이미지 비교
		MultipartFile bnfile = bannerInfo.getBnimagefile();
		String bnimage = "";
		if( !bnfile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			bnimage = uuid.toString()+"_"+bnfile.getOriginalFilename();
			//프로필 이미지 파일 저장
			try {
				bnfile.transferTo(  new File(bannerSavePath, bnimage)   );
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			bannerInfo.setBnimage(bnimage);
		}
		
		int updateResult = addao.bannerModify(bannerInfo);
		if(updateResult > 0) {
			ra.addFlashAttribute("msg", "배너가 수정되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "배너 수정에 실패하였습니다.");
		}
		mav.setViewName("redirect:/admin");
		return mav;
	}

	public ModelAndView bannerDelete(BannerDto bannerInfo, RedirectAttributes ra) {
		System.out.println("AdminService.bannerDelete() 호출");
		int deleteResult = addao.bannerDelete(bannerInfo);
		ModelAndView mav = new ModelAndView();
		if(deleteResult > 0) {
			ra.addFlashAttribute("msg", "배너가 삭제되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "배너 삭제에 실패하였습니다.");
		}
		mav.setViewName("redirect:/admin");
		return mav;
	}
	
	// 관리자 게시판 리스트
	public ModelAndView adminboardList(String page) {
		System.out.println("AdminService.adminboardList");
		
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
        
		int boardTotalCount = addao.getBoardTotalCount();
		
		int pageCount = 10;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > boardTotalCount) {
			endRow = boardTotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<BoardDto> adminboardList = addao.getAdminBoardList(startRow, endRow);
		int maxPage = (int)( Math.ceil(  (double)boardTotalCount/pageCount  ) );
		
		int startPage = (int)(( Math.ceil((double)selPage/pageNumCount)) - 1) * pageNumCount + 1;
		
		int endPage = startPage + pageNumCount - 1;
		
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		PageDto pageDto = new PageDto();
		pageDto.setPage(selPage);
		pageDto.setMaxPage(maxPage);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminboardList", adminboardList);
		mav.addObject("pageDto", pageDto);
		mav.setViewName("admin/AdminBoardList");
		
		return mav;
	}

	public String modifyBoardState(int bocode, int bostate) {
		System.out.println("AdminService.getCampingList() 호출");
		System.out.println("변경할 게시판 코드 : " + bocode);
		System.out.println("변경할 게시판 state  : " + bostate);
		
		int updateResult = addao.updateBoardState(bocode,bostate);
		return updateResult+"";
	
	}

	public ModelAndView adminCampingQuestionPage() {
		System.out.println("CampingService.adminCampingQuestionPage() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<CampingQnADto> campingQnAList = addao.getCampingQnAList();
		/*
		ArrayList<CampingQnADto> newCampingQuestionList = new ArrayList<CampingQnADto>();
		for(int i = 0; i < campingQnAList.size(); i++) {
			if(campingQnAList.get(i).getCqstate() == 1) {
				newCampingQuestionList.add(campingQnAList.get(i));
			}
		}
		*/
		mav.addObject("campingQnAList", campingQnAList);
//		mav.addObject("newCampingQuestionList", newCampingQuestionList);
		mav.setViewName("admin/AdminCampingQuestionPage");
		return mav;
	}

	public ModelAndView adminGoodsReviewList(String page) {
		System.out.println("AdminService.adminGoodsReviewList()호출");
		
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
        
		int goodsReviewTotalCount = addao.getGoodsReviewTotalCount();
		
		int pageCount = 10;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > goodsReviewTotalCount) {
			endRow = goodsReviewTotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<GoodsReviewDto> adminGoodsReviewList = addao.getAdminGoodsReviewList(startRow, endRow);
		int maxPage = (int)( Math.ceil(  (double)goodsReviewTotalCount/pageCount  ) );
		
		int startPage = (int)(( Math.ceil((double)selPage/pageNumCount)) - 1) * pageNumCount + 1;
		
		int endPage = startPage + pageNumCount - 1;
		
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		PageDto pageDto = new PageDto();
		pageDto.setPage(selPage);
		pageDto.setMaxPage(maxPage);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminGoodsReviewList", adminGoodsReviewList);
		mav.addObject("pageDto", pageDto);
		mav.setViewName("admin/AdminGoodsReviewList");
		
		return mav;
	}

	public String modifyGoodsReviewState(int gorvcode, int gorvstate) {
		System.out.println("CampingService.modifyGoodsReviewState() 호출");
		System.out.println("변경할 캠핑용품 리뷰코드 : " + gorvcode);
		System.out.println("변경할 캠핑용품 리뷰 state  : " + gorvstate);
		
		int updateResult = addao.updateGoodsReviewState(gorvcode,gorvstate);
		return updateResult+"";
	}

	public ModelAndView adminCampingReviewList(String page) {
		System.out.println("AdminService.adminCampingReviewList()호출");
		
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
        
		int campingReviewTotalCount = addao.getCampingReviewTotalCount();
		
		int pageCount = 10;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campingReviewTotalCount) {
			endRow = campingReviewTotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<CampingReviewDto> adminCampingReviewList = addao.getAdminCampingReviewList(startRow, endRow);
		int maxPage = (int)( Math.ceil(  (double)campingReviewTotalCount/pageCount  ) );
		
		int startPage = (int)(( Math.ceil((double)selPage/pageNumCount)) - 1) * pageNumCount + 1;
		
		int endPage = startPage + pageNumCount - 1;
		
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		PageDto pageDto = new PageDto();
		pageDto.setPage(selPage);
		pageDto.setMaxPage(maxPage);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminCampingReviewList", adminCampingReviewList);
		mav.addObject("pageDto", pageDto);
		mav.setViewName("admin/AdminCampingReviewList");
		
		return mav;
	}

	public String modifyCampingReviewState(int cgrvcode, int cgrvstate) {
		System.out.println("CampingService.modifyCampingReviewState() 호출");
		System.out.println("변경할 캠핑용품 리뷰코드 : " + cgrvcode);
		System.out.println("변경할 캠핑용품 리뷰 state  : " + cgrvstate);
		
		int updateResult = addao.updateCampingReviewState(cgrvcode,cgrvstate);
		return updateResult+"";
	}

	public String adminCampingQuestionList() {
		System.out.println("CampingService.adminCampingQuestionList() 호출");
		ArrayList<CampingQnADto> campingQnAList = addao.getCampingQnAList();
		Gson gson = new Gson();
		String campingQnAList_ajax = gson.toJson(campingQnAList);
		return campingQnAList_ajax;
	}

	public String adminCampingAnswer(String cwcqcode, String cwcontents) {
		System.out.println("CampingService.adminCampingAnswer() 호출");
		// 캠핑장 문의 답변 코드생성
		String maxCwcode = addao.getMaxCwcode();
		String cwCode = "";
		if(maxCwcode == null) {
			cwCode = "CW0001";
		}else {
			int intMaxCwcode = Integer.parseInt(maxCwcode.substring(2)) + 1;
			if(intMaxCwcode < 10) {
				cwCode = "CW000" + intMaxCwcode;
			}else if(intMaxCwcode < 100){
				cwCode = "CW00" + intMaxCwcode;
			}else if(intMaxCwcode <1000) {
				cwCode = "CW0" + intMaxCwcode;
			}else if(intMaxCwcode < 10000){
				cwCode = "CW" + intMaxCwcode;
			}else {
				System.out.println("범위 초과");
			}
		}
		CampingQnADto campingAnswerInfo = new CampingQnADto();
		campingAnswerInfo.setCwcode(cwCode);
		campingAnswerInfo.setCwcqcode(cwcqcode);
		String cwmid = (String) session.getAttribute("loginId");
		campingAnswerInfo.setCwmid(cwmid);
		campingAnswerInfo.setCwcontents(cwcontents);
		
		System.out.println(campingAnswerInfo);
		int insertResult = addao.answerWrite(campingAnswerInfo);
		String campingAnswer_ajax = "";
		if(insertResult > 0) {
			campingAnswerInfo = addao.getCampingQnAInfo(cwcqcode);
//			addao.updateCqstate(cwcqcode);
			Gson gson = new Gson();
			campingAnswer_ajax = gson.toJson(campingAnswerInfo);
		}else {
			campingAnswer_ajax = "NG";
		}
		
		return campingAnswer_ajax;
	}

	public String adminCampingAnswerModify(String cwcode, String cwcontents) {
		System.out.println("CampingService.adminCampingAnswerModify() 호출");
		LocalDate nowDate = LocalDate.now();
		LocalTime nowTime = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String formattedNowTime = nowTime.format(formatter);
		cwcontents = "[수정됨] "+ nowDate + " " + formattedNowTime + "\r\n" + cwcontents;
		
		int updateResult = addao.campingAnswerModify(cwcode, cwcontents);
		CampingQnADto campingAnswerInfo = new CampingQnADto();
		String campingAnswer_ajax = "";
		if(updateResult > 0) {
			campingAnswerInfo = addao.getCampingAnswerInfo(cwcode);
			Gson gson = new Gson();
			campingAnswer_ajax = gson.toJson(campingAnswerInfo);
		}else {
			campingAnswer_ajax = "NG";
		}
		return campingAnswer_ajax;
	}
	
	
	public ModelAndView adminGoodsQuestionPage() {
		System.out.println("AdminService.adminGoodsQuestionPage() 호출");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<GoodsQnADto> goodsQnAList = addao.getGoodsQnAList();
		
		mav.addObject("goodsQnAList", goodsQnAList);
		mav.setViewName("admin/AdminGoodsQuestionPage");
		return mav;
	}

	public String adminGoodsQuestionList() {
		System.out.println("CampingService.adminCampingQuestionList() 호출");
		ArrayList<GoodsQnADto> goodsQnAList = addao.getGoodsQnAList();
		Gson gson = new Gson();
		String goodsQnAList_ajax = gson.toJson(goodsQnAList);
		
		return goodsQnAList_ajax;
	}

	public String adminGoodsAnswer(String gwgqcode, String gwcontents) {
		System.out.println("CampingService.adminCampingAnswer() 호출");
		// 캠핑용품 문의 답변 코드생성
		String maxGwcode = addao.getMaxGwcode();
		String gwCode = "";
		if(maxGwcode == null) {
			gwCode = "GW0001";
		}else {
			int intMaxCwcode = Integer.parseInt(maxGwcode.substring(2)) + 1;
			if(intMaxCwcode < 10) {
				gwCode = "GW000" + intMaxCwcode;
			}else if(intMaxCwcode < 100){
				gwCode = "GW00" + intMaxCwcode;
			}else if(intMaxCwcode <1000) {
				gwCode = "GW0" + intMaxCwcode;
			}else if(intMaxCwcode < 10000){
				gwCode = "GW" + intMaxCwcode;
			}else {
				System.out.println("범위 초과");
			}
		}
		GoodsQnADto goodsAnswerInfo = new GoodsQnADto();
		goodsAnswerInfo.setGwcode(gwCode);
		goodsAnswerInfo.setGwgqcode(gwgqcode);
		String gwmid = (String) session.getAttribute("loginId");
		goodsAnswerInfo.setGwmid(gwmid);
		goodsAnswerInfo.setGwcontents(gwcontents);
		
		System.out.println(goodsAnswerInfo);
		int insertResult = addao.goodsAnswerWrite(goodsAnswerInfo);
		String goodsAnswer_ajax = "";
		if(insertResult > 0) {
			goodsAnswerInfo = addao.getGoodsQnAInfo(gwgqcode);
//			addao.updateCqstate(cwcqcode);
			Gson gson = new Gson();
			goodsAnswer_ajax = gson.toJson(goodsAnswerInfo);
		}else {
			goodsAnswer_ajax = "NG";
		}
		
		return goodsAnswer_ajax;
	}

	public String adminGoodsAnswerModify(String gwcode, String gwcontents) {
		System.out.println("CampingService.adminGoodsAnswerModify() 호출");
		
		int updateResult = addao.goodsAnswerModify(gwcode, gwcontents);
		GoodsQnADto goodsAnswerInfo = new GoodsQnADto();
		String goodsAnswer_ajax = "";
		if(updateResult > 0) {
			goodsAnswerInfo = addao.getGoodsAnswerInfo(gwcode);
			Gson gson = new Gson();
			goodsAnswer_ajax = gson.toJson(goodsAnswerInfo);
		}else {
			goodsAnswer_ajax = "NG";
		}
		return goodsAnswer_ajax;
	}
	public String deleteQustion(String cqcode) {
		System.out.println("CampingService.adminCampingAnswerModify() 호출");
		int updateResult = addao.deleteQustion(cqcode);
		String result = "";
		if(updateResult > 0) {
			CampingQnADto campingQuestionInfo = addao.getCampingQnAInfo(cqcode);
			System.out.println(campingQuestionInfo);
			Gson gson = new Gson();
			result = gson.toJson(campingQuestionInfo);
		}else {
			result = "NG";
		}
		return result;
	}

	public String deleteGoodsQustion(String gqcode) {
		System.out.println("CampingService.deleteGoodsQustion() 호출");
		int updateResult = addao.deleteGoodsQustion(gqcode);
		String result = "";
		if(updateResult > 0) {
			GoodsQnADto goodsQuestionInfo = addao.getGoodsQnAInfo(gqcode);
			System.out.println(goodsQuestionInfo);
			Gson gson = new Gson();
			result = gson.toJson(goodsQuestionInfo);
		}else {
			result = "NG";
		}
		return result;
	}

	public ModelAndView addCampingRoom(CampingRoomDto campingRoom, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("CampingService.addCampingRoom() 호출");
		ModelAndView mav = new ModelAndView();
		if(campingRoom.getCrimage() == null) {
			CampingRoomDto crimage = addao.getCampingRoomImg(campingRoom.getCrcacode(), campingRoom.getCrname());
			campingRoom.setCrimage(crimage.getCrimage());
		}else {
			//파일 업로드
			MultipartFile crfile = campingRoom.getCrfile();
			String crimage = "";
			if( !crfile.isEmpty() ) {
				System.out.println("첨부파일 있음");
				UUID uuid = UUID.randomUUID();
				//1. 파일명 생성
				crimage = uuid.toString()+"_"+crfile.getOriginalFilename();
				//프로필 이미지 파일 저장
				crfile.transferTo(  new File(savePath, crimage)   );
			} 
			campingRoom.setCrimage(crimage);
		}
		
		//객실 번호 생성
		int maxCrNum = addao.selectMaxCrNum(campingRoom) + 1;
		String crNum = maxCrNum + "번";
		campingRoom.setCrnum(crNum);
		System.out.println(campingRoom);
		
		int insertResult = addao.addCampingRoom(campingRoom);
		if (insertResult > 0 ) {
			ra.addFlashAttribute("msg", "객실이 등록되었습니다.");
			mav.setViewName("redirect:/adminCampingInfo?cacode="+campingRoom.getCrcacode());
		} else {
		   ra.addFlashAttribute("msg", "객실 등록에 실패하였습니다.");
		   mav.setViewName("redirect:/adminCampingInfo?cacode="+campingRoom.getCrcacode());
		}
		return mav;
	}

	public ModelAndView adminReservationPage(String page) {
		System.out.println("CampingService.adminReservationPage() 호출");
		ModelAndView mav = new ModelAndView();
		
		/* --- */
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
		int campingQnATotalCount = addao.getReservationListTotalCount();
		System.out.println(campingQnATotalCount);
		int pageCount = 10;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campingQnATotalCount) {
			endRow = campingQnATotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);

		ArrayList<ReservationDto> reservationList = addao.getReservationList(startRow, endRow);
		int maxPage = (int)( Math.ceil(  (double)campingQnATotalCount/pageCount  ) );
		
		int startPage = (int)(( Math.ceil((double)selPage/pageNumCount)) - 1) * pageNumCount + 1;
		
		int endPage = startPage + pageNumCount - 1;
		
		if( endPage > maxPage ) {
			endPage = maxPage;
		}
		PageDto pageDto = new PageDto();
		pageDto.setPage(selPage);
		pageDto.setMaxPage(maxPage);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		/* --- */
		
		
		mav.addObject("pageDto", pageDto);
		mav.addObject("reservationList", reservationList);
		mav.setViewName("admin/AdminReservation");
		return mav;
	}

	public String adminReservationInfo(String recode) {
		System.out.println("CampingService.adminReservationInfo() 호출");
		ReservationDto reservationInfo = addao.getReservationInfo(recode);
		
		int totalPrice = 0;
		for (LocalDate date = LocalDate.of(Integer.parseInt(reservationInfo.getStartday().substring(0,4)), Integer.parseInt(reservationInfo.getStartday().substring(5,7)), Integer.parseInt(reservationInfo.getStartday().substring(8,10))); date.isBefore(LocalDate.of(Integer.parseInt(reservationInfo.getEndday().substring(0,4)), Integer.parseInt(reservationInfo.getEndday().substring(5,7)), Integer.parseInt(reservationInfo.getEndday().substring(8,10)))); date = date.plusDays(1)) {
			DayOfWeek dayOfWeek = date.getDayOfWeek();
			int dayOfWeekNumber = dayOfWeek.getValue();
			System.out.println(date);
			System.out.println(dayOfWeekNumber);
			if(dayOfWeekNumber == 5 || dayOfWeekNumber == 6) {
				totalPrice += Integer.parseInt(reservationInfo.getCrprice())  * 1.2;
			}else {
				totalPrice += Integer.parseInt(reservationInfo.getCrprice());				
			}
		}
		reservationInfo.setTotalprice(totalPrice);
		Gson gson = new Gson();
		String reservationInfo_json = gson.toJson(reservationInfo);
		return reservationInfo_json;
	}

	public ModelAndView adminCancelReservation(String recode, RedirectAttributes ra) {
		System.out.println("CampingService.adminCancelReservation() 호출");
		ModelAndView mav = new ModelAndView();
		int updateResult = addao.cancelReservation(recode);
		if(updateResult > 0) {
			ra.addFlashAttribute("msg", "예약 취소에 성공하였습니다.");
		}else {
			ra.addFlashAttribute("msg", "예약 취소에 실패하였습니다.");
		}
		mav.setViewName("redirect:/adminReservationPage");
		return mav;
	}

	public String getRoomImage(String cacode, String roomSel) {
		System.out.println("CampingService.getRoomImage() 호출");
		CampingRoomDto campingRoomImg = addao.getCampingRoomImg(cacode, roomSel);
		Gson gson = new Gson();
		String campingroomList_json = gson.toJson(campingRoomImg);
		return campingroomList_json;
	}

}