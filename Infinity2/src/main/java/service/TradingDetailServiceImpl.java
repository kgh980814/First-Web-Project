package service;

import java.util.List;

import mapper.TradingDetailMapper;
import model.TradingDetailVO;

public class TradingDetailServiceImpl implements TradingDetailService {
	private TradingDetailMapper mapper;
	
	public TradingDetailServiceImpl() {
		this.mapper = new TradingDetailMapper();
	}

	@Override
	public void create(TradingDetailVO vo) {
		// TODO Auto-generated method stub
		mapper.create(vo);//service에서 mapper로 보내는 과정
	}

	@Override
	public List<TradingDetailVO> read(int tra_num) {
		// TODO Auto-generated method stub
		return mapper.read(tra_num);
	}

	
}
