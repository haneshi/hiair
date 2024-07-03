package hiair_project1.model;

import java.util.Date;

public class Flight {
//Flight 클래스는 항공편의 정보를 담는 모델
//클래스는 항공편의 고유 식별자, 출발지, 목적지, 출발 시간 및 도착 시간을 속성
//공편 관리 및 예약 시스템에서 핵심적인 데이터를 제공
	
	private String flightID;
	private String Departure;
	private String Destination;
	private String DepartureTime;
	private String ArrivalTime;
	
	public Flight() {}
	// 기본 생성자, 인스턴스를 생성할 때 초기값 없이 항공편 정보를 설정하기 위해 사용
	
	public Flight(String flightID, String Departure, String Destination, String DepartureTime, String ArrivalTime) {
	//모든 항공편 정보를 매개변수로 받아 해당 정보로 인스턴스를 초기화하는 생성자
		super();
		this.flightID = flightID;
		this.Departure = Departure;
		this.Destination = Destination;
		this.DepartureTime = DepartureTime;
		this.ArrivalTime = ArrivalTime;
	}

	public String getFlightID() {
		return flightID;
	}

	public void setFlightID(String flightID) {
		this.flightID = flightID;
	}

	public String getDeparture() {
		return Departure;
	}

	public void setDeparture(String departure) {
		Departure = departure;
	}

	public String getDestination() {
		return Destination;
	}

	public void setDestination(String destination) {
		Destination = destination;
	}

	public String getDepartureTime() {
		return DepartureTime;
	}

	public void setDepartureTime(String departure_Time) {
		DepartureTime = departure_Time;
	}

	public String getArrivalTime() {
		return ArrivalTime;
	}

	public void setArrivalTime(String arrival_Time) {
		ArrivalTime = arrival_Time;
	}


}
