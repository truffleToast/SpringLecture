package kr.spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // 환경설정파일 설정
public class SecurityConfiguration {
	
	@Autowired
	private UserDetailServieImpl /*로그인 기능을 해주는 클래스 */ userService;
	
	@Bean /*Bean을 통해 객체화*/
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder(); /*인코딩 기능*/
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		http.authorizeHttpRequests() //사용자의 요청을 핸들링
			.antMatchers("/", "/member/**").permitAll()
			// "/", "member 하위에 모든 접근을 허용하겠다.
			.antMatchers("/board/**").authenticated()
			// board아래에 잇는 페이지는 인증된(로그인한) 사용자만 허용하겠다.
			.and() // 추가
			.formLogin() // 별도의 로그인폼을 사용하겠다.
			.loginPage("/member/login") // memberfolder안에 login;
			.defaultSuccessUrl("/board/list") // 로그인 성공시 board List로 이동
			.and()
			.logout()
			.logoutUrl("/member/logout") // 로그아웃 실행하고 싶다면 member.LOGout
			.logoutSuccessUrl("/"); // 로그아웃 후 "/"(ContextPath)
		
		http.userDetailsService(userService);
			
		return http.build();
			
			
	}
	
}