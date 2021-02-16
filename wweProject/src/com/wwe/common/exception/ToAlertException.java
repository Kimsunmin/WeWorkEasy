package com.wwe.common.exception;

import com.wwe.common.code.ErrorCode;

public class ToAlertException extends CustomException{
    private static final long serialVersionUID = -3007270838782253360L;

    public ToAlertException(ErrorCode error) {
        super(error);
    }

    public ToAlertException(ErrorCode error, Exception e) {
        super(error, e);
    }
}