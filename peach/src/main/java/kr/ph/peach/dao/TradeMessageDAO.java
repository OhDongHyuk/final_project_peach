package kr.ph.peach.dao;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.TradingRequestVO;

public interface TradeMessageDAO {

	void rejectMessageToCustomer(@Param("trv")TradingRequestVO trv);

	
}