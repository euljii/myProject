package org.kg.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kg.domain.E_NoticeVO;
import org.kg.domain.E_PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class E_NoticeMapperTests {
	

	@Setter(onMethod_ = @Autowired)
	private E_NoticeMapper mapper;
	
	@Test
	public void getListWithPaging() {
		E_PageDTO vo = new E_PageDTO();

		vo.setStart(1);
		vo.setEnd(5);
		
		vo.setNowPage(1);
		vo.setCntPerPage(5);
		
		vo.setSearchName("리또");
		vo.setSearchType("ticont");
	
		List<E_NoticeVO> list = mapper.getNtListWithPaging(vo);
		for(E_NoticeVO vo2 : list) { 
			log.info(vo2);		// 정보전달의 목적 
		}
		
		log.info("cntPage? >> " + vo.getCntPerPage());
		log.info("cntPerPage ? >>" + vo.getCntPerPage());
		
		log.info("searchName >> " + vo.getSearchName());
		log.info("searchType >> " + vo.getSearchType());
	}
	
//	@Test
//	public void test() {
//		E_PageDTO vo = new E_PageDTO();
//		
//		vo.setSearchName("리또");
//		vo.setSearchType("ticont");
//		
//		mapper.getTotalCount(vo);
//		
//	}
	
	
	
	
	
	
	

}
