package com.springmvc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter  implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		String url=req.getRequestURL().toString();
		if(url.indexOf("index.jsp")>=0){
			chain.doFilter(request, response);
		}
		else if(req.getSession().getAttribute("user")!=null){
			chain.doFilter(request, response);
		}else{
			HttpServletResponse res=(HttpServletResponse)response;
			res.sendRedirect("/index.jsp");
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
