package kr.spring.sequrity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.spring.entity.Member;
import kr.spring.entity.MemberUser;
import kr.spring.mapper.MemberMapper;

public class MemberUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper mapper;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// id(UserName)을 기준으로 로그인 정보를 가져오는 메소드
		// 내부적으로 보이지는 않지만 스프링 시큐리티가
		// 해당되는 아이디를 가진 계정을 가져오고
		// 암호화된 비밀번호 비교까지 해서 로그인을 체크하는 메소드
		
		//로그인 처리하기
		//알아서 이미 SpringSecurity가 로그인 기능을 다 끝마친 상태
		// 이제 개발잔느 진짜로 중간에 비밀번호를 알 수 잇는 방법이 없다.
		Member mvo =mapper.login(username);
		// Spring Security 내부 보안 규정상 우리가 직접만든 클래스 객체(VO)
		// 바로 담을 수 없음.
		// 내가 원하는 VO를 담을 수 있게 변환해주는 CLASS로 변경해야함
		if (mvo != null) {
			// 해당 사용자가 존재한다면
			System.out.println("로그인 성공");
			return new MemberUser(mvo);
		}else {
			//해당 유저가 없으면
			System.out.println("로그인 실패");
			throw new UsernameNotFoundException("user with username"+ username + "does not exist.");
			
		}
		
	}
	
}

