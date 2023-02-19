package org.eulji.mapper;

import java.util.Date;

import org.eulji.domain.AccountVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AccountMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private accountMapper mapper;
	
	@Test
	public void join() {
		AccountVO vo = new AccountVO();
		
		vo.setId("idid");
		vo.setPw("pwpw");
		vo.setEmail("idid@gmail.com");
		vo.setBirth(010101);
		vo.setAuth("회원");
		vo.setGender("남");
		vo.setName("홍길동");
		vo.setNickname("홍길순");
		
		Date today = new Date();
		vo.setRegDate(today);
		vo.setPnum("01012345678");
		
		vo.setIntro("");
		vo.setMbti("");
		vo.setImg("");
		vo.setConn(0);
		
		mapper.join(vo);
	}

}
