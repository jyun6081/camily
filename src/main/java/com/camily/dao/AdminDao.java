package com.camily.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camily.dto.BannerDto;
import com.camily.dto.BoardDto;
import com.camily.dto.CampingDto;
import com.camily.dto.CampingQuestionDto;
import com.camily.dto.MemberDto;

public interface AdminDao {

	int updateMemberState(@Param("mid") String mid, @Param("mstate") String mstate);

	MemberDto selectMemberInfo(String mid);

	int getMemberTotalCount();
    
	ArrayList<MemberDto> getMemberList(@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	// 캠핑장 목록
	ArrayList<CampingDto> getCampingList(@Param("startRow")int startRow, @Param("endRow")int endRow);
    // 캠핑장 목록 페이징 처리
	int getCampTotalCount();
	// 캠핑장 상태 변경
	int updateCampingState(@Param("cacode")String cacode, @Param("castate")String castate);
	// 캠핑장 상세정보
	CampingDto selectCampingInfo(String cacode);
	// 캠핑장 상세정보 변경
	int updateCampingInfo(CampingDto camping);
	// 캠핑장 코드 최댓값 조회
	String getMaxCacode();
	// 캠핑장 등록
	int insertCamping(CampingDto camping);
	
	@Select("SELECT * FROM BANNER ORDER BY BNCODE")
	ArrayList<BannerDto> getBannerList();
	
	
	@Select("SELECT MAX(BNCODE) FROM BANNER")
	String getMaxBncode();
	
	@Insert("INSERT INTO BANNER(BNCODE, BNIMAGE, BNTITLE, BNTITLEEFFECT, BNCONTENTS, BNCONTENTSEFFECT, BNLINK, BNLINKEFFECT) VALUES (#{bncode}, #{bnimage}, #{bntitle}, #{bntitleeffect}, #{bncontents}, #{bncontentseffect}, #{bnlink}, #{bnlinkeffect})")
	int bannerAdd(BannerDto bannerInfo);
	
	int bannerModify(BannerDto bannerInfo);
	
	@Delete("DELETE FROM BANNER WHERE BNCODE = #{bncode}")
	int bannerDelete(BannerDto bannerInfo);

	ArrayList<BoardDto> getAdminBoardList(@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	int getBoardTotalCount();

	int updateBoardState(@Param("bocode") int bocode,@Param("bostate") int bostate);

	//@Select("SELECT * FROM CAMPINGQUESTION ORDER BY CQDATE DESC")
	ArrayList<CampingQuestionDto> getCampingQuestionList();


	

}
