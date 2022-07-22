package com.camily.dao;

import java.util.ArrayList;

import com.camily.dto.ReplyDto;

public interface ReplyDao {
	
	ArrayList<ReplyDto> selectReplyList(int bocode);

	int getMaxRpcode();

	int insertReplyWrite(ReplyDto reply);
	
	int deleteReply(int delRno);

	ReplyDto selectReplyInfo(String rpcode);

	int updateReply(ReplyDto reply);


	



}
