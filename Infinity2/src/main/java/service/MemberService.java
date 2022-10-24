package service;

import java.util.List;

import model.MemberVO;

public interface MemberService {

	public void create(MemberVO vo);
	
	public List<MemberVO> read();
	
	public List<MemberVO> readOut(String keyword);
	
	public MemberVO read(String mb_id);
}
