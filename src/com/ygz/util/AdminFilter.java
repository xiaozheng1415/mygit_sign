package com.ygz.util;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ygz.entity.User;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter({"*.do"})
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
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
		HttpServletRequest request2=(HttpServletRequest)request;
		HttpServletResponse response2=(HttpServletResponse)response;
		HttpSession session=request2.getSession();
		//获取请求路径信息
		String path=request2.getRequestURI();
		User user=(User)session.getAttribute("user");
		String[] noFilter= {"user/login.do","user/logout.do","user/index.do"};
		for(int i=0;i<noFilter.length;i++) {
			if(path.lastIndexOf(noFilter[i]) > -1) {
				chain.doFilter(request, response);
				return;
			}
		}
		if(user!=null) {
			chain.doFilter(request, response);
		}else {
			response2.sendRedirect(request2.getContextPath()+"/user/index.do");
		}
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
