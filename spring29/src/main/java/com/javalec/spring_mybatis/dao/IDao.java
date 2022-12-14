package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.dto.UserDto;
import com.javalec.spring_mybatis.vo.CriteriaVO;

@Mapper
@Repository("iDao")
public interface IDao {
	
	//게시글 페이징 처리하여 불러오기
	public ArrayList<ContentDto> pagingListDao(CriteriaVO cri);

	//게시글 총 개수
	public int countBoard(CriteriaVO cri);
	
	//비로그인 상태 게시글 작성
	public void writeDao(ContentDto contentDto);
	
	//로그인 상태 게시글 작성
	public void writeDaoLogin(ContentDto contentDto);
	
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
	
	//답글달기
	public void replyDao(ContentDto contentDto);
	
	//답글 끼워넣을 자리 만들기
	public void place(ContentDto contentDto);
	
	//가장 큰 PK를 찾기
	public int biggestPK();
	
	//회원가입 시 아이디 중복체크
	public int confirmId(UserDto userDto);
	
	//회원 테이블에 가입한 회원 추가
	public void registUser(UserDto userDto);
	
	//로그인 할 때, 아이디가 맞을 경우 비밀번호가 맞는지 체크
	public int loginPwd(UserDto userDto);
	
}
