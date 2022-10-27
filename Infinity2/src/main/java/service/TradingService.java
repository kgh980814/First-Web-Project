package service;

import java.util.List;

import model.PagingDTO;
import model.TradingVO;

public interface TradingService {

	public int create(TradingVO vo);
	public List<TradingVO> read();
	
	public TradingVO read(int tra_num);
	
	public int totalCnt();
	
	public List<TradingVO> readWithPaging(PagingDTO dto);
}
