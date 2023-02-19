package org.kg.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.K_bookInfo;
import org.kg.domain.K_getInfoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class K_FlightMapperTests {

	@Setter(onMethod_ = @Autowired)
	private B_PublicMemberMapper pmapper;
	
	@Setter(onMethod_ = @Autowired)
	private B_CorpMemberMapper cmapper;
	
	@Test
	public void test() {
		log.info(cmapper.countC());
	}
	
	
	// 항공편 테스트
//	@Test
//	public void test() {
//		log.info("테스트 결과 : " + mapper.flightList("AAR"));
//	}
	
	// 좌석 테스트
//	@Test
//	public void test() {
//		log.info("테스트 결과 : " + mapper.getSeatEco(1));
//	}	
	
	// 예약 좌석 테스트
//	@Test
//	public void test() {
//		K_getInfoDTO info = new K_getInfoDTO();
//		info.setDate_idx(2);
//		info.setFlight_name("AA978");
//		log.info("테스트 결과 : " + mapper.getReservationSeatList(info));
//	}	
	
	// 예약 조회 테스트
//	@Test
//	public void test() {
//		log.info("테스트 결과 : " + mapper.getResrvationInfo("2022M4L9R5X5H1"));
//	}
	
	// 예약번호 조회
//	@Test
//	public void test() {
//		K_bookInfo info = new K_bookInfo();
//		info.setDate_idx(2);
//		info.setM_idx(41);
//		log.info("테스트 결과 : " + mapper.getReservationIdx(info));
//	}
	
	// 항공권 환불
//	@Test
//	public void test() {
//		log.info("테스트 결과 : " + mapper.refundReservation("2022B1R3F8M4Z4"));
//	}
	
	// 항공권 예약 내역 (회원별)
//	@Test
//	public void test() {
//		String m_idx = "1";
//		log.info("테스트 결과 : " + mapper.getBookingList(m_idx));
//	}
	
	// 스케쥴 조회
//	@Test
//	public void test() {
//		log.info("테스트 결과 : " + mapper.scheduleList("KAL"));
//	}
	
}
