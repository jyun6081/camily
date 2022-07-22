package com.camily.service;

import java.io.File;
import java.io.IOException;
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
import com.camily.dto.MemberDto;
import com.camily.dto.PageDto;
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
		System.out.println("CampingService.getCampingList() 호출");
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
		System.out.println("CampingService.getCampingList() 호출");
		System.out.println("변경할 캠핑장 코드 : " + cacode);
		System.out.println("변경할 state  : " + castate);
		
		int updateResult = addao.updateCampingState(cacode,castate);
		return updateResult+"";
	}
    // 관리자 캠핑장 상세보기0
	public ModelAndView getCampingInfo(String cacode) {
		System.out.println("CampingService.getCampingInfo() 호출");
	    System.out.println("상세보기 캠핑장 코드 : " + cacode);
		ModelAndView mav = new ModelAndView();
		
		CampingDto campingInfo = addao.selectCampingInfo(cacode);
	    mav.addObject("campingInfo", campingInfo);
		mav.setViewName("admin/AdminCampingInfo");
		return mav;
	}
    // 관리자 캠핑장 정보수정
	public ModelAndView modifyCampingInfo(CampingDto camping, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("CampingService.modifyCampingInfo() 호출");
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
		System.out.println("CampingService.registerCamping() 호출");
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

	public ModelAndView homeComponent() {
		System.out.println("CampingService.homeComponent() 호출");
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
		System.out.println("CampingService.bannerAdd() 호출");
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
		System.out.println("CampingService.bannerModify() 호출");
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
		System.out.println("CampingService.bannerDelete() 호출");
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

}
