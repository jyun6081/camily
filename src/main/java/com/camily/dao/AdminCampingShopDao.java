package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.camily.dto.GoodsDto;
import com.camily.dto.GoodsOrderDto;

public interface AdminCampingShopDao {
    
	// 관리자 캠핑 용품 페이지 이동 요청  (SELECT)
	ArrayList<GoodsDto> adminCampingShop();
    
	// 관리자 캠핑용품 상태 변경 ajax 클릭시 gstate값 변경 (UPDATE)
	int campingShopState(@Param("gcode") String gcode, @Param("gstate") String gstate);

	// 관리자 캠핑용품 수정 선택한 제품의 대한 수정 페이지 (SELECT)
	GoodsDto productmodify(String gcode);
    
	// 관리자 캠핑 용품 수정 (UPDATE)
	int modifyUpdate(GoodsDto goods);
    
	// 등록하기 전 구매 코드 생성 (select) C
	String produckAddmaxgoCode();
	
	// 관리자 상품 등록 처리 dao (INSERT) C
	int produckAdd(GoodsDto goods);
    
	// 관리자 캠핑 용품 배송 관리 페이지 이동 요청 (SELECT)
	ArrayList<GoodsOrderDto> AdminCampingSendProduckt();
    
	// 관리자 캠핑 용품 배송중으로 변경 ajax (UPDATE)
	int send(String gocode);
    
	// 관리자 캠핑 용품 배송완료 변경 ajax (UPDATE)
	int sendtake(String gocode);
    


}
