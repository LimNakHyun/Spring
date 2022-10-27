package com.javalec.spring_mybatis.dao;

//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.PreparedStatementCreator;
//import org.springframework.jdbc.core.PreparedStatementSetter;

import com.javalec.spring_mybatis.dto.ContentDto;

public class ContentDao implements IDao{

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public ContentDao() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public ArrayList<ContentDto> listDao() {
//		String query = "select * from board2 order by mId desc";
//		ArrayList<ContentDto> dtos = (ArrayList<ContentDto>) template.query(query, new BeanPropertyRowMapper<ContentDto>(ContentDto.class));
//		return dtos;
		return null;
	}
	
	
	@Override
	public void writeDao(final String board_name, final String board_pass, final String board_subject, final String board_content) {
//		System.out.println("writeDao()");
//		
//		this.template.update(new PreparedStatementCreator() {
//			
//			@Override
//			public PreparedStatement createPreparedStatement(Connection con)
//					throws SQLException {
//				String query = "insert into board2 (mWriter, mContent) values (?, ?)";
//				PreparedStatement pstmt = con.prepareStatement(query);
//				pstmt.setString(1, mWriter);
//				pstmt.setString(2, mContent);
//				return pstmt;
//			}
//		});
//		return null;
		
	}

	
	@Override
	public ContentDto viewDao(String strID) {
//		System.out.println("viewDao()");
//		
//		String query = "select * from board2 where mId = " + strID;
//		return template.queryForObject(query, new BeanPropertyRowMapper<ContentDto>(ContentDto.class));
		return null;
	}

	
	@Override
	public void deleteDao(final String bId) {
//		System.out.println("deleteDao()");
//		
//		String query = "delete from board2 where mId = ?";
//		this.template.update(query, new PreparedStatementSetter() {
//			
//			@Override
//			public void setValues(PreparedStatement ps) throws SQLException {
//				ps.setInt(1, Integer.parseInt(bId));
//			}
//		});
//		return null;
		
	}

}
