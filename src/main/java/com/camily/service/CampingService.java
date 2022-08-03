package com.camily.service;

import java.text.DecimalFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.CampingDao;
import com.camily.dao.CampingReviewDao;
import com.camily.dto.CampingDto;
import com.camily.dto.CampingQnADto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.MemberDto;
import com.camily.dto.PageDto;
import com.camily.dto.ReservationDto;
import com.google.gson.Gson;

@Service
public class CampingService {

	@Autowired
	private CampingDao cdao;
	
	@Autowired
	private CampingReviewDao crdao;
	
	@Autowired
	private HttpSession session;
	
	// 캠핑장 데이터 입력 기능
	public void campingListInput(ArrayList<CampingDto> campingList) {
		System.out.println("CampingService.campingListInput() 호출");
		for(int i = 0; i<campingList.size(); i++) {
			String maxCacode = cdao.getMaxCacode();
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
			System.out.println(caCode);
			campingList.get(i)	.setCacode(caCode);
			cdao.campingListInput(campingList.get(i));			
		}
		
	}

	// 캠핑장 목록 기능
	public ModelAndView campingList(String page, String type, String searchKeyword, String info) {
		System.out.println("CampingService.campingList() 호출");
		int selPage = 1;
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
		String[] infoList = info.split(",");
		for(int i = 0; i < infoList.length; i++) {
			if(infoList[i].equals("elect")) {
				infoList[i] = "전기";
			}
			if(infoList[i].equals("wifi")) {
				infoList[i] = "무선인터넷";
			}
			if(infoList[i].equals("firewood")) {
				infoList[i] = "장작판매";
			}
			if(infoList[i].equals("hotwater")) {
				infoList[i] = "온수";
			}
			if(infoList[i].equals("playground")) {
				infoList[i] = "놀이터";
			}
			if(infoList[i].equals("waterpool")) {
				infoList[i] = "물놀이장";
			}
			if(infoList[i].equals("boardwalk")) {
				infoList[i] = "산책로";
			}
			if(infoList[i].equals("trampoline")) {
				infoList[i] = "트렘폴린";
			}
			if(infoList[i].equals("playfield")) {
				infoList[i] = "운동장";
			}
			if(infoList[i].equals("exercise")) {
				infoList[i] = "운동시설";
			}
			if(infoList[i].equals("mart")) {
				infoList[i] = "마트";
			}
		}		
		System.out.println(Arrays.toString(infoList));
		int campTotalCount = cdao.getCampTotalCount(type, searchKeyword, infoList);
		System.out.println(campTotalCount);
		int pageCount = 20;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campTotalCount) {
			endRow = campTotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<CampingDto> campingList = cdao.getCampingList(startRow, endRow, type, searchKeyword, infoList);
		 
		    String ditotalprice = "";
		    String divisionsum = "";		  
		    for(int z = 0; z < campingList.size(); z++) {
		      if(campingList.get(z).getCrprice() != null) {		    	  
		    	  // 상품가격 / 상품수량		 			  
		    	  ditotalprice = campingList.get(z).getCrprice();	 	  
		    	  int format = Integer.parseInt(ditotalprice); // int형태 변환
		    	  
		    	  // 상품가격 콤마표시
		    	  DecimalFormat formatter = new DecimalFormat("###,###");			
		    	  divisionsum = formatter.format(format); // 장바구니 가격모음 , 추가하기
		    	  campingList.get(z).setCformatter(divisionsum);
		      }
		    }
		
		
		
		if(campingList != null ) {
			for(int i= 0; i<campingList.size(); i++) {
				String avg_star = crdao.SelectAvgStar(campingList.get(i).getCacode());
				campingList.get(i).setCastaravg(avg_star);
				System.out.println(campingList.get(i).getCastaravg());
			}
		}
		
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
		mav.addObject("type", type);
		mav.addObject("pageDto", pageDto);
		mav.addObject("searchKeyword", searchKeyword);
		mav.setViewName("camping/CampingList");
		return mav;
	}

	// 캠핑장 상세보기 기능
	public ModelAndView campingView(String cacode) {
		System.out.println("CampingService.campingView() 호출");
		
		/* --- */
		int selPage = 1;
		/*
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
		*/
		int campingQnATotalCount = cdao.getCampingQnATotalCount();
		System.out.println(campingQnATotalCount);
		int pageCount = 5;
		int pageNumCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campingQnATotalCount) {
			endRow = campingQnATotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<CampingQnADto> campingQnAList = cdao.campingQuestionList(startRow, endRow, cacode);
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
		
		ModelAndView mav = new ModelAndView();
		CampingDto campingInfo = cdao.campingView(cacode);
		System.out.println(campingInfo);
		ArrayList<CampingRoomDto> campingRoomTypeList = cdao.campingRoomTypeList(cacode);
		ArrayList<CampingRoomDto> campingRoomList = cdao.campingRoomList(cacode);
		System.out.println(campingRoomList);
		mav.addObject("campingInfo", campingInfo);
		mav.addObject("campingRoomList", campingRoomList);
		mav.addObject("campingRoomTypeList", campingRoomTypeList);
		mav.addObject("campingQnAList", campingQnAList);
		mav.addObject("pageDto", pageDto);
		mav.setViewName("camping/CampingView");
		return mav;
	}

	// 캠핑장 가능한 객실 목록 기능
	public String checkRoomType(String cacode, String startday, String endday) {
		System.out.println("CampingService.checkRoomType() 호출");
		Gson gson = new Gson();
		ArrayList<CampingRoomDto> roomType = cdao.campingRoomList(cacode);
		ArrayList<ReservationDto> reserveType = cdao.getReserveList(cacode, startday, endday);
		for (int i = 0; i < roomType.size(); i++) {
			for (int j = 0; j < reserveType.size();j++) {
				if (roomType.get(i).getCrname().equals(reserveType.get(j).getRecrname()) && roomType.get(i).getCrnum().equals(reserveType.get(j).getRecrnum())) {
					roomType.remove(i);
				}
			}
		}
		System.out.println(roomType);
		String roomType_json = gson.toJson(roomType);
		return roomType_json;
	}
	
	// 캠핑장 에약 페이지 이동
	public ModelAndView campingReservationPage(String cacode, String startday, String endday, String roomSel, String numSel, int people) {
		System.out.println("CampingService.campingReservationPage() 호출");
		ModelAndView mav = new ModelAndView();
		CampingDto campingInfo = cdao.campingView(cacode);
		CampingRoomDto RoomInfo = new CampingRoomDto();
		RoomInfo = cdao.getRoomInfo(cacode, roomSel, numSel);
		mav.addObject("cacode", cacode);
		mav.addObject("caname", campingInfo.getCaname());
		mav.addObject("RoomInfo", RoomInfo);
		startday = startday.substring(6,10) + "-" + startday.substring(0,2) + "-" + startday.substring(3,5);
		mav.addObject("startday", startday);
		endday = endday.substring(6,10) + "-" + endday.substring(0,2) + "-" + endday.substring(3,5);
		mav.addObject("endday", endday);

		int totalPrice = totalPrice(startday, endday, RoomInfo.getCrprice());
		int totalPrice2 = totalPrice(startday, endday, RoomInfo.getCrprice()); // 콤마표시
		

		  String divisionsum = "";		  	   	  
		   	  
		    // 상품가격 콤마표시
		    DecimalFormat formatter = new DecimalFormat("###,###");			
		    divisionsum = formatter.format(totalPrice2); // 장바구니 가격모음 , 추가하기
		      		    			
		
		System.out.println(divisionsum);		
		mav.addObject("divisionsum", divisionsum);
		
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("people", people);
		mav.setViewName("camping/CampingReservation");
		return mav;
	}
	
	// 캠핑장 예약 기능
	public ModelAndView campingReservation(String recode, String recacode, String remid, String recrname, String recrnum, String startday, String endday, int repeople, String remname, String remtel, String rememail, String rerequest, String totalprice, HttpServletRequest request, RedirectAttributes ra) {
		System.out.println("CampingService.campingReservation() 호출");
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId : " + loginId);
		if(loginId == null) {
			/*
			String referer = request.getHeader("Referer");
			System.out.println(referer);
			referer = referer.split("controller")[1];
			System.out.println(referer);
			mav.setViewName("redirect:" + referer);
			*/
			ra.addFlashAttribute("msg", "로그인 후 이용 바랍니다.");
			mav.setViewName("redirect:/");
			return mav;
		}else {
			ReservationDto reservationInfo = new ReservationDto();
			
			for (LocalDate date = LocalDate.of(Integer.parseInt(startday.substring(0,4)), Integer.parseInt(startday.substring(5,7)), Integer.parseInt(startday.substring(8,10))); date.isBefore(LocalDate.of(Integer.parseInt(endday.substring(0,4)), Integer.parseInt(endday.substring(5,7)), Integer.parseInt(endday.substring(8,10)))); date = date.plusDays(1)) {
				reservationInfo.setRecode(recode);
				reservationInfo.setRecacode(recacode);
				reservationInfo.setRemid(loginId);
				reservationInfo.setRepeople(repeople);
				reservationInfo.setRecrname(recrname);
				reservationInfo.setRecrnum(recrnum);
				reservationInfo.setRemid(remid);
				reservationInfo.setRemname(remname);
				reservationInfo.setRemtel(remtel);
				reservationInfo.setRememail(rememail);
				reservationInfo.setReprice(totalprice);
				if(rerequest.length() > 0) {
					reservationInfo.setRerequest(rerequest);
				}else {				
					rerequest = "";
					reservationInfo.setRerequest(rerequest);
				}
				System.out.println(date.toString());
				
				reservationInfo.setReday(date.toString());
				System.out.println(reservationInfo);
				cdao.campingReservation(reservationInfo);
			}
			mav.setViewName("redirect:/");
			return mav;
		}
	}

	// 내정보 불러오기 >> 회원가입쪽과 비교해서 같은 함수 존재시 제거?
	public String getMyInfo(String loginId) {
		System.out.println("CampingService.campingReservation() 호출");
		MemberDto memberInfo = cdao.getMyInfo(loginId);
		Gson gson = new Gson();
		String myInfo_json = gson.toJson(memberInfo);
		return myInfo_json;
	}

	// 내 캠핑장 예약내역 목록
	public ModelAndView myReservationList() {
		System.out.println("CampingService.myReservationList() 호출");
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
			mav.setViewName("redirect:/");
		}else {
			ArrayList<ReservationDto> myReservationList = cdao.getMyReservationList(loginId);
								
			for (int i = 0; i < myReservationList.size(); i++) {
				
				String startday = cdao.getStartday(myReservationList.get(i).getRecode());
				LocalDate endday_date = cdao.getEndday(myReservationList.get(i).getRecode());
				endday_date = endday_date.plusDays(1);
				String endday = endday_date.toString();
				myReservationList.get(i).setStartday(startday);
				myReservationList.get(i).setEndday(endday);
				int totalPrice = Integer.parseInt(myReservationList.get(i).getReprice()); //totalPrice(startday, endday, myReservationList.get(i).getCrprice());
				myReservationList.get(i).setTotalprice(totalPrice);
				
			    int ditotalprice = 0;
			    String divisionsum = "";		  
	    	  
			    	  // 상품가격 / 상품수량		 			  
			    	  ditotalprice = Integer.parseInt(myReservationList.get(i).getReprice());//myReservationList.get(i).getTotalprice();	 	  
			    	  
			    	  // 상품가격 콤마표시
			    	  DecimalFormat formatter = new DecimalFormat("###,###");			
			    	  divisionsum = formatter.format(ditotalprice); // 장바구니 가격모음 , 추가하기
			    	  myReservationList.get(i).setMyformatter(divisionsum);
			}
			System.out.println(myReservationList);
			mav.addObject("myReservationList", myReservationList);
			mav.setViewName("member/MyReservationList");			
		}
		return mav;
	}
	
	// 예약금액 계산 method
	private int totalPrice(String startday, String endday, String roomPrice) {
		int totalPrice = 0;
		for (LocalDate date = LocalDate.of(Integer.parseInt(startday.substring(0,4)), Integer.parseInt(startday.substring(5,7)), Integer.parseInt(startday.substring(8,10))); date.isBefore(LocalDate.of(Integer.parseInt(endday.substring(0,4)), Integer.parseInt(endday.substring(5,7)), Integer.parseInt(endday.substring(8,10)))); date = date.plusDays(1)) {
			DayOfWeek dayOfWeek = date.getDayOfWeek();
			int dayOfWeekNumber = dayOfWeek.getValue();
			System.out.println(date);
			System.out.println(dayOfWeekNumber);
			if(dayOfWeekNumber == 5 || dayOfWeekNumber == 6) {
				totalPrice += Integer.parseInt(roomPrice)  * 1.2;
			}else {
				totalPrice += Integer.parseInt(roomPrice);				
			}
		}
		return totalPrice;
	}

	// 내 캠핑장 예약 상세보기
	public ModelAndView myReservation(String recode) {
		System.out.println("CampingService.myReservation() 호출");
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId : " + loginId);
		System.out.println("recode : " + recode);
		if(loginId == null) {
			mav.setViewName("redirect:/");
		}else {
			ReservationDto myReservationInfo = cdao.getMyReservationInfo(loginId, recode);
			
			String startday = cdao.getStartday(recode);
			LocalDate endday_date = cdao.getEndday(recode);
			endday_date = endday_date.plusDays(1);
			String endday = endday_date.toString();
			myReservationInfo.setStartday(startday);
			myReservationInfo.setEndday(endday);
			
			int totalPrice = Integer.parseInt(myReservationInfo.getReprice());//totalPrice(startday, endday, myReservationInfo.getCrprice());			
		    String divisionsum = "";		  
    	  
		    	  // 상품가격 콤마표시
		    	  DecimalFormat formatter = new DecimalFormat("###,###");			
		    	  divisionsum = formatter.format(totalPrice); // 장바구니 가격모음 , 추가하기
		    	  System.out.println("divisionsum :"+ divisionsum);
		    	  
		    	  myReservationInfo.setMyformatter(divisionsum);
				  myReservationInfo.setTotalprice(totalPrice);
			
			System.out.println(myReservationInfo);
			mav.addObject("myReservationInfo", myReservationInfo);
			mav.setViewName("member/MyReservation");
		}
		return mav;
	}

	// 캠핑장 예약자 정보 및 요청사항 수정
	public String changeReserveMsg(String recode, String remname, String remtel, String rememail, String rerequest) {
		System.out.println("CampingService.changeReserveMsg() 호출");
		int updateResult = cdao.changeReserveMsg(recode, remname, remtel, rememail, rerequest);
		String result = "";
		if(updateResult > 0) {
			result = "OK";
		}else {
			result = "NG";
		}
		return result;
	}

	// 캠핑장 예약번호 생성 기능
	public String getRecode() {
		String maxRecode = cdao.getmaxrecode();
		String reCode = "";
		if(maxRecode == null) {
			reCode = "RE001";
		}else {
			int intMaxRecode = Integer.parseInt(maxRecode.substring(2)) + 1;
			if(intMaxRecode < 10) {
				reCode = "RE00" + intMaxRecode;
			}else if(intMaxRecode < 100){
				reCode = "RE0" + intMaxRecode;
			}else if(intMaxRecode <1000) {
				reCode = "RE" + intMaxRecode;
			}else {
				System.out.println("범위 초과");
			}
		}
		return reCode;
	}

	// 캠핑장 예약 취소 기능
	public ModelAndView cancelReservation(String recode, RedirectAttributes ra) {
		System.out.println("CampingService.cancelReservation() 호출");
		ModelAndView mav = new ModelAndView();
		int updateResult = cdao.cancelReservation(recode);
		if(updateResult > 0) {
			ra.addFlashAttribute("msg", "예약이 취소되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "예약 취소에 실패하였습니다.");
		}
		mav.setViewName("redirect:/myReservationList");			
		return mav;
	}

	// 캠핑장 예약 예상금액 계산
	public String checkTotalPrice(String crprice, String startday, String endday) {
		System.out.println("CampingService.checkTotalPrice() 호출");
		startday = startday.substring(6,10) + "-" + startday.substring(0,2) + "-" + startday.substring(3,5);
		endday = endday.substring(6,10) + "-" + endday.substring(0,2) + "-" + endday.substring(3,5);
		int totalPrice = totalPrice(startday, endday, crprice);
		String result = totalPrice+"";
		System.out.println(result);
		return result;
	}

	// 캠핑장 문의글 작성
	public ModelAndView questionWrite(String cqmid, String cqcacode, String cqcontents, RedirectAttributes ra) {
		System.out.println("CampingService.questionWrite() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("cqmid : " + cqmid);
		System.out.println("cqcacode : " + cqcacode);
		System.out.println("cqcontents : " + cqcontents);
		/*
		cqcontents.replace("\r\n", "<br>");
		cqcontents.replace(" ", "&nbps;");
		*/
		
		CampingQnADto campingQustionInfo = new CampingQnADto();
		
		String maxCqcode = cdao.getMaxCqcode();
		String cqCode = "";
		if(maxCqcode == null) {
			cqCode = "CQ0001";
		}else {
			int intMaxCqcode = Integer.parseInt(maxCqcode.substring(2)) + 1;
			if(intMaxCqcode < 10) {
				cqCode = "CQ000" + intMaxCqcode;
			}else if(intMaxCqcode < 100){
				cqCode = "CQ00" + intMaxCqcode;
			}else if(intMaxCqcode <1000) {
				cqCode = "CQ0" + intMaxCqcode;
			}else if(intMaxCqcode < 10000){
				cqCode = "CQ" + intMaxCqcode;
			}else {
				System.out.println("범위 초과");
			}
		}
		campingQustionInfo.setCqcode(cqCode);
		campingQustionInfo.setCqcacode(cqcacode);
		campingQustionInfo.setCqmid(cqmid);
		campingQustionInfo.setCqcontents(cqcontents);
		
		
		int insertResult = cdao.questionWrite(campingQustionInfo);
		if(insertResult > 0) {
			ra.addFlashAttribute("msg", "문의글이 등록되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "문의글 등록에 실패하였습니다.");
		}
		mav.setViewName("redirect:/campingView?cacode="+cqcacode);
		
		return mav;
	}

	// 캠핑장 문의글 수정
	public String questionModify(String cqcode, String cqcontents) {
		System.out.println("CampingService.questionModify() 호출");
		String result_json = "";
		LocalDate nowDate = LocalDate.now();
		LocalTime nowTime = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String formattedNowTime = nowTime.format(formatter);
		cqcontents = "[수정됨] "+ nowDate + " " + formattedNowTime + "\r\n" + cqcontents;
		int updateResult = cdao.questionModify(cqcode, cqcontents);
		if(updateResult > 0) {
			CampingQnADto campingQuestionInfo = cdao.getCampingQuestionInfo(cqcode);
			Gson gson = new Gson();
			result_json = gson.toJson(campingQuestionInfo);
		}else {
			result_json = "NG";
		}
		return result_json;
	}

	// 캠핑장 문의글 삭제
	public ModelAndView questionDelete(String cqcode, String cqcacode, RedirectAttributes ra) {
		System.out.println("CampingService.questionDelete() 호출");
		ModelAndView mav = new ModelAndView();
		int updateResult = cdao.questionDelete(cqcode);
		if(updateResult > 0) {
			ra.addFlashAttribute("msg", "문의글이 삭제되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "문의글 삭제에 실패하였습니다.");
		}
		mav.setViewName("redirect:/campingView?cacode="+cqcacode);
		return mav;
	}

	public String selCampingQnAPage(String pageNum, String cacode) {
		int selPage = 1;

		if(pageNum != null) {
			selPage = Integer.parseInt(pageNum);
		}

		int campingQnATotalCount = cdao.getCampingQnATotalCount();
		System.out.println(campingQnATotalCount);
		int pageCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campingQnATotalCount) {
			endRow = campingQnATotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<CampingQnADto> campingQnAList = cdao.campingQuestionList(startRow, endRow, cacode);
		Gson gson = new Gson();
		String campingQnAList_ajax = gson.toJson(campingQnAList);
		return campingQnAList_ajax;
	}

	
}
