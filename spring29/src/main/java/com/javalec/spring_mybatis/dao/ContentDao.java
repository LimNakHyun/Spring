package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.dto.UserDto;
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
	
	public void writeDaoLogin(ContentDto contentDto) {
		idao.writeDaoLogin(contentDto);
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
	
	public void replyDao(ContentDto contentDto) {
		idao.replyDao(contentDto);
	}
	
	public void place(ContentDto contentDto) {
		idao.place(contentDto);
	}
	
	public int biggestPK() {
		return idao.biggestPK();
	}
	
	public int confirmId(UserDto userDto) {
		return idao.confirmId(userDto);
	}
	
	public void registUser(UserDto userDto) {
		idao.registUser(userDto);
	}
	
	public int loginPwd(UserDto userDto) {
		return idao.loginPwd(userDto);
	}

}
