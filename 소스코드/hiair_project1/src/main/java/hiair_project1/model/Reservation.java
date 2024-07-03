package hiair_project1.model;

public class Reservation {
	// 4.12일 추가한 모델 클래스 예약관
	private String userID;
	private String flightID;
	private String name;
	private String departure;
	private String destination;
	private String departureTime;
	private String arrivalTime;
	
	public Reservation () {}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getFlightID() {
		return flightID;
	}

	public void setFlightID(String flightID) {
		this.flightID = flightID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	
	
}
