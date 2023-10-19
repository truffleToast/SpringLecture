package kr.spring.config;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.spring.entity.CustomUser;
import kr.spring.entity.Member;
import kr.spring.repository.MemberRepository;

@Service
public class UserDetailServieImpl implements UserDetailsService{
	@Autowired
	private MemberRepository MemberRepository;
		
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO 로그인 하는 작업
		
		Member member =MemberRepository.findById(username).get();
		
		if(member == null) {
			throw new UsernameNotFoundException(username + "없음");
		}
		
		return new CustomUser(member);
	}

	
	
}
