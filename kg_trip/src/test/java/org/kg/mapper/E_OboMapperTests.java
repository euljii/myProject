package org.kg.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kg.domain.E_NoticeVO;
import org.kg.domain.E_OboVO;
import org.kg.domain.E_PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class E_OboMapperTests {
	

	@Setter(onMethod_ = @Autowired)
	private E_OboMapper mapper;

//	@Test
//	public void getListWithPaging() {
//		
//		E_PageDTO dto2 = new E_PageDTO();
//		// total 구하기
//	    int total = mapper.getOboTotalCount(dto2);
//	    
//		E_PageDTO dto = new E_PageDTO(
//				dto2.getTotal(),
//				1, 5);
//		dto.setStart(1);
//		dto.setEnd(5);
//		
//		log.info("cntPage? >> " + dto.getCntPerPage());
//		log.info("cntPerPage ? >>" + dto.getCntPerPage());
//		log.info("nowPage ? >>" + dto.getNowPage());
//		
//		List<E_OboVO> list = mapper.myPageOboList(dto, 6);
//		for(E_OboVO vo : list) { 
//			log.info(vo);		// 정보전달의 목적 
//		}
//	}
	
//	 @Test 
//	public void test() {
//		E_PageDTO dto = new E_PageDTO();
//		
//		dto.setNowPage(1);
//		dto.setCntPerPage(5);
//		
//		
//		List<E_OboVO> list = mapper.getOboList(dto);
//		log.info(list);
//		for(E_OboVO vo2 : list) { 
//			log.info(vo2);		// 정보전달의 목적 
//		}
// }
	 @Test 
	 public void test() {
		 E_PageDTO dto = new E_PageDTO();
		 
		 dto.setNowPage(1);
		 dto.setCntPerPage(5);
		 dto.setM_idx(6);
		 
		 List<E_OboVO> list = mapper.myPageOboList(dto);
		 log.info("list ? >> " + list);
		 log.info("m_idx 6번의 총 글 수 ? >> " + mapper.getOboCount(dto));
	 }

}
