package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data //getter setter
@AllArgsConstructor //전체 생성자
@NoArgsConstructor // 기본생성자
@ToString //TO string
public class Board {
	
	private int idx; // 번호
	private String title; // 제목
	private String content; // 제목
	private String writer; // 작성자
	private String indate; // 작성일
	private int count; // 조회수
}
