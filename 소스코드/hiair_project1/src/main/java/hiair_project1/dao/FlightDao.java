package hiair_project1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import hiair_project1.model.*;

public class FlightDao implements Flight{ //Flight 인터페이스를 구현
// MyBatis 프레임워크를 사용하여 데이터베이스의 항공편 정보에 접근하는 DAO(Data Access Object)의 역할을 수행
	
	SqlSession ss; // MyBatis와 데이터베이스 사이의 세션
	// 이 객체를 통해 SQL 쿼리 실행, 트랜잭션 관리 등 데이터베이스와의 작업을 수행
	
	public void setSs(SqlSession ss) {// SqlSession 객체를 FlightDao에 주입하기 위한 세터 메서드
		this.ss = ss; //의존성 주입(Dependency Injection)을 사용하여 SqlSession 객체를 설정

}

	@Override
	public List<Flight> selectAll() { //"selectAll"이라는 이름의 SQL 매핑을 사용해 데이터베이스에서 모든 항공편 정보를 조회
		return ss.selectList("selectAll"); //조회된 결과는 List<Flight> 타입으로 반환
	}

	@Override
	public Flight selectOne(String flightID) {
		return ss.selectOne("selectOne", flightID);
		//("selectOne", flightID)을 호출하여, "selectOne"이라는 이름의 SQL 매핑과 flightID 매개변수를 사용해 특정 항공편 정보를 조회. 
		//조회된 항공편 정보는 Flight 타입으로 반환
	}
	
	
}