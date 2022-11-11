package com.javalec.spring_mybatis.dto;

import java.sql.Timestamp;

public class ContentDto {

	private int numbering;
	private int num;
	private String usrname;
	private String pwd;
	private String subject;
	private String content;
//	private int board_re_ref;
//	private int board_re_lev;
//	private int board_re_step;
	private int cnt;
	private Timestamp date;
	private boolean delyn;
	private Timestamp deldate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUsrname() {
		return usrname;
	}
	public void setUsrname(String usrname) {
		this.usrname = usrname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public boolean isDelyn() {
		return delyn;
	}
	public void setDelyn(boolean delyn) {
		this.delyn = delyn;
	}
	public Timestamp getDeldate() {
		return deldate;
	}
	public void setDeldate(Timestamp deldate) {
		this.deldate = deldate;
	}
	public int getNumbering() {
		return numbering;
	}
	public void setNumbering(int numbering) {
		this.numbering = numbering;
	}
	
	
//	private int mId;
//	private String mWriter;
//	private String mContent;
//
//	public ContentDto() {
//		// TODO Auto-generated constructor stub
//	}
//	
//	public ContentDto(int mId, String mWriter, String mContent) {
//		this.mId = mId;
//		this.mWriter = mWriter;
//		this.mContent = mContent;
//	}
//
//	public int getmId() {
//		return mId;
//	}
//
//	public void setmId(int mId) {
//		this.mId = mId;
//	}
//
//	public String getmWriter() {
//		return mWriter;
//	}
//
//	public void setmWriter(String mWriter) {
//		this.mWriter = mWriter;
//	}
//
//	public String getmContent() {
//		return mContent;
//	}
//
//	public void setmContent(String mContent) {
//		this.mContent = mContent;
//	}

}
