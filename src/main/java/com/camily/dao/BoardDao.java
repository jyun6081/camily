package com.camily.dao;

import java.util.ArrayList;

import com.camily.dto.BoardDto;
import com.camily.dto.FAQDto;
import com.camily.dto.ReplyDto;

public interface BoardDao {

	ArrayList<BoardDto> selectBoardList();

	BoardDto selectBoardView(int bocode);

	ArrayList<ReplyDto> selectReplyList(int bocode);

	int insertBoard(BoardDto bo);

	int getMaxBocode();

	void deleteBoard(int bocode);

	BoardDto selectBoard(int bocode);

	int updateBoard(BoardDto board);

	ArrayList<FAQDto> selectFAQList();

	int getFAQMaxBocode();

	int insertFAQ(FAQDto faq);

	FAQDto selectFAQView(int faqcode);

	FAQDto selectFAQ(int faqcode);

	int updateFAQ(FAQDto faq);

	int deleteFAQ(int faqcode);

	int updateHits(int bocode);

	int updateFAQHits(int faqcode);

}
