package com.camily.service;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.AdminCampingShopDao;
import com.camily.dto.GoodsDto;
import com.camily.dto.GoodsOrderDto;

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
	private String savePath ="C:\\Users\\user\\Desktop\\git\\camily\\src\\main\\webapp\\resources\\campingShopfileUpLoad";		
	
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
		
		//1. 구매 코드 생성 (select)
	    String produckAddmaxgoCode = acdao.produckAddmaxgoCode(); // 구매 코드 최대값 생성
	    String gocode = "GO";
	    if(produckAddmaxgoCode == null) {
	    	gocode = gocode + "001";
	    } else {    
	    	produckAddmaxgoCode = produckAddmaxgoCode.substring(2); 
	    	int codeNum = Integer.parseInt(produckAddmaxgoCode) + 1;
	    	if( codeNum < 10) {
	    		gocode = gocode + "00" + codeNum;
	    	} else if(codeNum < 100) {
	    		gocode = gocode + "0" + codeNum;
	    	} else {
	    		gocode = gocode + codeNum;
	    	}
	    }
	    goods.setGcode(gocode); // 자동코드 goods.set
	    
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
		goods.setGimage(gimage); // 새로운 이미지 goods.set
		
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
		goods.setGsideimage(gsideimage); // 새로운 이미지 goods.set
		
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
		goods.setGbackimage(gbackimage); // 새로운 이미지 goods.set
		
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
		goods.setGdetailimage(gdetailimage); // 새로운 이미지 goods.set
		
		// 상품 등록 처리 dao (INSERT)
		int produckAdd = acdao.produckAdd(goods);
		System.out.println("produckAdd :"+ produckAdd);
		
		
		ra.addFlashAttribute("msg", "상품 등록을 완료했습니다.");
		mav.setViewName("redirect:/AdminProductInsert");
	    
		return mav;
	}
    
	// 관리자 캠핑 용품 배송 관리 
	public ModelAndView AdminCampingSendProduckt() {
		System.out.println("AdminCampingShopService.AdminCampingSendProduckt()호출");
	    ModelAndView mav = new ModelAndView();
	    
	    // 관리자 캠핑 용품 페이지 이동 요청 
	 	ArrayList<GoodsOrderDto> AdminCampingSendProduckt = acdao.AdminCampingSendProduckt();
	    System.out.println("AdminCampingSendProduckt :"+ AdminCampingSendProduckt);
	    
	 	String formatsum = ""; // 관리자 총상품 가격
	 	String formattergoprice = ""; // 상품총가격 콤마표시
	    for(int z = 0; z < AdminCampingSendProduckt.size(); z++) {
			  // 상품총가격
	    	  formatsum = "";
	    	  formatsum += AdminCampingSendProduckt.get(z).getGoprice();
			  System.out.println("formatsum :"+ formatsum);
			  int formattergoprice_int = Integer.parseInt(formatsum);
			  
			  // 상품총가격 콤마표시
			  DecimalFormat formatter = new DecimalFormat("###,###");
			  System.out.println("formattergoprice_int의 금액 표기["+formattergoprice_int+"] ==> " +formatter.format(formattergoprice_int));			  
			  formattergoprice = formatter.format(formattergoprice_int); // 상품총가격 표시
	    }

	    mav.addObject("formattergoprice", formattergoprice);
		mav.addObject("AdminCampingSendProduckt", AdminCampingSendProduckt);
		mav.setViewName("admin/AdminCampingSendProduckt");
		return mav;
		
	}

	// 관리자 캠핑 용품 배송중으로 변경 ajax
	public String send(String gocode) {
		System.out.println("AdminCampingShopService.send()호출");
	     
		// 관리자 캠핑 용품 배송중으로 변경 dao 호출
		int send = acdao.send(gocode);
		String sendNum = "";
		if(send > 0) {
			sendNum = gocode;
		}
		System.out.println("send :"+ send);
		return sendNum;
	}
    
	// 관리자 캠핑 용품 배송완료 변경 ajax 
	public String sendtake(String gocode) {
		System.out.println("AdminCampingShopService.sendtake()호출");
	     
		// 관리자 캠핑 용품 배송중으로 변경 dao 호출
		int sendtake = acdao.sendtake(gocode);
		System.out.println("sendtake :"+ sendtake);
		
		String sendNum = "";
		if(sendtake > 0) {
			sendNum = gocode;
		}	
		return sendNum;
	}
    
	// 관리자 캠핑 용품 취소관리 페이지 
	public ModelAndView AdminCampingCancel() {
		System.out.println("AdminCampingShopService.AdminCampingCancel()호출");
	    ModelAndView mav = new ModelAndView();
	    
	    // 관리자 캠핑 용품 취소관리 페이지 
	    ArrayList<GoodsOrderDto> AdminCampingCancel = acdao.AdminCampingCancel();
	    System.out.println("AdminCampingCancel :"+ AdminCampingCancel);
	    
	    String formatsum = ""; // 관리자 총상품 가격
	 	String formattergoprice = ""; // 상품총가격 콤마표시
	    for(int z = 0; z < AdminCampingCancel.size(); z++) {
			  // 상품총가격
	    	  formatsum = "";
	    	  formatsum += AdminCampingCancel.get(z).getGoprice();
			  System.out.println("formatsum :"+ formatsum);
			  int formattergoprice_int = Integer.parseInt(formatsum);
			  
			  // 상품총가격 콤마표시
			  DecimalFormat formatter = new DecimalFormat("###,###");
			  System.out.println("formattergoprice_int의 금액 표기["+formattergoprice_int+"] ==> " +formatter.format(formattergoprice_int));			  
			  formattergoprice = formatter.format(formattergoprice_int); // 상품총가격 표시
	    }
	    
	    mav.addObject("formattergoprice", formattergoprice);
	    mav.addObject("AdminCampingCancel", AdminCampingCancel);
		mav.setViewName("admin/AdminCampingCancel");
	    
		return mav;
	}
    
	// 관리자 취소승인 ajax
	public String cancelOk(String gocode) {
		System.out.println("AdminCampingShopService.cancelOk()호출");
		
		    // 관리자 취소승인으로 변경 dao 호출
			int cancelOk = acdao.cancelOk(gocode);
			System.out.println("cancelOk :"+ cancelOk);
				
			String cancelOkNum = "";
			if(cancelOk > 0) {
			  cancelOkNum = gocode;
			}	
		return cancelOkNum;
	}

	// 관리자 취소거절 ajax
	public String cancelNo(String gocode) {
		System.out.println("AdminCampingShopService.cancelNo()호출");
		
		    // 관리자 취소승인으로 변경 dao 호출
			int cancelNo = acdao.cancelNo(gocode);
			System.out.println("cancelNo :"+ cancelNo);
				
			String cancelNoNum = "";
			if(cancelNo > 0) {
				cancelNoNum = gocode;
			}	
		return cancelNoNum;
	}
    
	// 관리자 취소목록 
	public ModelAndView AdminCampingCancelList() {
		System.out.println("AdminCampingShopService.AdminCampingCancel()호출");
	    ModelAndView mav = new ModelAndView();
	    
	    // 관리자 취소목록 페이지 
	    ArrayList<GoodsOrderDto> AdminCampingCancelList = acdao.AdminCampingCancelList();
	    System.out.println("AdminCampingCancelList :"+ AdminCampingCancelList);
	    
	    String formatsum = ""; // 관리자 총상품 가격
	 	String formattergoprice = ""; // 상품총가격 콤마표시
	    for(int z = 0; z < AdminCampingCancelList.size(); z++) {
			  // 상품총가격
	    	  formatsum = "";
	    	  formatsum += AdminCampingCancelList.get(z).getGoprice();
			  System.out.println("formatsum :"+ formatsum);
			  int formattergoprice_int = Integer.parseInt(formatsum);
			  
			  // 상품총가격 콤마표시
			  DecimalFormat formatter = new DecimalFormat("###,###");
			  System.out.println("formattergoprice_int의 금액 표기["+formattergoprice_int+"] ==> " +formatter.format(formattergoprice_int));			  
			  formattergoprice = formatter.format(formattergoprice_int); // 상품총가격 표시
	    }
	    
	    mav.addObject("formattergoprice", formattergoprice);	    
	    mav.addObject("AdminCampingCancelList", AdminCampingCancelList);
		mav.setViewName("admin/AdminCampingCancelList");
	    
		return mav;
	}


	
	
	
	
	
	
	
	
	
	
}
