package org.kg.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kg.domain.E_OboVO;
import org.kg.domain.E_PageDTO;
import org.kg.mapper.E_OboMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class E_OboServiceTests {
	


	@Setter(onMethod_ = @Autowired)
	private E_OboService service;
	
	@Test 
	 public void test() {
		 E_PageDTO dto = new E_PageDTO();
		 
		 dto.setNowPage(1);
		 dto.setCntPerPage(5);
		 dto.setM_idx(6);
		 
		 List<E_OboVO> list = service.myPageOboList(dto);
		 log.info("list ? >> " + list);
		 log.info("m_idx 6번의 총 글 수 ? >> " + service.getOboCount(dto));
		 
	 }
}
