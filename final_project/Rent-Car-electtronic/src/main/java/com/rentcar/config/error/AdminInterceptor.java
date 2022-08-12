package com.rentcar.config.error;


import com.rentcar.utility.Utility;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class AdminInterceptor implements HandlerInterceptor {
    // URL 요청후 컨트롤러 작동전에 실행함.
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(true);
        String grade = Utility.checkNull((String) session.getAttribute("grade"));
        System.out.println(grade);
        if (grade.length() != 0 && grade.compareTo("A") == 0) {
            System.out.println("접속 권한 있음: " + grade);
            return true;
        } else {
            response.sendRedirect("/error404");
            return false;
        }
    }

    // 요청 주소 결과 생성후 작동함
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle executed.");
        modelAndView.addObject("admin", "관리자 관련 기능을 출력합니다.");
    }

    // JSP등 View 페이지 출력전에 작동됨.
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println("관리자 Interceptor 실행 후 최종 출력됨.");
    }
}