package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.ToString;

@Entity // Board vo가 Database Table로 만들 때 설정
@Data
@ToString
public class Board {
	@Id // 유일하게 하나의 값, 기본키 
	@GeneratedValue(strategy = GenerationType.IDENTITY) //mysql에서 auto_increment와 같은 의미
	private Long idx; // jpa에서는 인덱스 번호를 int가 아닌 Long으로 쓴다. 
	
	private String title;
	
	@Column(length = 2000)// 컬럼의 속성값 길이 지정
	private String content;
	
	@Column(updatable =false) // 수정할 때 작성자는 안바꾸겟다.
	private String writer;
	
	@Column(insertable = false, updatable= false, columnDefinition =  "datetime default now()") // 게시글을 작성할 때 작성일자는 수정 및 입력이 불가=> default로만 처리하겠다.
	private Date indate;
	
	@Column(insertable =false, updatable= false, columnDefinition = "int default 0")
	private Long count;
	
}
