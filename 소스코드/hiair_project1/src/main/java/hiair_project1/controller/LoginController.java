package hiair_project1.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;


import hiair_project1.dto.Login;
import hiair_project1.service.LoginService;
import hiair_project1.model.User;

@Controller //사용자 요청이 진입하는 지점
public class LoginController { //LoginController 클래스
	
	@Autowired
	private LoginService loginService; //사용자 인증 로직 처리를 위해 접근제한자 선언
	
	@ModelAttribute("active") //active 모델 속성 반환
	public String active() {
		return "signup";
	}
	
	@GetMapping("/signup")
	public String getSignupView() { // signup 페이지 뷰를 반환, 클라이언트(웹 브라우저)에게 회원가입 페이지를 보여준다
	System.out.println("반환 성공");
		return "signup";
	}
	
	@GetMapping("/login")
	public String getLoginView() { // 로그인 페이지 뷰를 반환, 클라이언트(웹 브라우저)에게 로그인 페이지를 보여준다
		return "login";
	}
	
	@PostMapping("/login") //POST 요청이 /login 경로로 들어왔을 때 호출되는 메서드
	public String postLogin(Login login, Model model, HttpSession session) { 
		//login : 사용자가 입력한 로그인 정보를 담은 객체
		//model : 뷰에 전달할 데이터를 담은 객체
		//session : 사용자 세션 정보를 관리하는 세션 객체
		loginService.authenticate(login); // LoginService의 authenticate 메서드를 호출하여 로그인 인증을 시도
		
		if (login.getError() != null) { // 인증 과정 중 에러가 발생한 경우
			model.addAttribute("error", login.getError()); //에러 메시지 모델에 추가
			model.addAttribute("login", login); //로그인정보 모델에 추가
			return "login";
		} else { //인증 성공 시
			User user = new User(login.getUserID(),login.getPassword(), login.getEmail(), login.getName(), login.getDeparture()
					, login.getDestination());
			//로그인 정보를 기반으로 User 객체를 생성
			session.setAttribute("user", user); //세션에 사용자 정보를 저장
			System.out.println("인증 성공");
			return "redirect:/home";
			
		}
	}
	
	@GetMapping("/logout") //GET 요청이 /logout 경로로 들어왔을 때 호출되는 메서드
	public String getLogout(HttpSession session) {//현재 사용자의 세션 정보를 관리하는 세션 객체
		session.invalidate(); //세션을 무효화하여 사용자를 로그아웃 상태로 변환
		return "login";
	}
	
	

}
