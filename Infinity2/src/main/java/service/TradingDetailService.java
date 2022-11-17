package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.TradingDetailVO;

public interface TradingDetailService {
	public void create(TradingDetailVO vo);
	public List<TradingDetailVO> read(int tra_num);
	public void modify(HttpServletRequest request);
}
