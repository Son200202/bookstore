package com.bookstore.intercepter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@SuppressWarnings("deprecation")
public class KhachHangIntercepter extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("Loggerinterceptor.preHandle()");
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null){
			response.sendRedirect(request.getContextPath() + "/web/login");
			return false;
		}
	
		return true;
	}
	
}
