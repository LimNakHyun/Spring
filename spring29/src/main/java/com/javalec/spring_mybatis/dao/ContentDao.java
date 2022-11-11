package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.vo.PagingVO;


@Service("contentDao")
public class ContentDao {
	
	@Autowired
	private IDao idao;
	
//	public ArrayList<ContentDto> listDao() {
//		return idao.listDao();
//	}
	
	public ArrayList<ContentDto> pagingListDao(PagingVO vo) {
		return idao.pagingListDao(vo);
	}
	
	public ArrayList<ContentDto> pagingListDaoSearch(PagingVO vo, String search) {
		return idao.pagingListDaoSearch(vo, search);
	}
	
	public void writeDao(final String usrname, final String pwd, final String subject, final String content) { 
		idao.writeDao(usrname, pwd, subject, content);
	}
	
	public ContentDto viewDao(final int num) {
		return idao.viewDao(num);
	}
	
	public void deleteDao(final String num) { 
		idao.deleteDao(num);
	}

	public void cntDao(int num) { 
		idao.cntDao(num);
	}
	
//	public ArrayList<ContentDto> searchDao(String search) {
//		return idao.searchDao(search);
//	}

	public void updateDao(String subject, String content, String num) {
		idao.updateDao(subject, content, num);
	}

	public ContentDto confirmPwd(int num, String confirmPwd) {
		return idao.confirmPwd(num, confirmPwd);
	}
	
	public int countBoard() {
		return idao.countBoard();
	}

}
