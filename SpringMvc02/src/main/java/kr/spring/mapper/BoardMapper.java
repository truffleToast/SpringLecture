package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.entity.Board;

@Mapper // Mybatis가 interFace를 찾기 위해 달아주는 부분
public interface BoardMapper {
	
	public List<Board> getLists();
	
	public void boardInsert(Board board);

	public Board boardContent(int idx);
	
	public void boardDelete(int idx);

	public void boardUpdate(Board board);

	public void boardCount(int idx);
}

