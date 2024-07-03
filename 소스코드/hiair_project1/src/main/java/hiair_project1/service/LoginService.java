package hiair_project1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hiair_project1.dto.Login;
import hiair_project1.model.User;
import hiair_project1.repository.UserMapper;

@Service
public class LoginService {
	@Autowired // LoginService UserMapper 객체를 주입
	private UserMapper userMapper;
	
	public void authenticate(Login login) {// login 객체를 받아 사용자 id와 password 검증(유효성 검사)
		User user = userMapper.selectByUserID(login.getUserID());
		//UserMapper의  @Results 애너테이션을 통해 SQL 결과와 자바 객체의 프로퍼티를 매핑
		if(user == null) {
			login.setError("ID가 존재하지 않습니다.");
		}else {
			if(!user.getPassword().equals(login.getPassword())) {
				login.setError("패스워드가 다릅니다.");
			}else {
				login.setError(null);
			}
		}
		
	}
	
}
