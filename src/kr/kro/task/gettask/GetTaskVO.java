package kr.kro.task.gettask;

import java.sql.Date;

public class GetTaskVO {
	private int wrnum;
	private	Date day;
	private String classid;
	private String title;
	private String content;
	
	public GetTaskVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GetTaskVO(int wrnum, Date day, String classid, String title, String content) {
		super();
		this.wrnum = wrnum;
		this.day = day;
		this.classid = classid;
		this.title = title;
		this.content = content;
	}

	public int getWrnum() {
		return wrnum;
	}

	public Date getDay() {
		return day;
	}

	public String getClassid() {
		return classid;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public void setWrnum(int wrnum) {
		this.wrnum = wrnum;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
