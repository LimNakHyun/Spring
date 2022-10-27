package com.javalec.spring_mybatis.dao;

import java.util.ArrayList;

import com.javalec.spring_mybatis.dto.ContentDto;

public interface IDao {
	
	public ArrayList<ContentDto> listDao();
	public void writeDao(String board_name, String board_pass, String board_subject, String board_content);
	public ContentDto viewDao(String strID);
	public void deleteDao(String bId);
	
}
