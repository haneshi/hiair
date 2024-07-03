package hiair_project1.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hiair_project1.dto.Pager;
import hiair_project1.repository.FlightMapper;
import hiair_project1.model.User;
import hiair_project1.model.Flight;


@Controller 
@RequestMapping("/flights") 
public class FlightController { ///flights 경로에 대한 요청을 처리하는 컨트롤러
	
	@Autowired
	private FlightMapper flightMapper;
	
	
	@GetMapping() //기본 경로에 대한 GET 요청을 처리
	public ModelAndView getFlightView( // 항공편 1~10 목록을 가져와 뷰에 전달
			@RequestParam(name="page", required = false, defaultValue = "1") int page,
			@RequestParam(name="size", required = false, defaultValue = "10") int size,
			@RequestParam(name="bsize", required = false, defaultValue = "10") int bsize) {
			ModelAndView mav = new ModelAndView("flight_list");
		
		int start = Pager.Start(page, size);
		int end = Pager.End(page, size);
				
		List <Flight> flights = flightMapper.selectByLimit(start, end);
		mav.addObject("flights", flights); //특정 범위의 항공편 목록을 조회
		System.out.println(flights);
		mav.addObject("pager", new Pager(page, size, bsize, flightMapper.count()));	
		for(int i=0; i < flights.size() ; i++) { //조회된 항공편 목록의 각 항공편에 대해, 항공편 ID, 출발 시간, 도착 시간을 콘솔에 출력
			System.out.println(flights.get(i).getFlightID());
			System.out.println(flights.get(i).getDepartureTime());
			System.out.println(flights.get(i).getArrivalTime());
		}		
		System.out.println("뿌려주기 성공");
		return mav; //ModelAndView 객체를 반환
	}
	
	@GetMapping("/view/{flightID}") //특정 항공편의 상세 정보를 가져와 뷰에 전달
	public String getFlightView(@PathVariable String flightID, HttpSession session, Model model) {
		User user  = (User)session.getAttribute("user");
		if(user==null) { //유저정보 없으면 
			return "redirect:/login"; //로그인페이지로 리다이렉트
		}
		model.addAttribute("flight",flightMapper.selectById(flightID));
		System.out.println("상세보기 성공");//flightID 기준 상세보기 진행
		return "flight_view";
		}
		
	}
