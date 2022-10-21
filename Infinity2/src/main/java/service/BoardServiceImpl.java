package service;

import java.util.List;

import mapper.BoardMapper;
import model.BoardVO;
import model.PagingDTO;

public class BoardServiceImpl implements BoardService {

	@Override
	public void create(BoardVO vo) {
		BoardMapper mapper = new BoardMapper();
		mapper.create(vo);
	}

	@Override
	public void update(BoardVO vo) {
		BoardMapper mapper = new BoardMapper();
		mapper.update(vo);		
	}

	@Override
	public List<BoardVO> readWithPaging(PagingDTO dto) {
		BoardMapper mapper = new BoardMapper();
		return mapper.readWithPaging(dto);		
	}
	@Override
	public int totalCnt() {
		BoardMapper mapper = new BoardMapper();
		return mapper.totalCnt();
	}

}
