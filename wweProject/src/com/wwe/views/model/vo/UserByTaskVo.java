package com.wwe.views.model.vo;

// calendar.jsp 에 전달할 json 객체
public class UserByTaskVo {

	private String title; // 업무이름
	private String start; // 시작일자
	private String end; // 마감일자
	private String color; // 색상

	public UserByTaskVo(String title, String start, String end,String color) {
		super();
		this.title = title;
		this.start = "20"+start.replace("/", "-");
		this.end = end.substring(0, 10);
		this.color = color;
	}

}
