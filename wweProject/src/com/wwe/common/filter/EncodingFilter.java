package com.wwe.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");

		// ServletResponse 객체에는 setHeader() 가 없기 때문에
		// contentType을 지정할 수 있게 해주는 setContentType 메서드 사용
		response.setContentType("text/html; charset=UTF-8");

		// 같은 url-pattern 으로 여러개의 filter를 지정할 수 있다.
		// 해당 filter 들은 filter-chain형태로 관리되며, web.xml에 등록한 순서대로 실행된다.
		// 필터체인을 탐색해 다음 필터가 있다면 다음 필터의 doFilter 메서드를 호출
		// 다음 필터가 없다면 servlet을 호출한다.
		chain.doFilter(request, response);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
