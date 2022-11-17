package service;

import java.util.List;

import mapper.BoardMapper;
import model.BoardVO;
import model.CommentVO;
import model.PagingDTO;
import model.ViewInfoVO;

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

	@Override
	public BoardVO read(int bo_num) {
		BoardMapper mapper = new BoardMapper();
		return mapper.read(bo_num);
	}

	@Override
	public BoardVO readModify(int bo_num) {
		BoardMapper mapper = new BoardMapper();
		return mapper.read(bo_num);
	}

	@Override
	public ViewInfoVO view(int bo_num) {
		BoardVO board = new BoardMapper().read(bo_num);
		List<CommentVO> list =new CommentServiceImpl().read(bo_num);
		ViewInfoVO info =new ViewInfoVO();
		info.setBoard(board);
		info.setList(list);
		return info;
	}

}
