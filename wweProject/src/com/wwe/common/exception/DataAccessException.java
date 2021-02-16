package com.wwe.common.exception;

import com.wwe.common.code.ErrorCode;

//예외처리가 강제되지 않는 예외클래스 생성
public class DataAccessException extends CustomException{
	private static final long serialVersionUID = -6445202136333072827L;

	//SQLException을 unchecked로 감싸기 위해 사용하는 예외
	//반드시 예외에 대한 로그를 남겨야 한다.
	public DataAccessException(ErrorCode error, Exception e) {
		super(error, e);
	}
}