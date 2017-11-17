package com.hck.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class downFilter
 */
@WebFilter(urlPatterns = { "/downFilter" }, servletNames = { "downAction" })
public class downFilter implements Filter {

    /**
     * Default constructor. 
     */
    public downFilter() {
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
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req =(HttpServletRequest)request;
		String who = (String) req.getSession().getAttribute("user");
		if(who !=null) {
			System.out.println("用户："+who+"要下载");
			chain.doFilter(request, response);
		}else {
			req.setAttribute("erro", "请登录");
			req.getRequestDispatcher("/view/login.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
