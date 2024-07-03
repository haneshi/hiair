package hiair_project1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hiair_project1.dao.Flight;
import hiair_project1.dto.Pager;
import hiair_project1.model.Reservation;
import hiair_project1.model.User;
import hiair_project1.repository.FlightMapper;
import hiair_project1.repository.ReservationMapper;

@Controller
@RequestMapping
public class ReservationController {
	// 4.12일 이 부분 컨트롤러 전체 작성함

	@Autowired
	private ReservationMapper reservationMapper;

	private final FlightMapper flightMapper;

	public ReservationController(FlightMapper flightMapper) {
		this.flightMapper = flightMapper;
	}

	// 선택한 항공일정 예약테이블에 내 정보(로그인한 유저) 담기
	@PostMapping("/flights/view/{flightId}/reservation")
	public String createReservation(@PathVariable("flightId") String flightId,
			@ModelAttribute("reservation") Reservation reservation, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(); // session 가져오기
		User user = (User) session.getAttribute("user"); // 로그인 되어있는 유저정보 session으로 읽어와서 담
		System.out.println("로그인 정보 읽어오는 Session은 ? : " + session);
		session.setMaxInactiveInterval(1800);

		if (user != null) {
			String userId = user.getUserID();
			System.out.println("Session에서 읽어온 userId : " + userId);

			reservation.setUserID(userId); // 예약테이블? 예약하는 곳에 userId 세팅
			reservation.setFlightID(flightId); // 예약테이블? 예약하는 곳에 flightID 세팅

			reservationMapper.createReservation(reservation); // 쿼리문으로 보내기 insert문으로 보낸것임

			return "redirect:/home";
		} else {
			return "redirect:/login";
		}

	}

	// 예약 상세조회 메서드
	@GetMapping("/reservation")
	public String showReservationPage(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");

		String userId = user.getUserID();

		List<Reservation> reservations = reservationMapper.selectReservationByUserID(userId);

		model.addAttribute("reservations", reservations);

		System.out.println("session에서 가져온 userId : " + userId); // 잘 동작 함
		System.out.println("Mapper Interface에서 가져온 예약 내역 : " + reservations);

		// 각 예약 정보 출력 값을 잘 가져오나 출력해보는 것
		for (Reservation reservation : reservations) {
			System.out.println("FlightID: " + reservation.getFlightID());
			System.out.println("Name: " + user.getName());
			System.out.println("Departure: " + reservation.getDeparture());
			System.out.println("Destination: " + reservation.getDestination());
			System.out.println("DepartureTime: " + reservation.getDepartureTime());
			System.out.println("ArrivalTime: " + reservation.getArrivalTime());
			System.out.println("--------------------------------------");
		}

		return "/reservation";
	}

	// 예약삭제 메서드
	@PostMapping("/reservationDelete/{flightID}")
	public String deleteReservationByFlightID(@PathVariable String flightID) {
	    reservationMapper.deleteReservationByFlightID(flightID);
	    return "redirect:/home";
	}

}
