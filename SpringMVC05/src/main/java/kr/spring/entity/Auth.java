package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
// from lombok
@Data //GETTER SETTER 
@AllArgsConstructor // 전체생성자
@NoArgsConstructor // 기본생성자
@ToString //TO STRING
public class Auth {
	private int no;
	private String memID; //회원의 아이디
	private String auth; //회원의 권한
}
