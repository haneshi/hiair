package hiair_project1.dao;

import java.util.List;
import hiair_project1.model.*;

public interface Flight { 
	//DAO 패턴은 데이터베이스의 데이터에 접근하는 로직과 비즈니스 로직을 분리하기 위해 사용되는 패턴
	
	public List<Flight> selectAll(); 
	//저장된 모든 항공편 정보를 조회하여 반환하는 기능으로 리스트 형태로 가져옴
	public Flight selectOne(String flightID);
	//특정 항공편의 식별자(flightID)를 매개변수로 받아 해당 항공편의 정보를 조회하여 반환하는 기능
	//특정 항공편에 대한 상세 정보를 조회하는 로직을 구현할 때 사용
}
