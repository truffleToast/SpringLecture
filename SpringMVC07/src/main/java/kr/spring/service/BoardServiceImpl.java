package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Member;
import kr.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<Board> getList() {
		// 게시글 전체목록 가져오기 기능
		List<Board> list = mapper.getList();
		return list;
	}

	@Override
	public Member login(Member vo) {
		
		Member mvo = mapper.login(vo);
		return mvo;
	}


	@Override
	public void register(Board vo) {
		
		mapper.insertSelectKey(vo);
	}

	@Override
	public Board get(int idx) {
		Board vo = mapper.read(idx);
		return vo;
	}

	@Override
	public void modify(Board vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
	}

	@Override
	public void remove(int idx) {
		// TODO Auto-generated method stub
		mapper.delete(idx);
	}

	@Override
	public void reply(Board vo) {
		// TODO Auto-generated method stub
		//답글 만들기
		//vo - 부모글 번호, 로그인 ID, 제목, 답글, 작성자 이름
		// 부모글의 정보 가져오기
		System.out.println(vo.toString());
		Board parent = mapper.read(vo.getIdx());
		//부모글의 보드group값을 ->답글 vo에 저장
		vo.setBoardGroup(parent.getBoardGroup());
		//시퀀스와 레벨은 부모글에 +1? X 시퀀스는 MAX 값을 바탕으로 +1 , LEVEL은 원글 +1
		vo.setBoardSequence(parent.getBoardSequence()+1);
		vo.setBoardLevel(parent.getBoardLevel()+1);
		//현재 넣으려는 답글을 제외한 기존 같은 그룹의 댓글의 시퀀스 값을 1씩을 올려줘야한다.
		mapper.replySeqUpdate(parent);
		
		mapper.replyInsert(vo);
	}
	

}









