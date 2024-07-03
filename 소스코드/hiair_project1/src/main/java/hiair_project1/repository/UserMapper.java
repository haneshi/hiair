package hiair_project1.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import hiair_project1.model.User;

@Mapper// MyBatis는 @Mapper 애너테이션을 통해 SQL 문과 메서드를 매핑
public interface UserMapper {
//Java에서 MyBatis 라이브러리를 사용하여 데이터베이스의 users 테이블과 상호 작용하기 위한 UserMapper 인터페이스를 정의
	
	@Insert("INSERT INTO users(userID, name, email,password) VALUES (#{userID}, #{name}, #{email}, #{password})")
	public int insert(User user);
	//사용자 정보를 users 테이블에 삽입
	
	@Update("UPDATE users SET password=#{password} WHERE userID=#{userID}")
	public int update(User user);
	//특정 사용자의 비밀번호를 업데이트
	
	@Delete("DELETE FROM users WHERE userID=#{userID}")
	public int delete(String userID);
	//특정 사용자를 users 테이블에서 삭제
	
	@Select("SELECT COUNT(*) FROM users")
	public int count();
	//users 테이블의 레코드 수를 반환
	
	@Select("SELECT * FROM users")
	@ResultType(User.class)
	public List<User> selectAll();
	//users 테이블의 모든 사용자 정보를 조회
	
	@Select("SELECT userID, password FROM users WHERE userID = #{userID}")
	@Results(id = "userResultMap" , value = {@Result(property = "userID", column="userID"),
			@Result(property = "password", column="password")})
	//userID와 password를 조회하기 위한 SQL 문과 그 결과를 자바 객체로 매핑하는 방법을 정의
	public User selectByUserID(String userID); 
	//userID를 기준으로 특정 사용자의 정보를 조회
	//@Results 애너테이션을 통해 SQL 결과와 자바 객체의 프로퍼티를 매핑
	//LoginService.java 의 ID, PW 유효성 검사 진행

}
