package com.sunrise.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import com.sunrise.board.dao.BoardDao;
import com.sunrise.board.service.BoardService;
import com.sunrise.board.vo.UserInfoVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

public class DaoTests {
	
	@Setter(onMethod_ = @Autowired) 
	private BoardService service;
	
	@Test
	public void test() {
		
		UserInfoVO userVO = new UserInfoVO();
		userVO.setUSER_ID("235");
		
		service.checkPw(userVO.getUSER_ID());
	}

}
