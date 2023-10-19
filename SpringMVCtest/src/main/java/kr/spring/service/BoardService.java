package kr.spring.service;

import java.util.List;

import kr.spring.entity.Board;

public interface BoardService {

	public List<Board> getLists(); // 게시글 전체조회
	
	public void register(Board board); // 게시글 등록

	public Board get(Long idx); //게시글 하나 조회

	public void delete(Long idx);

	public void modify(Board board);
	
}
