package kr.ph.peach.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.TradeMessageDAO;
import kr.ph.peach.vo.TradingRequestVO;

@Service
public class TradeMessageServiceImp implements TradeMessageService {

	@Autowired
	TradeMessageDAO tradeMessageDao;
	
	@Override
	public void rejectMessageToCustomer(TradingRequestVO trv) {
		tradeMessageDao.rejectMessageToCustomer(trv);
	}


	
}