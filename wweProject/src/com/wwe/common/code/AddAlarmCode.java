package com.wwe.common.code;

public enum AddAlarmCode {
	
	IT01("업무"), //insert Task
	IU01("인원"),	 //insert user
	IU02("초대"),	//invite user
	IF01("파일"), // insert file
	DT01("업무삭제"), //delete task
	UT01("업무수정"), //update tasks
	DM01("팀원삭제"), //delete Member
	DP01("프로젝트삭제"), //delete Project
	UU01("권한수정"), //권한수정
	UL01("팀장변경");
	
	
	//result.jsp를 사용해 띄울 안내문구
	private String alarmCode;

	//index로 이동시킬 경우
	AddAlarmCode(String alarmCode) {
		this.alarmCode = alarmCode;
	}
	
	//alarmCode getter
	public String alarmCode() {
		return alarmCode;
	}
	
	
}
