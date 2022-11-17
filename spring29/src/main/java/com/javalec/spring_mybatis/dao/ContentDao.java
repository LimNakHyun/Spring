package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.vo.CriteriaVO;

@Service("contentDao")
public class ContentDao {
	
	@Autowired
	private IDao idao;
	
	public ArrayList<ContentDto> pagingListDao(CriteriaVO cri) {
		return idao.pagingListDao(cri);
	}
	
	public int countBoard(CriteriaVO cri) {
		return idao.countBoard(cri);
	}
	
	public void writeDao(ContentDto contentDto) {
		idao.writeDao(contentDto);
	}
	
	public ContentDto viewDao(CriteriaVO cri) {
		return idao.viewDao(cri);
	}
	
	public void deleteDao(CriteriaVO cri) { 
		idao.deleteDao(cri);
	}

	public void cntDao(CriteriaVO cri) {
		idao.cntDao(cri);
	}

	public void updateDao(ContentDto contentDto) {
		idao.updateDao(contentDto);
	}

	public int confirmPwd(CriteriaVO cri) {
		return idao.confirmPwd(cri);
	}

}
