package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data //getter setter
@AllArgsConstructor //전체 생성자
@NoArgsConstructor // 기본생성자
@ToString //TO string
public class Book {
	
	private int num;
	private String title;
	private String author;
	private String company;
	private String isbn;
	private int count;

}
