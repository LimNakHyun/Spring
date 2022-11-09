package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.spring_mybatis.dto.ContentDto;

@Mapper
@Repository("iDao")
public interface IDao {
	
	public ArrayList<ContentDto> listDao();
	public ArrayList<ContentDto> searchDao(String search);
	public void writeDao(String usrname, String pwd, String subject, String content);
	public ContentDto viewDao(int num);
	public void cntDao(int num);
	public void deleteDao(String num);
	public void updateDao(String subject, String content, String num);
	public ContentDto confirmPwd(int num, String confirmPwd);
}
