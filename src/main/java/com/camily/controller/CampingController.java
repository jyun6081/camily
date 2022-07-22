package com.camily.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.camily.dto.CampingDto;
import com.camily.dto.ItemDto;
import com.camily.service.CampingService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class CampingController {

	@Autowired
	private CampingService csvc;
	
	@Autowired
	private HttpSession session;

	// 캠핑장 목록 페이지 이동
	@RequestMapping(value = "campingList")
	public ModelAndView campingList(@Param("page") String page, @RequestParam(value = "type", defaultValue = "") String type, @RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword) {
		System.out.println("캠핑장 목록 페이지 이동");
		System.out.println("type : " + type);
		System.out.println("searchKeyword : " + searchKeyword);
		ModelAndView mav = csvc.campingList(page, type, searchKeyword);
		return mav;
	}

	@RequestMapping(value = "campingView")
	public ModelAndView campingView(@Param("cacode") String cacode) {
		System.out.println("캠핑장 상세 페이지 이동");
		ModelAndView mav = csvc.campingView(cacode);
		System.out.println("cacode : " + cacode);
		return mav;
	}

	@RequestMapping(value = "campingListInput")
	public String campingListInput() throws IOException {
		boolean run = true;
		ArrayList<CampingDto> campingList = new ArrayList<CampingDto>();
		CampingDto campingInfo = null;
		int count = 1;
		int repeatNum = 0;
		int repeatCount = 0;
		while(run) {
			repeatCount++;
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=HHqHDol0pIFgKcLgUkwyftEkn9KdQG%2B9Dk1rBIaCnh6pH1zG4a3salpnlKSQdZisTR9vUvkb1HUQGsE26bdytw%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(repeatCount + "", "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
			urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*&_type=json*/
			System.out.println(urlBuilder.toString());
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
//			System.out.println(sb.toString());
			//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
			
			JsonObject jobj = (JsonObject) JsonParser.parseString(sb.toString());
			System.out.println("총합 캠핑장 수 : "+jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount").getAsInt());	// 총합 캠핑장 개수
			if(repeatCount == 1) {
				repeatNum = jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount").getAsInt() / 100;
				if(jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("totalCount").getAsInt() % 100 != 0) {
					repeatNum++;
				}				
			}
//		System.out.println(jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject());
			JsonArray jobj_items = jobj.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item").getAsJsonArray();	// 캠핑장 10개 object
			System.out.println("한 페이지에 존재하는 수 : " + jobj_items.size());
			for(int i = 0; i < jobj_items.size(); i++) {
				if(jobj_items.get(i).getAsJsonObject().get("induty") != null && jobj_items.get(i).getAsJsonObject().get("intro") != null && jobj_items.get(i).getAsJsonObject().get("lineIntro") != null && jobj_items.get(i).getAsJsonObject().get("sbrsCl") !=null && jobj_items.get(i).getAsJsonObject().get("firstImageUrl") != null) {
					campingInfo = new CampingDto();
					System.out.println("["+count+"] 번째");
					// 캠핑장 이름
					System.out.println("캠핑장 이름 : " + jobj_items.get(i).getAsJsonObject().get("facltNm").getAsString());			
					campingInfo.setCaname(jobj_items.get(i).getAsJsonObject().get("facltNm").getAsString());
					// 캠핑장 위도
					System.out.println("캠핑장 위도 : " + jobj_items.get(i).getAsJsonObject().get("mapY").getAsString());			
					campingInfo.setCalatitude(jobj_items.get(i).getAsJsonObject().get("mapY").getAsString());
					// 캠핑장 경도
					System.out.println("캠핑장 경도 : " + jobj_items.get(i).getAsJsonObject().get("mapX").getAsString());			
					campingInfo.setCalongitude(jobj_items.get(i).getAsJsonObject().get("mapX").getAsString());
					// 캠핑장 타입
					System.out.println("캠핑장 타입 : " + jobj_items.get(i).getAsJsonObject().get("induty").getAsString());			
					campingInfo.setCatype(jobj_items.get(i).getAsJsonObject().get("induty").getAsString());
					// 캠핑장 소개	
					System.out.println("캠핑장 소개 : " + jobj_items.get(i).getAsJsonObject().get("intro").getAsString());				
					campingInfo.setCacontents(jobj_items.get(i).getAsJsonObject().get("intro").getAsString());
					// 캠핑장 한줄소개
					System.out.println("캠핑장 한 줄 소개 : "+ jobj_items.get(i).getAsJsonObject().get("lineIntro").getAsString());	
					campingInfo.setCalinecontents(jobj_items.get(i).getAsJsonObject().get("lineIntro").getAsString());
					// 캠핑장 부대시설정보
					System.out.println("캠핑장 부대시설정보 : " + jobj_items.get(i).getAsJsonObject().get("sbrsCl").getAsString());		
					campingInfo.setCainfo(jobj_items.get(i).getAsJsonObject().get("sbrsCl").getAsString());
					// 캠핑장 사진	
					System.out.println("캠핑장 사진 : " + jobj_items.get(i).getAsJsonObject().get("firstImageUrl").getAsString());		
					campingInfo.setCaimage(jobj_items.get(i).getAsJsonObject().get("firstImageUrl").getAsString());
					System.out.println("==================================================");
					count++;
					campingList.add(campingInfo);
				}
			}	
			if(repeatNum == repeatCount) {
				run = false;
			}
		}
		System.out.println("campingList.size() : " + campingList.size());
		
		csvc.campingListInput(campingList);
		
		return "camping/CampingList";
	}

	@RequestMapping(value = "campingReservation")
	public ModelAndView campingReservation(String recode, String recacode, String remid, String recrname,
			String recrnum, String startday, String endday, int repeople, String remname, String remtel,
			String rememail, String rerequest) {
		System.out.println("캠핑 예약호출");
		System.out.println("recode : " + recode);
		System.out.println("recacode : " + recacode);
		System.out.println("remid : " + remid);
		System.out.println("recrname : " + recrname);
		System.out.println("recrnum : " + recrnum);
		System.out.println("startday : " + startday);
		System.out.println("endday : " + endday);
		System.out.println("repeople : " + repeople);
		System.out.println("remtel : " + remtel);
		System.out.println("rememail : " + rememail);
		System.out.println("rerequest : " + rerequest);
		ModelAndView mav = csvc.campingReservation(recode, recacode, remid, recrname, recrnum, startday, endday,
				repeople, remname, remtel, rememail, rerequest);
		return mav;
	}

	@RequestMapping(value = "campingReservationPage")
	public ModelAndView campingReservationPage(String cacode, String startday, String endday, String roomSel,
			String numSel, int people) {
		System.out.println("캠핑장 예약페이지 이동");
		ModelAndView mav = csvc.campingReservationPage(cacode, startday, endday, roomSel, numSel, people);
		return mav;
	}

	@RequestMapping(value = "checkRoomType")
	public @ResponseBody String checkRoomType(String cacode, String startday, String endday) {
		System.out.println("예매가능 캠핑장 타입 ajax");
		String roomType_json = csvc.checkRoomType(cacode, startday, endday);
		return roomType_json;
	}

	@RequestMapping(value = "getMyInfo")
	public @ResponseBody String getMyInfo(String loginId) {
		System.out.println("내정보 ajax");
		String myInfo_json = csvc.getMyInfo(loginId);
		return myInfo_json;
	}

	// member로 이동
	@RequestMapping(value = "myReservationList")
	public ModelAndView myReservationList() {
		System.out.println("내 캠핑장 예약내역 페이지 이동");
		ModelAndView mav = csvc.myReservationList();
		return mav;
	}

	@RequestMapping(value = "myReservation")
	public ModelAndView myReservation(String recode) {
		System.out.println("내 캠핑장 예약내영 상세보기 페이지 이동");
		ModelAndView mav = csvc.myReservation(recode);
		return mav;
	}

	@RequestMapping(value = "changeReserveMsg")
	public @ResponseBody String changeReserveMsg(String recode, String remname, String remtel, String rememail,
			String rerequest) {
		System.out.println("캠핑 예약 내용 수정");
		System.out.println(remname);
		System.out.println(remtel);
		System.out.println(rememail);
		System.out.println(rerequest);
		String Updateresult = csvc.changeReserveMsg(recode, remname, remtel, rememail, rerequest);
		return Updateresult;
	}

	@RequestMapping(value = "getRecode")
	public @ResponseBody String getRecode() {
		System.out.println("예약번호 생성");
		String recode = csvc.getRecode();
		System.out.println(recode);
		return recode;
	}

	@RequestMapping(value = "cancelReservation")
	public ModelAndView cancelReservation(String recode) {
		System.out.println("캠핑 예약 취소 호출");
		System.out.println("recode : " + recode);
		ModelAndView mav = csvc.cancelReservation(recode);
		return mav;
	}
	
	@RequestMapping(value = "checkTotalPrice")
	public @ResponseBody String checkTotalPrice(String crprice, String startday, String endday) {
		System.out.println("예약 예상가격 계산");
		String totalPrice = csvc.checkTotalPrice(crprice, startday, endday);
		return totalPrice;
	}

	@RequestMapping(value = "questionWrite")
	public ModelAndView questionWrite() {
		return null;
	}
	
}
