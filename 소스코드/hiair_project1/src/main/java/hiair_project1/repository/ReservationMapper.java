package hiair_project1.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import hiair_project1.model.Reservation;

@Mapper
public interface ReservationMapper {
	// 4.12일 정창열님 파일에 합치는 중 이 주석이 보인다면 추가된 내용임

	// 예약 하는 메서드
	@Insert("INSERT INTO reservation (userID, flightID, departure, destination,\n"
			+ "		departureTime, arrivalTime)\n"
			+ "		VALUES (#{userID,jdbcType=VARCHAR}, #{flightID,jdbcType=VARCHAR},\n"
			+ "		#{departure,jdbcType=VARCHAR},\n"
			+ "		#{destination,jdbcType=VARCHAR}, #{departureTime,jdbcType=VARCHAR}, #{arrivalTime,jdbcType=VARCHAR})")
	void createReservation(Reservation reservation);

	// 예약 내역 조회 메서드 reservation.jsp 파일에 보여지는 부분
	@Select("SELECT r.*, f.FlightID, u.name, f.departure, f.destination, f.departureTime, f.arrivalTime \n"
			+ "FROM Reservation r \n"
			+ "JOIN Fli f ON r.FlightID = f.FlightID \n"
			+ "JOIN Users u ON r.UserID = u.UserID \n"
			+ "WHERE r.UserID = #{userID, jdbcType=VARCHAR}")
	List<Reservation> selectReservationByUserID(String userID);

	// 예약 변경 메서드 (기능 구현 못함 사용 안할 듯)
	void updateReservation(Reservation reservation);

	// 예약 삭제 메서드
	@Delete("DELETE FROM reservation\n"
			+ "WHERE FlightID = #{flightID}")
	void deleteReservationByFlightID(String flightID);
}
