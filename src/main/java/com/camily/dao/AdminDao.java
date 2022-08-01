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
import com.camily.dto.CampingQnADto;
import com.camily.dto.CampingReviewDto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.GoodsQnADto;
import com.camily.dto.GoodsReviewDto;
import com.camily.dto.MemberDto;
import com.camily.dto.ReservationDto;

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
	// 객실 타입 조회
	ArrayList<CampingRoomDto> selectCampingRommList(String cacode);
	// 객실 상태 변경
	int updateCpRoomState(CampingRoomDto campingRoom);
	// 객실 정보 변경
	int updateCpRoomInfo(CampingRoomDto campingRoom);

	
	
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
	ArrayList<CampingQnADto> getCampingQnAList();
	
	ArrayList<GoodsReviewDto> getAdminGoodsReviewList(@Param("startRow") int startRow,@Param("endRow") int endRow);

	int getGoodsReviewTotalCount();

	int updateGoodsReviewState(@Param("gorvcode") int gorvcode,@Param("gorvstate") int gorvstate);

	ArrayList<CampingReviewDto> getAdminCampingReviewList(@Param("startRow") int startRow,@Param("endRow") int endRow);

	int getCampingReviewTotalCount();

	int updateCampingReviewState(@Param("cgrvcode") int cgrvcode,@Param("cgrvstate") int cgrvstate);

	@Insert("INSERT INTO CAMPINGANSWER(CWCODE, CWCQCODE, CWMID, CWCONTENTS, CWDATE) VALUES(#{cwcode}, #{cwcqcode}, #{cwmid}, #{cwcontents}, SYSDATE)")
	int answerWrite(CampingQnADto campingAnswerInfo);

	@Select("SELECT MAX(CWCODE) FROM CAMPINGANSWER")
	String getMaxCwcode();

//	@Select("SELECT * FROM CAMPINGANSWER WHERE CWCODE = #{cwcode}")
	CampingQnADto getCampingQnAInfo(@Param("cqcode") String cqcode);

	@Update("UPDATE CAMPINGANSWER SET CWCONTENTS = #{cwcontents} WHERE CWCODE = #{cwcode}")
	int campingAnswerModify(@Param("cwcode") String cwcode, @Param("cwcontents") String cwcontents);

	@Select("SELECT * FROM CAMPINGANSWER WHERE CWCODE = #{cwcode}")
	CampingQnADto getCampingAnswerInfo(String cwcode);

	ArrayList<GoodsQnADto> getGoodsQnAList();
	@Select("SELECT MAX(GWCODE) FROM GOODSANSWER")
	String getMaxGwcode();
	
	@Insert("INSERT INTO GOODSANSWER(GWCODE, GWGQCODE, GWMID, GWCONTENTS, GWDATE) VALUES(#{gwcode}, #{gwgqcode}, #{gwmid}, #{gwcontents}, SYSDATE)")
	int goodsAnswerWrite(GoodsQnADto goodsAnswerInfo);
   
	GoodsQnADto getGoodsQnAInfo(String gwgqcode);
	
	@Update("UPDATE GOODSANSWER SET GWCONTENTS = #{gwcontents} WHERE GWCODE = #{gwcode}")
	int goodsAnswerModify(@Param("gwcode")String gwcode, @Param("gwcontents")String gwcontents);
	
	@Select("SELECT * FROM GOODSANSWER WHERE GWCODE = #{gwcode}")
	GoodsQnADto getGoodsAnswerInfo(String gwcode);
	
	@Update("UPDATE CAMPINGQUESTION SET CQSTATE = 0 WHERE CQCODE = #{cqcode}")
	int deleteQustion(String cqcode);
    
	@Update("UPDATE GOODSQUESTION SET GQSTATE = 0 WHERE GQCODE = #{gqcode}")
	int deleteGoodsQustion(String gqcode);
    
	int selectMaxCrNum(CampingRoomDto campingRoom);
    
	int addCampingRoom(CampingRoomDto campingRoom);

	ArrayList<ReservationDto> getReservationList(@Param("startRow") int startRow, @Param("endRow") int endRow);

	int getReservationListTotalCount();

	ReservationDto getReservationInfo(@Param("recode") String recode);

	



	

}
