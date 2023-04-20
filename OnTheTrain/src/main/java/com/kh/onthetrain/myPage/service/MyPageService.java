package com.kh.onthetrain.myPage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;

@Service
public interface MyPageService {
	
	// 사용자의 no를 가지고 작성한 문의 게시글을 가져오는 메소드
	List<Qna> getQnaListByMemberNo(int no);
	
	
	// qna를 작성하는 메소드
	int save(Qna qna);

	// 문의 게시글 번호를 가지고 문의 게시글을 찾는 메소드
	Qna findQnaByNo(int no);

	
	// 관리자가 문의 게시글에 답변을 작성하는 메소드
	int insertQnaReply(int qnaNo, String qnamodalreply);

	
	// 문의 게시글 번호를 가지고 문의 답변을 찾는 메소드
	QnaReply findReplyByNo(int no);

		
	}


