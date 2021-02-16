package com.wwe.common.exception;

import com.wwe.common.code.ErrorCode;

public class CustomException extends RuntimeException{

	private static final long serialVersionUID = 7531344378242001266L;
	public ErrorCode error;

	//1. 실제로 예외가 발생한 것이 아니라, 우리가 지정한 예외상황에 대한
	//예외처리를 위한 생성자. ** stackTrace를 찍지 않는다.
	public CustomException(ErrorCode error) {
		this.error = error;
		//stackTrace를 공백으로 초기화 
		this.setStackTrace(new StackTraceElement[0]);
	}

	public CustomException(ErrorCode error, Exception e) {
		//console창에 발생한 에러(e) 기록
		e.printStackTrace();
		
		//전달받은 enum(dao에서 넘겨준 enum(예: ErrorCode.IM01))을 
		//변수 error에 저장
		this.error = error;
		
		//Dao에서 DataAccessException로 enum 넣고
		//service에서 ToAlertException로 enum넣으면 
		//새로 enum을 생성하는 게 아니라
		//이미 DataAccessException에 있던 enum을 본인거로 가져오는 것
		//(enum은 상수임 => 변동x)
	}
}