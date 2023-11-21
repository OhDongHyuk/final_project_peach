package kr.ph.peach.service;

import kr.ph.peach.vo.TradingRequestVO;

public interface TradeMessageService {

	void rejectMessageToCustomer(TradingRequestVO trv);

}