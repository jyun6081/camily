package com.camily.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dao.AdminDao;
import com.camily.dao.CampingShopDao;
import com.camily.dto.BannerDto;
import com.camily.dto.CampingDetailInformationDto;
import com.camily.dto.CampingDto;
import com.camily.dto.CampingQnADto;
import com.camily.dto.GoodsDto;
import com.camily.dto.GoodsOrderDto;
import com.camily.dto.GoodsQnADto;
import com.camily.dto.MemberDto;
import com.camily.dto.PageDto;
import com.google.gson.Gson;

@Service
public class CampingShopService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CampingShopDao cdao;
	
	@Autowired
	private AdminDao adao;
	
	// index 화면 new item
	public ModelAndView home() {
		System.out.println("campingShopPage.CampingShopPage() 호출");	
		ModelAndView mav = new ModelAndView();
		
		ArrayList<BannerDto> bannerList = adao.getBannerList();
		mav.addObject("bannerList", bannerList);
		
		// index 화면 new item
		ArrayList<GoodsDto> homeList = cdao.homeList();
		System.out.println("homeList :"+ homeList);
		
		ArrayList<CampingDto> homeList2 = cdao.homeList2();
		System.out.println("homeList2 :"+ homeList2);
		
		mav.addObject("homeList", homeList);
		mav.addObject("homeList2", homeList2);
		
		mav.setViewName("Main");	
		
		return mav;
	}
	
    // 캠핑 용품 이동 페이지
	public ModelAndView campingShopPage() {
		System.out.println("campingShopPage.CampingShopPage() 호출");	
		ModelAndView mav = new ModelAndView();
			
		// SELECT 캠핑 용품 
		ArrayList<GoodsDto> campingShop = cdao.getCampingList2();
					
		mav.addObject("campingShop", campingShop);
		mav.setViewName("campingshop/CampingShopPage");	
		return mav;
	}
	
	// 캠핑용품 검색 기능 
	public String searchShop(String search) {
		System.out.println("CampingShopService.searchShop() 호출");
		System.out.println("search : " + search);
		// 캠핑용품 검색 기능 
		ArrayList<GoodsDto> campingShop = cdao.searchShop(search);
        
		Gson gson = new Gson();
		String campingShop_json = gson.toJson(campingShop);
        return campingShop_json;
	}
	
	// 캠핑 용품 상세 페이지
	public ModelAndView campingDetailPage(String gcode) {
		System.out.println("CampingShopService.campingDetailPage() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		/* --- */
		int selPage = 1;
		/*
		if(page != null) {
			selPage = Integer.parseInt(page);
		}
		*/
		int campingQnATotalCount = cdao.getGoodsQnATotalCount();
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
		ArrayList<GoodsQnADto> goodsQuestionList = cdao.goodsQuestionList(startRow, endRow, gcode);
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
		
		GoodsDto campingDetail = cdao.campingDetail(gcode);
		
		mav.addObject("campingDetail", campingDetail);
		mav.addObject("goodsQuestionList", goodsQuestionList);
		mav.addObject("pageDto", pageDto);
		mav.setViewName("campingshop/CampingDetailPage");
		
		return mav;
	}
    
	// 캠핑 구매 요청 페이지 이동요청
	public ModelAndView campingpurchase(RedirectAttributes ra, String gcode, String gamount) {
		System.out.println("CampingShopService.campingpurchase() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		try {			
			GoodsDto campingpurchase = cdao.campingpurchase(gcode);
			campingpurchase.setGamount(gamount); // 상품 갯수 추가
			int price = Integer.parseInt(campingpurchase.getGprice().replace(",", "")); // 1,890,000
			int total = price * Integer.parseInt(gamount);
			
			String loginId = (String) session.getAttribute("loginId");
			System.out.println("loginId :"+ loginId);
			
			MemberDto addselect = cdao.addselect(loginId);  // 세션 아이디를 이용해서 주소 찾기
			System.out.println("addselect :"+ addselect);
			
			//주소 분리 (우편번호, 주소, 상세주소, 참고주소)
			String maddress = addselect.getMaddr();
			
			if( maddress != null) {
				String[] maddress_arr = maddress.split("_");
				System.out.println(maddress_arr.length);
				String addr = "";
				for(int i = 0; i<maddress_arr.length; i++) {
					if(i == 0) {
						addr += "("+maddress_arr[i]+")";
					}else {
						addr += " " + maddress_arr[i];
					}
				}
				System.out.println("addr : " + addr);
				addselect.setMaddr(addr);
				/*
			if( maddress_arr.length >= 4 ) {
				System.out.println("("+maddress_arr[0]+") "+ maddress_arr[1] + " " + maddress_arr[2] + "maddress_arr[3]");
				addselect.setMaddress("("+maddress_arr[0]+") "+ maddress_arr[1] + " " + maddress_arr[2] + "maddress_arr[3]");
				addselect.setMpostcode(maddress_arr[0]);
				addselect.setMaddr(maddress_arr[1]);
				addselect.setMdetailAddr(maddress_arr[2]);
				addselect.setMextraAddr(maddress_arr[3]);
			}
				 */
			}		
			mav.addObject("addselect", addselect);
			mav.addObject("campingpurchase", campingpurchase);
			mav.addObject("totalPrice", total);			
			mav.setViewName("campingshop/CampingPurchase");
		} catch (Exception e) {
			  ra.addFlashAttribute("msg", "로그인해주세요!");
		      mav.setViewName("redirect:/");
		}	
		return mav;
	}
    
	// 캠핑 용품 구매하기 Insert
	public ModelAndView goodsPurchase(RedirectAttributes ra, String loginId, String addr, String gogcode, String gamount, String totalPrice,
			String gname, String gimage) {
		System.out.println("CampingShopService.goodsPurchase() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		//1. 구매 코드 생성 (select)
	    String maxgoCode = cdao.MaxGocode(); // 구매 코드 최대값 생성
	    String gocode = "GO";
	    if(maxgoCode == null) {
	    	gocode = gocode + "001";
	    } else {    
	    	maxgoCode = maxgoCode.substring(2); 
	    	int codeNum = Integer.parseInt(maxgoCode) + 1;
	    	if( codeNum < 10) {
	    		gocode = gocode + "00" + codeNum;
	    	} else if(codeNum < 100) {
	    		gocode = gocode + "0" + codeNum;
	    	} else {
	    		gocode = gocode + codeNum;
	    	}
	    }
	    
	    try {
	    	// dao 전송 주문 코드부터 이미지 까지		
	    	int goodsPurchase = cdao.goodsPurchase(gocode,loginId,addr,gogcode,gamount,totalPrice
	    			,gname,gimage);	
	    	  System.out.println("goodsPurchase :"+ goodsPurchase);	    	 
	    	// 구매가 성공 했으면 장바구니 삭제 
	    	int shoppingbasket = cdao.shoppingbasket(loginId,gogcode);
	    	System.out.println("shoppingbasket :"+ shoppingbasket);
	    	  ra.addFlashAttribute("msg", "구매를 성공하셨습니다.");	        	 
		      mav.setViewName("redirect:/CampingPurchaseListPage");
		} catch (Exception e) {
			  ra.addFlashAttribute("msg", "구매를 실패하였습니다.");
		      mav.setViewName("redirect:/campingDetailPage");
		}			
		return mav;
	}
	
	// 구매내역 보기 Select 페이징처리
	public ModelAndView CampingPurchaseListPage(String page) {
		 System.out.println("CampingShopService.CampingPurchaseListPage() 호출");
		 
		 int selPage = 1;
			if(page != null) {
				selPage = Integer.parseInt(page);
			}
			int campTotalCount = cdao.getCampTotalCount2();
			
			int pageCount = 3; // 보여줄 개수
			int pageNumCount = 3; // 밑에 페이지 개수
			int startRow = 1 + (selPage - 1) * pageCount;
			int endRow = selPage * pageCount;
			if (endRow > campTotalCount) {
				endRow = campTotalCount;
			}
			System.out.println("startRow : " + startRow);
			System.out.println("endRow : " + endRow);
			
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
		 
		 String loginId = (String) session.getAttribute("loginId");
		 System.out.println("loginId :"+ loginId);
		 
		 ArrayList<GoodsOrderDto> PurchaseList = cdao.PurchaseList(loginId,startRow,endRow); // 해당하는 아이디의 구매내역 값 출력	
		 ModelAndView mav = new ModelAndView();
		 
		 System.out.println("PurchaseList :"+ PurchaseList);
		 mav.addObject("PurchaseList", PurchaseList);
		 mav.addObject("pageDto", pageDto);
		 mav.setViewName("campingshop/CampingPurchaseListPage"); // 페이지 이동
		 
		return mav;
	}
	
	//  찜클릭 state값 증가 ajax
	public String cartInsert(String gcode) {
		 System.out.println("CampingShopService.cartInsert() 호출");
		 		 
		//1. 구매 코드 생성 (select)
		    String maxgoCode = cdao.MaxGocode(); // 구매 코드 최대값 생성
		    String gocode = "GO";
		    if(maxgoCode == null) {
		    	gocode = gocode + "001";
		    } else {    
		    	maxgoCode = maxgoCode.substring(2); 
		    	int codeNum = Integer.parseInt(maxgoCode) + 1;
		    	if( codeNum < 10) {
		    		gocode = gocode + "00" + codeNum;
		    	} else if(codeNum < 100) {
		    		gocode = gocode + "0" + codeNum;
		    	} else {
		    		gocode = gocode + codeNum;
		    	}
		    }
			 String loginId = (String) session.getAttribute("loginId");
		    // 찜목록 dao 페이지 이동
			 
			// SELECT 캠핑 용품 
			GoodsDto campingShop2 = cdao.getCampingInfo(gcode); 		
			
		    int cartInsert = cdao.cartInsert(gcode,gocode,loginId, campingShop2.getGprice(),campingShop2.getGname(),campingShop2.getGimage());
		    System.out.println("cartInsert :"+ cartInsert);
		 
		 return cartInsert+"";
	}
    
    // 찜목록 클릭 select ajax 
	public String cartselect(String loginId) {
		System.out.println("CampingShopService.cartselect() 호출");
		
		// SELECT 찜목록 dao 호출
		ArrayList<GoodsOrderDto> cartselect = cdao.cartselect(loginId);
		//System.out.println("cartselect :"+ cartselect);
		int price3 = 0;
		System.out.println("cartselect.size() :"+ cartselect.size());
		for(int z =0; z < cartselect.size(); z++) {
		 price3 = Integer.parseInt(cartselect.get(z).getGoprice().replace(",", ""));
		}		
		
		Gson gson = new Gson();
		String cartselect_json = gson.toJson(cartselect);
        return cartselect_json;
	}
	
	// 찜삭제 (DELETE) ajax
		public String calldibs(String gocode) {
			System.out.println("CampingShopService.calldibs() 호출");
			String loginId = (String) session.getAttribute("loginId");	
			
			// (DELETE) 찜목록 dao 호출
			int calldibs = cdao.calldibs(gocode,loginId);
		    System.err.println("calldibs :"+calldibs);	
		        
			return calldibs+"";
		}
    
	// 장바구니 추가!
	public ModelAndView shoppingbasket(RedirectAttributes ra, String dicode, String diname, String diimage, String diamount, String diprice) {
		System.out.println("CampingShopService.shoppingbasket() 호출");
	
		ModelAndView mav = new ModelAndView();		
			try {
				String loginId = (String) session.getAttribute("loginId");
				
				MemberDto addselect = cdao.addselect(loginId);  // 세션 아이디를 이용해서 주소 찾기
				String diaddr = addselect.getMaddr();		
				System.out.println("diaddr :"+ diaddr);
				
				int price = Integer.parseInt(diprice.replace(",", "")); // 1,890,000
				int ditotalprice = price * Integer.parseInt(diamount);
				// 장바구니 추가하기 전 장바구니 안에 같은 물건이 있는지 없는지 아이디로 확인		
				CampingDetailInformationDto selectdto = cdao.selectdto(dicode,loginId); // 값이 똑같은게 있냐 없냐
				if(selectdto == null) {
				// 값이 없으면 장바구니 추가 (INSERT)
				int insertinformation = cdao.insertinformation(loginId,dicode,diname,diimage,diamount,diaddr,diprice,ditotalprice);
				System.out.println("insertinformation :"+ insertinformation);
				 if(insertinformation == 1) {
					ra.addFlashAttribute("msg", "장바구니에 추가하셨습니다.");
					mav.setViewName("redirect:/campingDetailPage?gcode="+dicode);
				}else {
					ra.addFlashAttribute("msg", "장바구니 추가에 실패하였습니다.");
					mav.setViewName("redirect:/campingDetailPage?gcode="+dicode);
				}			
			}else {
				String old = selectdto.getDiamount();
				// 값이 있으면 해당하는 상품이 있으니까 수량만 늘려줌 (UPDATE)
				int update = cdao.update(diamount,old,loginId);
				System.out.println("update :"+ update);
				ra.addFlashAttribute("msg", "장바구니에 담겨 있어서 수량만 추가하였습니다.");
				mav.setViewName("redirect:/campingDetailPage?gcode="+dicode);
			}				
			   } 
			 catch (Exception e) {
				  ra.addFlashAttribute("msg", "로그인해주세요!");
			      mav.setViewName("redirect:/");
			}		
		return mav;
	}
    
	// 장바구니 목록 페이지 출력
	public ModelAndView detailinformation(RedirectAttributes ra) {
		System.out.println("CampingShopService.detailinformation() 호출");
		
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		
		ArrayList<CampingDetailInformationDto> detailinformation = cdao.detailinformation(loginId);
				
		if(detailinformation != null) {
			mav.addObject("detailinformation",detailinformation);
			mav.setViewName("campingshop/CampingDetailInformation");
		}else {
			ra.addFlashAttribute("msg", "로그인을 해주세요!");
			mav.setViewName("redirect:/Main");
		}
				
		return mav;
	}
   
	// 장바구니 들어 있는 모든 값 insert
	public ModelAndView totalpurchase(RedirectAttributes ra, String dimid, String diaddr, String dicode,
			String diamount, String ditotalprice, String diname, String diimage) {
		System.out.println("CampingShopService.totalpurchase() 호출");
		
		String loginId = (String) session.getAttribute("loginId");
				
		ModelAndView mav = new ModelAndView();		
		GoodsOrderDto goInfo = null;
		int count = 0;
		for(int i = 0; i<dimid.split(",").length; i++) {
			goInfo = new GoodsOrderDto();
			//1. 구매 코드 생성 (select)
		    String maxgoCode = cdao.MaxGocode(); // 구매 코드 최대값 생성
		    String gocode = "GO";
		    if(maxgoCode == null) {
		    	gocode = gocode + "001";
		    } else {    
		    	maxgoCode = maxgoCode.substring(2); 
		    	int codeNum = Integer.parseInt(maxgoCode) + 1;
		    	if( codeNum < 10) {
		    		gocode = gocode + "00" + codeNum;
		    	} else if(codeNum < 100) {
		    		gocode = gocode + "0" + codeNum;
		    	} else {
		    		gocode = gocode + codeNum;
		    	}
		    }
		    goInfo.setGocode(gocode);
		    goInfo.setGomid(dimid.split(",")[i]);
		    goInfo.setGomaddr(diaddr.split(",")[i]);
		    goInfo.setGogcode(dicode.split(",")[i]);
		    goInfo.setGoamount(diamount.split(",")[i]);
		    goInfo.setGoprice(ditotalprice.split(",")[i]);
		    goInfo.setGoname(diname.split(",")[i]);
		    goInfo.setGoimage(diimage.split(",")[i]);		  
			
			// 장바구니 들어 있는 모든 값 insert dao호출 
			int totalpurchase = cdao.totalpurchase(goInfo);	
			System.out.println("totalpurchase :"+ totalpurchase);
			if(totalpurchase == 1) {    
			// 장바구니에 있는 값을 구입하면 해당하는 장바구니 목록 삭제
			int totalbasket = cdao.totalbasket(goInfo);
			System.out.println("totalbasket :"+ totalbasket);
				count++;
			}
		}
		ra.addFlashAttribute("msg", count + "건 결제가 완료 되었습니다.");
		mav.setViewName("redirect:/CampingPurchaseListPage");
		
		return mav;
	}
    
	// 장바구니 삭제
	public ModelAndView deletepoket(RedirectAttributes ra, String dicode) {
		System.out.println("CampingShopService.deletepoket() 호출");
		ModelAndView mav = new ModelAndView();		
		
        int deletepoket = cdao.deletepoket(dicode);
  		System.out.println("deletepoket :"+ deletepoket);
  		
  		ra.addFlashAttribute("msg", "해당상품을 장바구니에서 삭제했습니다.");
		mav.setViewName("redirect:/detailinformation");
		
  		
		return mav;
	}
    
	// 구매목록 삭제하기 
	public ModelAndView deleteph(RedirectAttributes ra, String gocode, String gostate) {
		System.out.println("CampingShopService.deleteph() 호출");
		ModelAndView mav = new ModelAndView();
		
		// 구매목록 삭제하기 dao 호출  
		int deleteph = cdao.deleteph(gocode,gostate);
		if(deleteph != 0) {
			ra.addFlashAttribute("msg", "목록을 삭제했습니다.");
			mav.setViewName("redirect:/CampingPurchaseListPage");			
		} else {
			ra.addFlashAttribute("msg", "삭제실패");
			mav.setViewName("redirect:/CampingPurchaseListPage");
		}
		
		return mav;
	}

	 // 주문취소 
	public ModelAndView PurchaseDelete(RedirectAttributes ra, String gocode) {
		System.out.println("CampingShopService.PurchaseDelete() 호출");
		ModelAndView mav = new ModelAndView();
			
		// 주문취소 dao 호출
	    int PurchaseDelete = cdao.PurchaseDelete(gocode);	
		if(PurchaseDelete != 0) {
			ra.addFlashAttribute("msg", "주문을 취소하였습니다.");
			mav.setViewName("redirect:/CampingPurchaseListPage");
		} else {
			ra.addFlashAttribute("msg", "주문을 취소 실패");
			mav.setViewName("redirect:/CampingPurchaseListPage");
		}    
		return mav;
	}
    
	// 구매확정 STATE = 5 
	public ModelAndView phDecide(RedirectAttributes ra, String gocode) {
		System.out.println("CampingShopService.phDecide() 호출");
		ModelAndView mav = new ModelAndView();
		
		// 구매확정 dao 호출
	    int phDecide = cdao.phDecide(gocode);
		System.out.println("phDecide :"+ phDecide);
		
	    ra.addFlashAttribute("msg", "구매확정하였습니다.");
		mav.setViewName("redirect:/CampingPurchaseListPage");
	    
		return mav;
	}
	
	// 취소요청
	public ModelAndView cancelreasonput(RedirectAttributes ra, String gocode, String gocancel) {
		System.out.println("CampingShopService.phDecide() 호출");
		ModelAndView mav = new ModelAndView();
		
		// 취소요청 하기 STATE 6 관리자 기달리기
	    int cancelreasonput = cdao.cancelreasonput(gocode, gocancel);
		System.out.println("cancelreasonput :"+ cancelreasonput);
		
		ra.addFlashAttribute("msg", "취소요청을 보냈습니다.");
		mav.setViewName("redirect:/CampingPurchaseListPage");
		
		return mav;
	}

	public ModelAndView goodsQuestionWrite(String gqmid, String gqgcode, String gqcontents, RedirectAttributes ra) {
		System.out.println("CampingShopService.goodsQuestionWrite() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("gqmid : " + gqmid);
		System.out.println("gqgcode : " + gqgcode);
		System.out.println("gqcontents : " + gqcontents);
		
		GoodsQnADto goodsQuestionInfo = new GoodsQnADto();
		String maxGqcode = cdao.getMaxGqcode();
		String GqCode = "";
		if(maxGqcode == null) {
			GqCode = "GQ0001";
		}else {
			int intMaxGqcode = Integer.parseInt(maxGqcode.substring(2)) + 1;
			if(intMaxGqcode < 10) {
				GqCode = "GQ000" + intMaxGqcode;
			}else if(intMaxGqcode < 100){
				GqCode = "GQ00" + intMaxGqcode;
			}else if(intMaxGqcode <1000) {
				GqCode = "GQ0" + intMaxGqcode;
			}else if(intMaxGqcode < 10000){
				GqCode = "GQ" + intMaxGqcode;
			}else {
				System.out.println("범위 초과");
			}
		}
		goodsQuestionInfo.setGqcode(GqCode);
		goodsQuestionInfo.setGqgcode(gqgcode);
		goodsQuestionInfo.setGqmid(gqmid);
		goodsQuestionInfo.setGqcontents(gqcontents);
		
		int insertResult = cdao.goodsQuestionWrite(goodsQuestionInfo);
		if(insertResult > 0) {
			ra.addFlashAttribute("msg", "문의글이 등록되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "문의글 등록에 실패하였습니다.");
		}
		mav.setViewName("redirect:/campingDetailPage?gcode="+gqgcode);
		return mav;
	}

	public String goodsQuestionModify(String gqcode, String gqcontents) {
		System.out.println("CampingShopService.goodsQuestionModify() 호출");
		
		String result_json = "";
		LocalDate nowDate = LocalDate.now();
		LocalTime nowTime = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String formattedNowTime = nowTime.format(formatter);
		gqcontents = gqcontents + "\r\n"+ "[수정됨] "+ nowDate + " " + formattedNowTime;
		
		int updateResult = cdao.goodsQuestionModify(gqcode,gqcontents);
		if(updateResult > 0) {
			GoodsQnADto goodsQuestionInfo = cdao.getGoodsQuestionInfo(gqcode);
			Gson gson = new Gson();
			result_json = gson.toJson(goodsQuestionInfo);
		} else {
			result_json = "NG";
		}
		
		return result_json;
	}

	public String modifyGoodsQuestionState(String gqcode) {
		System.out.println("CampingShopService.modifyGoodsQuestionState() 호출");
		
		int modifyStateResult = cdao.modifyGoodsQuestionState(gqcode);
		
		return modifyStateResult+"";
	}

	public String selGoodsQnAPage(String pageNum, String gcode) {
		int selPage = 1;

		if(pageNum != null) {
			selPage = Integer.parseInt(pageNum);
		}

		int campingQnATotalCount = cdao.getGoodsQnATotalCount();
		System.out.println(campingQnATotalCount);
		int pageCount = 5;
		int startRow = 1 + (selPage - 1) * pageCount;
		int endRow = selPage * pageCount;
		if (endRow > campingQnATotalCount) {
			endRow = campingQnATotalCount;
		}
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		ArrayList<GoodsQnADto> goodsQnAList = cdao.goodsQuestionList(startRow, endRow, gcode);
		Gson gson = new Gson();
		String campingQnAList_ajax = gson.toJson(goodsQnAList);
		return campingQnAList_ajax;
	}


    
	
    

	
}



















