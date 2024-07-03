package hiair_project1.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import hiair_project1.model.Flight;

@Mapper
public interface FlightMapper {
		
	@Select("SELECT COUNT(*) FROM fli") //fli 테이블에 담긴 게시물의 총 수를 구하는 메소드
	public int count();
	
	@Select("SELECT * FROM fli ORDER BY DepartureTime DESC")//fli 테이블에 담긴 모든 게시글 출발일자 순으로 정렬하여 조회
	public List<Flight> selectAll();
	
	public Flight selectById(String flightID); //flightController에서 selectById를 사용하기 위해 생성자 생성
	
	
	public List<Flight> selectBySearch(
		@Param("departureTime") String departureTime, 
		@Param("departure") String departure, 
		@Param("destination") String destination);

	//페이지 나누기 쿼리 : page : 현재페이지, size : 페이지당 게시물 개수
	public List<Flight> selectByLimit(@Param("start") int start, @Param("end") int end);

}
