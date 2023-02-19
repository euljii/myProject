package org.kg.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kg.domain.E_FreqVO;
import org.kg.domain.E_PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class E_FreqMapperTests {

	@Setter(onMethod_ = @Autowired)
	private E_FreqMapper mapper;
	
	@Test
	public void test() {
		E_PageDTO vo = new E_PageDTO();
		
		vo.setNowPage(1);
		vo.setCntPerPage(5);
		
		/*
		 * vo.setSearchName("리또"); 
		 * vo.setSearchType("ticont");
		 */
		
		List<E_FreqVO> list = mapper.getFreqListWithPaging(vo);
		for(E_FreqVO vo2 : list) { 
			log.info(vo2);		// 정보전달의 목적 
		}
		
		log.info("cntPage? >> " + vo.getCntPerPage());
		log.info("cntPerPage ? >>" + vo.getCntPerPage());
		
		log.info("searchName >> " + vo.getSearchName());
		log.info("searchType >> " + vo.getSearchType());
	}
	
	/*
	@Test
	public void test() {
		E_PageDTO vo = new E_PageDTO();
		
		List<E_FreqVO> list = mapper.getFreqList(vo);
		for(E_FreqVO vo2 : list) { 
			log.info(vo2);		// 정보전달의 목적 
		}
	}
	*/
	
}
