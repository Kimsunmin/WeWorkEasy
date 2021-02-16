package com.wwe.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.ToAlertException;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.member.model.vo.Member;


public class AuthFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		String[] uriArr = httpRequest.getRequestURI().split("/");
		if(uriArr.length > 0) {
			switch (uriArr[1]) {
			case "project":
				if(session.getAttribute("user") == null) {
					throw new ToAlertException(ErrorCode.AUTH02);
				}else if(uriArr[2].equals("loadpro")) {
					session.removeAttribute("selectProject"); 
					System.out.println("잘삭제됨");
				}
				break;
			case "task":
				// 로그인 안했을시
				if(session.getAttribute("user") == null) {
					throw new ToAlertException(ErrorCode.AUTH02);
				// 로그인은 했으나 프로젝트를 선택 안했을시	
				}else if(session.getAttribute("selectProject") == null) {
					throw new ToAlertException(ErrorCode.AUTH03);
				}
				break;
			case "views":
				// 로그인 안했을시
				if(session.getAttribute("user") == null) {
					throw new ToAlertException(ErrorCode.AUTH02);
				// 로그인은 했으나 프로젝트를 선택 안했을시	
				}else if(session.getAttribute("selectProject") == null) {
					throw new ToAlertException(ErrorCode.AUTH03);
				}
				break;
			case "storage":
				// 로그인 안했을시
				if(session.getAttribute("user") == null) {
					throw new ToAlertException(ErrorCode.AUTH02);
				// 로그인은 했으나 프로젝트를 선택 안했을시	
				}else if(session.getAttribute("selectProject") == null) {
					throw new ToAlertException(ErrorCode.AUTH03);
				}
				break;
			case "leader":
				// 로그인도 했고 프로젝트도 선택했지만
				if(session.getAttribute("user") != null && session.getAttribute("selectProject") != null) {
					Member member = (Member) session.getAttribute("user");
					ProjUser project = (ProjUser) session.getAttribute("selectProject");
					// 로그인한 아이디와 해당 프로젝트의 아이디가 같지 않다면
					if(!project.getLeaderId().equals(member.getUserID())) {
						throw new ToAlertException(ErrorCode.AUTH04);
					}
				}else {
					throw new ToAlertException(ErrorCode.AUTH03);
				}
				break;
			}
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
