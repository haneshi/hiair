package hiair_project1.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

	@GetMapping
	public String getHomeView(HttpServletRequest request) {
		//home 경로로 들어오는 GET요청 처리 후 home으로 반환 및 뷰 랜더링
		return "home";
	}

}
