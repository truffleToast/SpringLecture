package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;
@RequestMapping("/board")
@RestController
public class BoardRestController {
	
	// RestControler
	// 비동기 방식의 일만 처리하는 Controller
	// Rest전송방식을 처리할 수 있다.
	// -요청 url + 전송방식(상태)를 묶어서 처리 가능
	// 사용하는 이유 -url 통일성 및 단순화
	
	@Autowired
	private BoardMapper mapper; //MyBatis한테 JDBC 실행하게 요청하는 객체

	@GetMapping("/all")
	  public @ResponseBody List<Board> boardList(){
		  System.out.println("게시글 전제보기 기능");
		  List<Board> list =mapper.getLists();
		  return list;
	  }
	@PostMapping("/new")
	  public @ResponseBody void boardInsert(Board board) {
		  System.out.println("게시글 작성 기능 수행");
		  mapper.boardInsert(board);
		  
	  }
	@GetMapping("/{idx}")
	  public Board boardContent(@PathVariable("idx") int idx) {
		Board board =mapper.boardContent(idx);
		return board;
	}
	
	
	  @DeleteMapping("/{idx}")
	  public @ResponseBody void boardDelete(@PathVariable("idx") int idx) {
		  System.out.println("게시글 삭제 기능");
		  mapper.boardDelete(idx);
	  }
	  

	  
	  
	  @PutMapping("/update")
	  public void boardUpdate(@RequestBody Board board) {
		  System.out.println("게시글 수정 기능");
		  mapper.boardUpdate(board);
	  }
	  @PutMapping("/count/{idx}")
	  public @ResponseBody void boardCount(@PathVariable("idx") int idx) {
		  System.out.println("조회수 1올리기");
		  mapper.boardCount(idx);
	  }
	  

}
