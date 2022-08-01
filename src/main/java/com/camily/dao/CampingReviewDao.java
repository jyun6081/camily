package com.camily.dao;

import java.util.ArrayList;

import com.camily.dto.CampingReviewDto;

public interface CampingReviewDao {

	int writeReview(CampingReviewDao crdo);

	int getMaxCgrvcode();

	int insertCampingReview(CampingReviewDto review);

	ArrayList<CampingReviewDto> selectCampingReviewList();

	CampingReviewDto CampingReviewDetail(int cgrvcode);

	int updateHits(int cgrvcode);

	CampingReviewDto selectCampingReview(int cgrvcode);

	int updateCampingReview(CampingReviewDto cgreview);

	void deleteCampingReview(int cgrvcode);

	String SelectAvgStar(String cacode);

}
