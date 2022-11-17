package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		mapper.create(vo);// service에서 mapper로 보내는 과정
	}

	@Override
	public List<TradingDetailVO> read(int tra_num) {
		// TODO Auto-generated method stub
		return mapper.read(tra_num);
	}

	@Override
	public void modify(HttpServletRequest request) {
		int tra_num = Integer.parseInt(request.getParameter("tra_num"));
		mapper.delete(tra_num);
		// 삭제후 등록
		for (int i = 0; i < request.getParameterValues("tradingDate").length; i++) {
			String tradingDateStr = request.getParameterValues("tradingDate")[i];
			String subject = request.getParameterValues("subject")[i];
			String standard = request.getParameterValues("standard")[i];
			String quantity = request.getParameterValues("quantity")[i];
			String unitPrice = request.getParameterValues("unitPrice")[i];
			String supplyPrice = request.getParameterValues("supplyPrice")[i];
			String taxAmount = request.getParameterValues("taxAmount")[i];
			String ect = request.getParameterValues("ect")[i];

			if (tradingDateStr == null || "".equals(tradingDateStr)) {// 빈값이거나 NULL값이면 반복을 멈춤
				break;
			}
			Date tradingDate = null;
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				tradingDate = format.parse(tradingDateStr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 등록하는 작업
			TradingDetailVO tradingDetail = new TradingDetailVO();
			tradingDetail.setTrad_refnum(tra_num);
			tradingDetail.setTrad_tradingDate(tradingDate);
			tradingDetail.setTrad_subject(subject);
			tradingDetail.setTrad_standard(standard);
			tradingDetail.setTrad_quantity(Integer.parseInt(quantity));
			tradingDetail.setTrad_unitPrice(Integer.parseInt(unitPrice));
			tradingDetail.setTrad_supplyPrice(Integer.parseInt(supplyPrice));
			tradingDetail.setTrad_taxAmount(Integer.parseInt(taxAmount));
			tradingDetail.setTrad_ect(ect);

			//
			
			mapper.create(tradingDetail);//serivce에서 mapper로 이동

		} // for(int i = 0; i < request.getParameterValues("tradingDate").length;i++)

	}

}
