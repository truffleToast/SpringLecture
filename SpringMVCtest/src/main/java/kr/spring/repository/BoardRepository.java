package kr.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.spring.entity.Board;

@Repository // 메모리로 올리기 위한 어노테이션(생략가능)
public interface BoardRepository /*like mapper*/ extends JpaRepository<Board, Long>{ //테이블 이름(타입)과 pk의 데이터 타입 

	
// 홈페이지 백엔드의 흐름 3Tier
//	1. 요청은 모두 BoardController -> BoardService -> BoardRepository -> DataBase -> Client(유저)
	
}
