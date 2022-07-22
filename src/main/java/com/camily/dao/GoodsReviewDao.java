package com.camily.dao;

import java.util.ArrayList;

import com.camily.dto.GoodsReviewDto;

public interface GoodsReviewDao {
	
	ArrayList<GoodsReviewDto> selectGoodsReviewList();

	GoodsReviewDto selectGoodsReviewDetail(int gorvcode);
	
	int getMaxCgcode();

	int insertGoodsReview(GoodsReviewDto grdo);

	void deleteGoodsReview(int gorvcode);

	GoodsReviewDto selectGoodsReview(int gorvcode);

	int updateGoodsReview(GoodsReviewDto goreview);

	int updateHits(int gorvcode);
}
