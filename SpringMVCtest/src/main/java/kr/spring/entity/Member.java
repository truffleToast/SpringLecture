package kr.spring.entity;


import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class Member{
	
	@Id
	private String username; //Spring Security 에서는 id가 아닌 username으로 지정해야한다.

	private String password; //Spring Security 에서는 pwd가 아닌 password로 지정해야한다.
	
	@Enumerated(EnumType.STRING) //@Enumerated-> 열거형 (권한이 여러개이기 때문에)
	private Role role; // 권한정보
	
	// 여기서부터는 선택 사항
	private String name; // 회원의 이름
	
	private boolean ebled; // 휴면계정 부분
	
	
}
