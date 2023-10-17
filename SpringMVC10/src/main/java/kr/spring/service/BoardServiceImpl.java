package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Override
	public List<Board> getLists() {
		// TODO 첫페이지에 나올 게시글을 얻게 하는 메소드
		
		List<Board> list = boardRepository.findAll();
		
		return list;
	}

	@Override
	public void register(Board board) {
		// TODO 글 작성하는 메소드
		boardRepository.save(board); // insert into Board application에서 update로 바꿔놔서 가능
	}

	
}
