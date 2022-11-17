package service;

import java.util.List;

import model.BoardVO;
import model.MemberVO;
import model.PagingDTO;
import model.ViewInfoVO;

public interface BoardService {
	
	public void create(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public List<BoardVO> readWithPaging(PagingDTO dto);
	
	public BoardVO read(int bo_num);
	
	public BoardVO readModify(int bo_num);
	

	public int totalCnt();
	
	public ViewInfoVO view(int bo_num);
}
