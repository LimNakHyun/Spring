package com.javalec.spring_mybatis.vo;

import org.springframework.stereotype.Component;

@Component
public class CriteriaVO {
	private int num;			//글번호
	private String confirmPwd;		//입력된 비밀번호

	private int nowPage;		//현재 페이지
	private int cntPerPage;		//페이지당 글 개수
	
	private String search;		//검색어
	private String searchType;	//검색타입
	
	private String whatPage;	//로그아웃 시 이동하는 페이지 설정

	public CriteriaVO() {
		this(1, 10);
	}
	
	public CriteriaVO(int nowPage, int cntPerPage) {
		this.nowPage = nowPage;
		this.cntPerPage = cntPerPage;
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	
	public String getSearch() {
		return search;
	}
	
	public void setSearch(String search) {
		this.search = search;
	}
	
	public int getCntPerPage() {
		return cntPerPage;
	}
	
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}

	public String getWhatPage() {
		return whatPage;
	}

	public void setWhatPage(String whatPage) {
		this.whatPage = whatPage;
	}
	
}
