package service;

import java.util.List;

import mapper.CommentMapper;
import model.CommentVO;

public class CommentServiceImpl implements CommentService {
	private CommentMapper mapper;
	
	public CommentServiceImpl() {
		this.mapper = new CommentMapper();
	}

	@Override
	public void create(CommentVO vo) {
		//CommentMapper mapper = new CommentMapper();
		mapper.create(vo);
	}

	@Override
	public List<CommentVO> read(int bo_num) {
		//CommentMapper mapper = new CommentMapper();
		return mapper.read(bo_num);
	}

}
