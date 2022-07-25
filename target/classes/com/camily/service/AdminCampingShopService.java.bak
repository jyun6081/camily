package com.camily.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.AdminCampingShopDao;
import com.camily.dto.GoodsDto;

@Service
public class AdminCampingShopService {
    
	@Autowired
	AdminCampingShopDao acdao;
	
	// 관리자 캠핑 용품 페이지 이동 요청 
	public ModelAndView adminCampingShop() {
		System.out.println("AdminCampingShopService.adminCampingShop()호출");
		ModelAndView mav = new ModelAndView();
		
		// 관리자 캠핑 용품 페이지 이동 요청 
		ArrayList<GoodsDto> adminCampingShopList = acdao.adminCampingShop();
		System.out.println("adminCampingShopList :"+ adminCampingShopList);
		
		mav.addObject("adminCampingShopList", adminCampingShopList);
		mav.setViewName("admin/AdminCampingShop");
		
		return mav;
	}
    
	// 관리자 캠핑용품 상태 변경 ajax
	public String campingShopState(String gcode, String gstate) {
		System.out.println("AdminCampingShopService.campingShopState()호출");
		
		// ajax 클릭시 gstate값 변경
		int campingShopState = acdao.campingShopState(gcode,gstate);
				
		return campingShopState+"";
	}
    
	// 관리자 캠핑용품 수정 페이지
	public ModelAndView productmodify(String gcode) {
		System.out.println("AdminCampingShopService.productmodify()호출");
		ModelAndView mav = new ModelAndView();
		
		// 선택한 제품의 대한 수정 페이지
		GoodsDto productmodify = acdao.productmodify(gcode);
		
		mav.addObject("productmodify", productmodify);
		mav.setViewName("admin/AdminProductModify");
				
		return mav;
	}
	
	//2. 저장경로 설정
	private String savePath ="D:\\camily\\src\\main\\webapp\\resources\\campingShopfileUpLoad";		
	
	// 관리자 캠핑 용품 수정
	public ModelAndView modifyUpdate(RedirectAttributes ra, GoodsDto goods) throws IllegalStateException, IOException {
		System.out.println("AdminCampingShopService.modifyUpdate()호출");
		ModelAndView mav = new ModelAndView();
		try {			
			// 상품이미지 프로파일 넣기
			MultipartFile gimagefile = goods.getGimagefile();
			String gimage = "";
			if( !gimagefile.isEmpty() ) {
				System.out.println("첨부파일 있음");
				UUID uuid = UUID.randomUUID();
				//1. 파일명 생성
				gimage = uuid.toString()+"_"+gimagefile.getOriginalFilename();
				//프로필 이미지 파일 저장
				gimagefile.transferTo(  new File(savePath, gimage)   );
			}
			System.out.println("gimage : " + gimage);
			goods.setGimage(gimage);
			// 상품 사이드 이미지 프로파일 넣기
			MultipartFile gsideimagefile = goods.getGsideimagefile();
			String gsideimage = "";
			
			if( !gsideimagefile.isEmpty() ) {
				System.out.println("사이드이미지 첨부파일 있음");
				UUID uuid = UUID.randomUUID();
				//1. 파일명 생성
				gsideimage = uuid.toString()+"_"+gsideimagefile.getOriginalFilename();
				//프로필 이미지 파일 저장
				gsideimagefile.transferTo(  new File(savePath, gsideimage)   );
			} 
			System.out.println("gsideimage : " + gsideimage);		
			goods.setGsideimage(gsideimage);
			
			// 상품 백이미지 이미지 프로파일 넣기
			MultipartFile gbackimagefile = goods.getGbackimagefile();
			String gbackimage = "";
			
			if( !gbackimagefile.isEmpty() ) {
				System.out.println("백이미지 첨부파일 있음");
				UUID uuid = UUID.randomUUID();
				//1. 파일명 생성
				gbackimage = uuid.toString()+"_"+gbackimagefile.getOriginalFilename();
				//프로필 이미지 파일 저장
				gbackimagefile.transferTo(  new File(savePath, gbackimage)   );
			} 
			System.out.println("gbackimage : " + gbackimage);		
			goods.setGbackimage(gbackimage);
			
			// 상품 상세정보 이미지 이미지 프로파일 넣기
			MultipartFile gdetailimagefile = goods.getGdetailimagefile();
			String gdetailimage = "";
			
			if( !gdetailimagefile.isEmpty() ) {
				System.out.println("상세이미지 첨부파일 있음");
				UUID uuid = UUID.randomUUID();
				//1. 파일명 생성
				gdetailimage = uuid.toString()+"_"+gdetailimagefile.getOriginalFilename();
				//프로필 이미지 파일 저장
				gdetailimagefile.transferTo(  new File(savePath, gdetailimage)   );
			} 
			System.out.println("gdetailimage : " + gdetailimage);		
			goods.setGdetailimage(gdetailimage);
			
			// 상품 수정 처리 dao (UPDATE)
			int modifyUpdate = acdao.modifyUpdate(goods);
			
			ra.addFlashAttribute("msg", "상품 수정을 완료했습니다.");
			mav.setViewName("redirect:/adminCampingShop");			
		} catch (Exception e) {
			ra.addFlashAttribute("msg", "상품 코드를 다르게 해주세요!");
			mav.setViewName("redirect:/adminCampingShop");	
		}
		return mav;
		
	}

	// 관리자 캠핑 용품 등록
	public ModelAndView produckAdd(RedirectAttributes ra, GoodsDto goods) throws IllegalStateException, IOException {
	    System.out.println("AdminCampingShopService.modifyUpdate()호출");
	    ModelAndView mav = new ModelAndView();
		
		// 상품이미지 프로파일 넣기
		MultipartFile gimagefile = goods.getGimagefile();
		String gimage = "";
		if( !gimagefile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			gimage = uuid.toString()+"_"+gimagefile.getOriginalFilename();
			//프로필 이미지 파일 저장
			gimagefile.transferTo(  new File(savePath, gimage)   );
		} 
		System.out.println("gimage : " + gimage);		
		goods.setGimage(gimage);
		
		// 상품 사이드 이미지 프로파일 넣기
		MultipartFile gsideimagefile = goods.getGsideimagefile();
		String gsideimage = "";

		if( !gsideimagefile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			gsideimage = uuid.toString()+"_"+gsideimagefile.getOriginalFilename();
			//프로필 이미지 파일 저장
			gsideimagefile.transferTo(  new File(savePath, gsideimage)   );
		} 
		System.out.println("gsideimage : " + gsideimage);		
		goods.setGsideimage(gsideimage);
		
		// 상품 백이미지 이미지 프로파일 넣기
		MultipartFile gbackimagefile = goods.getGbackimagefile();
		String gbackimage = "";
		
		if( !gbackimagefile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			gbackimage = uuid.toString()+"_"+gbackimagefile.getOriginalFilename();
			//프로필 이미지 파일 저장
			gbackimagefile.transferTo(  new File(savePath, gbackimage)   );
		} 
		System.out.println("gbackimage : " + gbackimage);		
		goods.setGbackimage(gbackimage);
		
		// 상품 상세정보 이미지 이미지 프로파일 넣기
		MultipartFile gdetailimagefile = goods.getGdetailimagefile();
		String gdetailimage = "";
		
		if( !gdetailimagefile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			gdetailimage = uuid.toString()+"_"+gdetailimagefile.getOriginalFilename();
			//프로필 이미지 파일 저장
			gdetailimagefile.transferTo(  new File(savePath, gdetailimage)   );
		} 
		System.out.println("gdetailimage : " + gdetailimage);		
		goods.setGdetailimage(gdetailimage);
		
		// 상품 등록 처리 dao (INSERT)
		int produckAdd = acdao.produckAdd(goods);
		System.out.println("produckAdd :"+ produckAdd);
		
		
		ra.addFlashAttribute("msg", "상품 등록을 완료했습니다.");
		mav.setViewName("redirect:/AdminProductInsert");
	    
		return mav;
	}

	
	
	
	
	
	
	
	
	
	
}
