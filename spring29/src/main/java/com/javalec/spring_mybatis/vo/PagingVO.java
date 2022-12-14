package com.javalec.spring_mybatis.vo;

import org.springframework.stereotype.Component;

@Component
public class PagingVO {

	private int startPage;		//페이지 목록의 시작 페이지
	private int endPage;		//페이지 목록의 끝 페이지
	
	private int total;			//게시글 총 개수
	private int nowPage;		//현재 페이지
	private int cntPerPage;		//페이지당 글 개수
	
	private int lastPage;		//마지막 페이지
	private int cntPage = 10;	//보여줄 최대 페이지의 개수
	
	private CriteriaVO cri;		//cri 정의
	private String search;		//검색어
	private String searchType;	//검색타입

	public PagingVO() {
		
	}
	
	public PagingVO(CriteriaVO cri, int total) {
		setNowPage(cri.getNowPage());
		setCntPerPage(cri.getCntPerPage());
		setTotal(total);
		setSearch(cri.getSearch());
		setSearchType(cri.getSearchType());
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
	}
	
	//제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	//시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	public CriteriaVO getCri() {
		return cri;
	}

	public void setCri(CriteriaVO cri) {
		this.cri = cri;
	}
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
}
