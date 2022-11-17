package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.vo.CriteriaVO;

@Mapper
@Repository("iDao")
public interface IDao {
	
	//게시글 페이징 처리하여 불러오기
	public ArrayList<ContentDto> pagingListDao(CriteriaVO cri);

	//게시글 총 개수
	public int countBoard(CriteriaVO cri);
	
	//게시글 작성
	public void writeDao(ContentDto contentDto);
	
	//게시글 보기
	public ContentDto viewDao(CriteriaVO cri);
	
	//게시글 조회수 증가
	public void cntDao(CriteriaVO cri);
	
	//게시글 삭제
	public void deleteDao(CriteriaVO cri);
	
	//게시글 수정
	public void updateDao(ContentDto contentDto);
	
	//비밀번호 확인
	public int confirmPwd(CriteriaVO cri);
	
}
