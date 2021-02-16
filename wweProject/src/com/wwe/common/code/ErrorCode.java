package com.wwe.common.code;

public enum ErrorCode {
	SM01("회원정보를 조회하는 도중 에러가 발생하였습니다"),
	SM02("프로젝트의 팀원리스트를 조회하는 도중 에러가 발생했습니다."),
	DP01("프로젝트를 삭제하는 도중 에러가 발생했습니다."),
	IN01("이미 초대된 팀원입니다.","/leader/manage"),
	UU01("팀원의 권한을 변경하는 도중 에러가 발했습니다."),
	SC01("검색한 업무를 조회하는 도중 에러가 발생했습니다."),
	UT01("업무를 수정하는 도중 에러가 발생했습니다."),
	UT02("업무상태를 변경하는 도중 에러가 발생했습니다.","/task/my"),
	DT01("업무를 삭제하는 도중 에러가 발생했습니다."),
	DU01("팀원을 삭제하는 도중 에러가 발생했습니다."),
	UA01("팀원의 권한을 조회하는 도중 에러가 발생했습니다."),
	TK01("업무리스트를 조회하는 도중 에러가 발생했습니다."),
	TK02("업무를 추가하는 도중 에러가 발생했습니다.","/task/my"),
	FK01("피드백을 추가하는 도중 에러가 발생했습니다.","/task/detail"),
	FK02("피드백을 삭제하는 도중 에러가 발생했습니다.","/task/detail"),
	UM01("회원정보 수정 중 에러가 발생하였습니다."),
	DM01("회원정보 삭제 중 에러가 발생하였습니다."),
	//SB01("게시판 정보를 조회하는 도중 에러가 발생","/board/list"(에러발생시 이동할 페이지));
	//		+ dao의 해당 메서드의 throw new DataAccessException에 (ErrorCode.SB01,e) 추가
	// 	  (에러 관리 시 이 ErrorCode 페이지만 보면 됨 - 유지보수 및 기능확장에 용이)
	SB01("게시글 정보를 조회하는 도중 에러가 발생했습니다."),
	SF01("파일 정보를 조회하는 도중 에러가 발생했습니다."),
	IB01("게시글 등록 중 에러가 발생했습니다."),
	IF01("파일정보 등록 중 에러가 발생했습니다."),
	MAIL01("메일 발송 중 에러가 발생하였습니다."),
	API01("API통신 도중 에러가 발생하였습니다."),
	CD_404("존재하지 않는 경로입니다."),
	AUTH01("해당 페이지에 접근하실 수 없습니다."), // 경로 지정 안하면 기본경로: index
	AUTH02("로그인 이후 사용하실 수 있습니다."),
	AUTH03("프로젝트 선택 이후 사용하실 수 있습니다.","/project/loadpro"),
	AUTH04("페이지 접근 권한이 없습니다.","/task/main"),
	FILE01("파일업로드중 예외가 발생하였습니다.");
	
	//result.jsp를 사용해 띄울 안내문구
	private String errMsg;
	//result.jsp를 사용해 이동시킬 경로
	private String url = "/index";
	
	//index로 이동시킬 경우
	ErrorCode(String errMsg) {
		this.errMsg = errMsg;
	}
	
	//index 외의 지정 페이지로 이동시킬 경우
	ErrorCode(String errMsg, String url) {
		this.errMsg = errMsg;
		this.url = url;
	}
	
	//errMsg getter
	public String errMsg() {
		return errMsg;
	}
	
	//url getter
	public String url() {
		return url;
	}
}
