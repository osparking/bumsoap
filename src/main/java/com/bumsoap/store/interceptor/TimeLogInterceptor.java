package com.bumsoap.store.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class TimeLogInterceptor implements HandlerInterceptor {

  private static final Logger LOGGER = 
      Logger.getLogger(TimeLogInterceptor.class);
  
  @Override
  public boolean preHandle(HttpServletRequest request, 
      HttpServletResponse response, Object handler) 
          throws Exception {
    if (request.getRequestURI().equals("/store/soaps")) {
      long startTime = System.currentTimeMillis();
      request.setAttribute("startTime", startTime);
    }

    return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, 
      HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    
    if (request.getRequestURI().equals("/store/soaps")) {
      String queryString = request.getQueryString() == null ?
          "" : "?" + request.getQueryString();
      String path = request.getRequestURL() + queryString;
  
      long startTime = (Long) request.getAttribute("startTime");
      long endTime = System.currentTimeMillis();
  
      LOGGER.info(String.format("%s processing time(ms) : %s.",
          path, (endTime - startTime)));
    }
  }

  @Override
  public void afterCompletion(HttpServletRequest request, 
      HttpServletResponse response, Object handler, Exception ex)
      throws Exception {
  }

}
