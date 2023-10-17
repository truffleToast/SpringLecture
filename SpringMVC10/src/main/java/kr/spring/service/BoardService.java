package kr.spring.service;

import java.util.List;

import kr.spring.entity.Board;

public interface BoardService {

	public List<Board> getLists(); // 게시글 전체조회
	
	public void register(Board board); // 게시글 등록
	
}
