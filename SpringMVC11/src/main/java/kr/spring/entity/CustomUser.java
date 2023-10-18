package kr.spring.entity;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;


//우리가 만든 회원정보 ->Member를 담는 객체
//Spring Context Holder에 저장하기 위해서는
//User 형태로 변환하여서 넣어주어야 한다.
//그걸 해주는 클래스가 바로 CustomUser클래스
public class CustomUser extends User{
	
	private Member member;
	
	public CustomUser(Member member) {
		super(member.getUsername(), member.getPassword(), AuthorityUtils.createAuthorityList("ROLE_"+member.getRole().toString()));
		// TODO Auto-generated constructor stub
	
	this.member = member;
	
	
	}

}
