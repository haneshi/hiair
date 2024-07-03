package hiair_project1.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import hiair_project1.model.User;

@Component
//LoginInterceptor 클래스가 스프링의 컴포넌트 스캔 메커니즘에 의해 자동으로 빈으로 등록될 수 있음을 나타냄
public class LoginInterceptor extends HandlerInterceptorAdapter{
//HandlerInterceptorAdapter를 상속받아, HTTP 요청 처리 전에 실행될 로직을 정의
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null) {
			String url = session.getServletContext().getContextPath() + "/login";
			response.sendRedirect(url);
			System.out.println("LoginInterceptor # preHandle() : NO PASS");
			return false;
			//user 객체가 null인 경우, 즉 사용자가 로그인하지 않은 경우, 로그인 페이지로 리다이렉트 후 콜솔에 NO PASS 출력
		}
		System.out.println("LoginInterceptor # preHandle() : PASS");
		return true;
		//사용자가 로그인한 경우 PASS"를 콘솔에 출력하고 true를 반환하여 요청 처리가 계속 진행
	}
	
}
