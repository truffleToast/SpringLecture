package kr.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.spring.mapper.BookMapper;

@Controller // 현재 클래스를 핸들러 맵핑으로 찾을 수 있게 컨트롤러로 등록하는 부분
public class BookController {

   @Autowired
   private BookMapper mapper;   //MyBatis한테 JDBC 실행하게 요청하는 객체
   
   
  @RequestMapping("/")
   public String home() {
      System.out.println("홈 기능 수행");
      return "Book/main";
      }
  
   
   
}