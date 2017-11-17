package com.hck.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class encoding implements Filter{
	private String encoding = null;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//获取配置的编码方式，默认为utf-8
		if( null != filterConfig.getInitParameter("code")){
			encoding = filterConfig.getInitParameter("code");
		}else{
			encoding = "utf-8";
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}
