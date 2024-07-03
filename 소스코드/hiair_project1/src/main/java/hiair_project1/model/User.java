package hiair_project1.model;

public class User {
//사용자의 정보를 나타내는 모델
//시스템 내에서 사용자를 구별하는 데 사용

		private String userID;
		private String name;
		private String email;
		private String password;
		private String departure;
		private String destination;
		
		public User() {}
		//기본 생성자, 객체를 생성할 때 초기값 없이 사용자 정보를 설정
		
		public User(String userID, String name, String email, String password, String departure, String destination) {
		//모든 사용자 정보를 매개변수로 받아 해당 정보로 객체를 초기화하는 생성자
		//객체 생성 시 사용자 정보를 한 번에 설정할 수 있게 도와줌
			super();
			this.userID = userID;
			this.name = name;
			this.email = email;
			this.password = password;

		}

		

		public String getUserID() {
			return userID;
		}

		public void setUserID(String userID) {
			this.userID = userID;
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

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
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
