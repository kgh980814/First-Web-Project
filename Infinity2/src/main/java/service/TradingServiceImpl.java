package service;

import mapper.TradingMapper;
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
	


}
