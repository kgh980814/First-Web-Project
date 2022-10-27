package service;

import java.util.List;

import mapper.BoardMapper;
import mapper.TradingMapper;
import model.BoardVO;
import model.PagingDTO;
import model.TradingVO;

public class TradingServiceImpl implements TradingService{
	
	private TradingMapper mapper;
	
	public TradingServiceImpl() {
		mapper =new TradingMapper();
	}
	@Override
	public int create(TradingVO vo) {
		return mapper.create(vo);
	
	}
	@Override
	public List<TradingVO> read() {
		return mapper.read();
	}
	@Override
	public TradingVO read(int tra_num) {
		// TODO Auto-generated method stub
		return mapper.read(tra_num);

	}
	public List<TradingVO> readWithPaging(PagingDTO dto) {
		return mapper.readWithPaging(dto);		
	}
	@Override
	public int totalCnt() {
		return mapper.totalCnt();
	}


}
