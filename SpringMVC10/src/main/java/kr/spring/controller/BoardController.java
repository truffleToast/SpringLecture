package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Board;
import kr.spring.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<Board> list = boardService.getLists();  //boardSerive안에 있는 getList가 BoardRepository를 호출, findAll을 통해 데이터 가져옴
//		for(Board vo: list) {
//			System.out.println(vo.toString());
//		}
		model.addAttribute("list" ,list);
		return "list"; 
	}
	
	
	
	
}
