package hiair_project1.controller;

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
import org.springframework.web.servlet.ModelAndView;

import hiair_project1.dto.Pager;
import hiair_project1.repository.FlightMapper;
import hiair_project1.model.Flight;

@Controller //사용자 요청이 진입하는 지점
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
    private FlightMapper flightMapper;
	
	@GetMapping()
	public String searchFlights(
	    @RequestParam(name = "departureTime", required = false) String departureTime,
	    @RequestParam(name = "departure", required = false) String departure,
	    @RequestParam(name = "destination", required = false) String destination,
	    Model model) {
		
		System.out.println("파라미터 출력 : "+departureTime + departure + destination);
	    // 받아온 정보를 모델에 추가하여 뷰로 전달
		
		List<Flight> searchs = flightMapper.selectBySearch(departureTime, departure, destination);
	    model.addAttribute("flights", searchs);
	    if(searchs!=null) {
	    	System.out.println("searchs에 담긴 내용은 : " + searchs);
	    	System.out.println(departureTime);
	    	System.out.println(departure);
	    	System.out.println(destination);
	    }else {
	    	System.out.println("null");
	    }
	    System.out.println("조회 완료");
	    return "search";

	}

}
