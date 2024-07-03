package hiair_project1.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hiair_project1.model.User;
import hiair_project1.repository.UserMapper;

@Controller //사용자 요청 진입 지점
@RequestMapping("/users") // 이 클래스의 모든 요청은 /users 경로로 시작
public class UserController {
	@Autowired // UserMapper 타입의 userMapper 변수를 자동으로 주입
	private UserMapper userMapper;
	
	@GetMapping //HTTP GET 요청이 /users 경로로 들어왔을 때 호출되는 메서드
	@ResponseBody //메서드의 반환 값을 HTTP 응답 본문에 직접 쓰겠다는 것을 나타냄
	public Object getUserView() { //모든 사용자 정보를 DB에서 조회 후 사용자 정보 반환
		List<User> users = userMapper.selectAll();
		return users;
	}
	
	@PostMapping("/enroll") //HTTP POST 요청이 /users/enroll 경로로 들어왔을 때 호출되는 메서드
	public String postUser(User user, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		//새로운 사용자 정보를 등록하거나 등록에 실패한 경우 에러 메시지를 전달
		User duplicatedUser = userMapper.selectByUserID(user.getUserID());//입력된 userID로 이미 등록된 사용자가 있는지 조회
		if(duplicatedUser == null) { // 등록된 사용자가 없는 경우 
			userMapper.insert(user); // 새로운 사용자 정보를 DB에 등록
			redirectAttributes.addFlashAttribute("result", "OK"); //리다이렉트 시 "result" 속성에 "OK" 값을 전달
		}else {
			redirectAttributes.addFlashAttribute("result", "FAIL"); //리다이렉트 시 "result" 속성에 "FAIL" 값을 전달
			redirectAttributes.addFlashAttribute("error", "중복된 ID입니다.");//리다이렉트 시 "error" 속성에 에러 메시지를 전달
		}
		return "redirect:/signup";
	}
}
