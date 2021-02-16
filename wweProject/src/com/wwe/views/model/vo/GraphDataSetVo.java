package com.wwe.views.model.vo;

import java.util.ArrayList;
import java.util.List;

// graph.jsp 에 넘길 json 객체
public class GraphDataSetVo {
	private String label = "업무달성률"; // 값이름
	private List<Double> data; // 그래프에 나타낼 값
	private List<String> backgroundColor; // 그래프의 배경색
	private List<String> borderColor; // 그래프 테두리 색상
	private int borderWidth = 1; // 그래프 테두리 선 두께
	
	public GraphDataSetVo() {
		super();
		this.data = new ArrayList<Double>();
		this.backgroundColor = new ArrayList<String>();
		this.borderColor = new ArrayList<String>();
	}
	
	// 프로젝트 인원당 데이터를 받는다
	public void SetDataSet(double label, String bgColor, String bdColor) {
		this.data.add(label);
		this.backgroundColor.add(bgColor);
		this.borderColor.add(bdColor);
	}
}
