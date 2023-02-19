package com.sunrise.board.service;

import java.util.List;
import com.sunrise.board.vo.BoardVO;
import com.sunrise.board.vo.ComCodeVO;
import com.sunrise.board.vo.LoginForm;
import com.sunrise.board.vo.UserInfoVO;

public interface BoardService {
		List<BoardVO> boardList();
		int totalCheckerLogic(String parameter);
//		List<UserInfoVO> userList(String parameter);
		
		/* 0823 */
		public int boardCount(BoardVO vo);
		public List<ComCodeVO> selectPhoneCode();
		
		public int join(UserInfoVO userVO);
		public String checkPw(String USER_ID);
		
		public UserInfoVO getUser(UserInfoVO userVO);
		
		//경준코딩
		public int idCheck(String id);
		public int pwCheck(UserInfoVO vo);
}
