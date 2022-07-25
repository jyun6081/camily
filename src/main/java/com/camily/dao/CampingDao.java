package com.camily.dao;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camily.dto.CampingDto;
import com.camily.dto.CampingQuestionDto;
import com.camily.dto.CampingRoomDto;
import com.camily.dto.MemberDto;
import com.camily.dto.ReservationDto;

public interface CampingDao {

	@Insert("INSERT INTO CAMPING(CACODE, CANAME, CALATITUDE, CALONGITUDE, CATYPE, CACONTENTS, CALINECONTENTS, CAPRICE, CAINFO, CAIMAGE) VALUES(#{cacode}, #{caname}, #{calatitude}, #{calongitude}, #{catype}, #{cacontents}, #{calinecontents}, #{caprice}, #{cainfo}, #{caimage})")
	void campingListInput(CampingDto campingDto);

	@Select("SELECT MAX(CACODE) FROM CAMPING")
	String getMaxCacode();

//	@Select("SELECT * FROM (SELECT ROWNUM RN, CAMPING.* FROM CAMPING ORDER BY CACODE) WHERE RN BETWEEN #{startRow} AND #{endRow}")
	ArrayList<CampingDto> getCampingList(@Param("startRow") int startRow, @Param("endRow") int endRow, @Param("type") String type, @Param("searchKeyword") String searchKeyword);

	@Select("SELECT * FROM CAMPING WHERE CACODE = #{cacode}")
	CampingDto campingView(String cacode);

	int getCampTotalCount(@Param("type") String type, @Param("searchKeyword") String searchKeyword);

	@Select("SELECT * FROM CAMPINGROOM WHERE CRCACODE = #{cacode} ORDER BY LPAD(CRNUM, 2, '0')")
	ArrayList<CampingRoomDto> campingRoomList(String cacode);

	@Select("SELECT DISTINCT CRNAME, CRPRICE, CRIMAGE FROM CAMPINGROOM WHERE CRCACODE = #{cacode}")
	ArrayList<CampingRoomDto> campingRoomTypeList(String cacode);

	@Select("SELECT RECRNAME, RECRNUM, REDAY FROM RESERVATION WHERE RECACODE = #{cacode} AND (REDAY BETWEEN TO_DATE(#{startday}, 'MM/DD/YY') AND TO_DATE(#{endday}, 'MM/DD/YY'))")
	ArrayList<ReservationDto> getReserveList(@Param("cacode") String cacode, @Param("startday") String startday, @Param("endday") String endday);

	@Select("SELECT MAX(RECODE) FROM RESERVATION")
	String getmaxrecode();

	@Select("SELECT * FROM CAMPINGROOM WHERE CRCACODE = #{cacode} AND CRNAME = #{roomSel} AND CRNUM = #{numSel}")
	CampingRoomDto getRoomInfo(@Param("cacode") String cacode, @Param("roomSel") String roomSel, @Param("numSel") String numSel);

	@Select("SELECT * FROM MEMBERS WHERE MID = #{loginId}")
	MemberDto getMyInfo(String loginId);

	@Insert("INSERT INTO RESERVATION(RECODE, RECACODE, REMID, REMNAME, REMTEL, REMEMAIL, REREQUEST, RECRNAME, RECRNUM, REPEOPLE, REDAY) VALUES(#{recode}, #{recacode}, #{remid}, #{remname}, #{remtel}, #{rememail}, #{rerequest}, #{recrname}, #{recrnum}, #{repeople}, #{reday})")
	void campingReservation(ReservationDto reservationInfo);

	ArrayList<ReservationDto> getMyReservationList(String loginId);

	@Select("SELECT TO_CHAR(MIN(REDAY), 'YYYY-MM-DD') FROM RESERVATION WHERE RECODE =#{recode}")
	String getStartday(String recode);
	
	@Select("SELECT TO_CHAR(MAX(REDAY), 'YYYY-MM-DD') FROM RESERVATION WHERE RECODE =#{recode}")
	LocalDate getEndday(String recode);

	ReservationDto getMyReservationInfo(@Param("loginId") String loginId, @Param("recode") String recode);

	@Update("UPDATE RESERVATION SET REMNAME = #{remname}, REMTEL = #{remtel}, REMEMAIL= #{rememail}, REREQUEST = #{rerequest} WHERE RECODE = #{recode}")
	int changeReserveMsg(@Param("recode") String recode, @Param("remname") String remname, @Param("remtel") String remtel, @Param("rememail") String rememail, @Param("rerequest") String rerequest);

	@Delete("DELETE FROM RESERVATION WHERE RECODE = #{recode}")
	int cancelReservation(String recode);

	@Select("SELECT MAX(CQCODE) FROM CAMPINGQUESTION")
	String getMaxCqcode();

	@Insert("INSERT INTO CAMPINGQUESTION(CQCODE, CQCACODE, CQMID, CQCONTENTS, CQDATE, CQSTATE) VALUES (#{cqcode}, #{cqcacode}, #{cqmid}, #{cqcontents}, SYSDATE, 1)")
	int questionWrite(CampingQuestionDto campingQustionInfo);

	@Select("SELECT * FROM CAMPINGQUESTION WHERE CQCACODE = #{cacode} ORDER BY CQDATE DESC")
	ArrayList<CampingQuestionDto> campingQuestionList(String cacode);

	@Update("UPDATE CAMPINGQUESTION SET CQCONTENTS = #{cqcontents} WHERE CQCODE = #{cqcode}")
	int questionModify(@Param("cqcode") String cqcode, @Param("cqcontents") String cqcontents);

	@Select("SELECT * FROM CAMPINGQUESTION WHERE CQCODE = #{cqcode}")
	CampingQuestionDto getCampingQuestionInfo(String cqcode);


}
