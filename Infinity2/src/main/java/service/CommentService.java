package service;

import java.util.List;

import model.CommentVO;

public interface CommentService {
	
	public void create(CommentVO vo);
	
	public List<CommentVO> read(int bo_num);
}
