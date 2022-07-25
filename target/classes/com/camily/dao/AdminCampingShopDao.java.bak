package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.camily.dto.GoodsDto;

public interface AdminCampingShopDao {
    
	// 관리자 캠핑 용품 페이지 이동 요청 
	ArrayList<GoodsDto> adminCampingShop();
    
	// 관리자 캠핑용품 상태 변경 ajax 클릭시 gstate값 변경
	int campingShopState(@Param("gcode") String gcode, @Param("gstate") String gstate);

	// 관리자 캠핑용품 수정 선택한 제품의 대한 수정 페이지
	GoodsDto productmodify(String gcode);
    
	// 관리자 캠핑 용품 수정
	int modifyUpdate(GoodsDto goods);
    
	// 관리자 상품 등록 처리 dao (INSERT)
	int produckAdd(GoodsDto goods);

}
