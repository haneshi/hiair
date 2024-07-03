package hiair_project1.dto;

public class Login { 
//사용자의 로그인 정보를 나타내는 DTO(Data Transfer Object)
//DTO는 계층 간 데이터 교환을 위해 사용되는 객체로, 여기서는 사용자의 로그인 관련 데이터를 전달하는 데 사용
	
	private String userID;
	private String password;
	private String name;
	private String email;
	private String error;
	private String departure;
	private String destination;

	public Login() {}
	
	public Login(String userID, String password, String error, String name, String email, String departure,
					String destination) {
		super();
		this.userID = userID;
		this.password = password;
		this.name = name;
		this.email = email;
		this.error = error;
		this.departure = departure;
		this.destination = destination;
	}
//기본 생성자와 매개변수가 있는 생성자를 동시에 사용하는 목적은 객체의 생성과 초기화 과정에서 유연성과 편의성을 제공하기 위함
//서로 다른 사용 요구 사항과 상황에 맞게 객체를 생성하고 초기화할 수 있는 옵션을 제공
	
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	
	
	

}

