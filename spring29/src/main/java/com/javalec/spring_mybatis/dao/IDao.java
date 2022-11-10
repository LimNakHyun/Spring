package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.vo.PagingVO;

@Mapper
@Repository("iDao")
public interface IDao {
	
	//게시글 불러오기
	public ArrayList<ContentDto> listDao();
	
	//게시글 페이징 처리하여 불러오기
	public ArrayList<ContentDto> pagingListDao(PagingVO vo);
	
	//검색어로 게시글 불러오기
	public ArrayList<ContentDto> searchDao(String search);
	
	//게시글 작성
	public void writeDao(String usrname, String pwd, String subject, String content);
	
	//게시글 보기
	public ContentDto viewDao(int num);
	
	//게시글 조회수 증가
	public void cntDao(int num);
	
	//게시글 삭제
	public void deleteDao(String num);
	
	//게시글 수정
	public void updateDao(String subject, String content, String num);
	
	//비밀번호 확인
	public ContentDto confirmPwd(int num, String confirmPwd);
	
	//게시글 총 개수
	public int countBoard();
}
