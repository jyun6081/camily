package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import com.camily.dto.CampingDetailInformationDto;
import com.camily.dto.CampingDto;
import com.camily.dto.GoodsDto;
import com.camily.dto.GoodsOrderDto;
import com.camily.dto.GoodsQnADto;
import com.camily.dto.MemberDto;

public interface CampingShopDao {
    
	// index 화면 new item (SELECT)
	ArrayList<GoodsDto> homeList();
	
	// index 화면 new camping (SELECT)
	ArrayList<CampingDto> homeList2();
	
	// 캠핑 용품 페이지 이동요청 (SELECT) 
    @Select("SELECT * FROM GOODS WHERE GSTATE = 1")
	ArrayList<GoodsDto> getCampingList2(String loginId);  	
    
	// 캠핑용품 검색 기능 
	ArrayList<GoodsDto> searchShop(String search);
	
	// 캠핑 용품 상세 페이지 이동 요청 (SELECT)
	GoodsDto campingDetail(String gcode);
    
	// 캠핑 구매 요청 페이지 이동요청 (SELECT) B
	GoodsDto campingpurchase(@Param("gcode") String gcode);
    
	// 구매 요청 페이지 이동하기 전에 세션 아이디를 이용해서 주소 찾기 ( 위에거 연장선 ) (SELECT) B
	MemberDto addselect(String loginId);
    
	// 구매 코드 최대값 생성 (SELECT) C
	String MaxGocode();
	
	// 캠핑 용품 구매하기 구매 코드 생성한거 가지고 사용함 (INSERT) C
	int goodsPurchase(
			@Param("gocode") String gocode, @Param("loginId") String loginId, @Param("addr") String addr, @Param("gogcode") String gogcode, 
			@Param("gamount") String gamount, @Param("totalPrice") String totalPrice, @Param("gname") String gname,
			@Param("gimage") String gimage);
    
	// 구매가 성공 했으면 장바구니 삭제 (DELETE)
	int shoppingbasket(@Param("loginId") String loginId, @Param("gogcode") String gogcode);
	
	// 구매내역 보기 (SELECT) 페이징 처리
	ArrayList<GoodsOrderDto> PurchaseList(@Param("loginId") String loginId, @Param("startRow") int startRow, @Param("endRow") int endRow);
	
	// 구매목록 삭제하기 dao 호출 (UPDATE)
	int deleteph(@Param("gocode") String gocode, @Param("gostate") String gostate);
    
	// 구매목록페이지 페이징처리
	@Select("SELECT COUNT(*) FROM GOODSORDER")
	int getCampTotalCount2();
	
	// 캠핑 용품 (SELECT) AA
	GoodsDto getCampingInfo(String gcode);
	
    // 찜클릭 state값 증가 ajax (INSERT) 캠핑용품에서 필요한 값 가져 온것 AA
	int cartInsert(@Param("gcode") String gcode, @Param("gocode") String gocode,
			@Param("loginId") String loginId, @Param("gorice") String gorice,
			@Param("goname") String goname, @Param("goimage") String goimage);
    
	// 찜목록 보기 (SELECT)
	ArrayList<GoodsOrderDto> cartselect(String loginId);
    
	// 찜삭제 (DELETE)
	int calldibs(@Param("gocode") String gocode, @Param("loginId") String loginId);
	
	// 장바구니 추가하기 전 장바구니 안에 같은 물건이 있는지 없는지 아이디로 확인 (SELECT) ZZ
	CampingDetailInformationDto selectdto(@Param("dicode")String dicode, @Param("loginId")String loginId);
    
    // 값이 없으면 장바구니 추가 (INSERT) ZZ
	int insertinformation(
			@Param("loginId") String loginId, @Param("dicode") String dicode, @Param("diname") String diname, 
			@Param("diimage") String diimage, @Param("diamount") String diamount, @Param("diaddr") String diaddr,
			@Param("diprice") String diprice, @Param("ditotalprice") int ditotalprice);    	

	// 값이 있으면 해당하는 상품이 있으니까 수량만 늘려줌 (UPDATE) ZZ
	int update(@Param("diamount") String diamount, @Param("loginId") String loginId, @Param("ditotalprice2") int ditotalprice2, @Param("dicode") String dicode);
	
	// 장바구니 목록 페이지 출력 (SELECT)
	ArrayList<CampingDetailInformationDto> detailinformation(String loginId);
   
    // 장바구니 들어 있는 모든 값 (INSERT)
	int totalpurchase(GoodsOrderDto goInfo);
	
	// 장바구니에 있는 값을 구입하면 해당하는 장바구니 목록 삭제 (DELETE)
	int totalbasket(GoodsOrderDto goInfo);
    
	// 장바구니 삭제 (DELETE)
	int deletepoket(String dicode);
    
	// 구매확정 (UPDATE)
	int phDecide(String gocode);
    
	// 주문 취소 (DELETE)
	int PurchaseDelete(String gocode);
    
	// 취소요청 하기 STATE 6 관리자 기달리기 (UPDATE)
	int cancelreasonput(@Param("gocode") String gocode, @Param("gocancel") String gocancel);
    
	// 캠핑용품 문의글 가져오기
	ArrayList<GoodsQnADto> goodsQuestionList(String gcode);
	
    // 문의글 코드 최댓값 조회
	String getMaxGqcode();
	
    // 캠핑용품 문의글 작성
	int goodsQuestionWrite(GoodsQnADto goodsQuestionInfo);
	
    // 문의글 수정
	int goodsQuestionModify(@Param("gqcode") String gqcode, @Param("gqcontents") String gqcontents);
	
    // 문의글 정보
	GoodsQnADto getGoodsQuestionInfo(String gqcode);
	
    // 문의글 삭제(state 0)
	int modifyGoodsQuestionState(String gqcode);
   

   

   

    


	
    
	
    
	
   
    

	



    

	



}