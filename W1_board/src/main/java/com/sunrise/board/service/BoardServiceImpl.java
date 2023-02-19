package com.sunrise.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunrise.board.dao.BoardDao;
import com.sunrise.board.vo.BoardVO;
import com.sunrise.board.vo.ComCodeVO;
import com.sunrise.board.vo.LoginForm;
import com.sunrise.board.vo.UserInfoVO;

@Service("bbService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao bDao; 
	
	@Override
	public List<BoardVO> boardList(){
		List<BoardVO> list = bDao.boardList();
		return list;
	}
	
	@Override
	public int totalCheckerLogic(String parameter) {
		int result = bDao.daoTotalChk(parameter);
		return result;
	}

	@Override
	public int boardCount(BoardVO vo) {
		
		int total = bDao.boardCount(vo);
		
		return total;
	}

	@Override
	public List<ComCodeVO> selectPhoneCode() {
		List<ComCodeVO> phList = bDao.selectPhoneCode();
		return phList;
	}

	@Override
	public int join(UserInfoVO userVO) {
		return bDao.join(userVO);
	}

	@Override
	public String checkPw(String USER_ID) {
		return bDao.checkPw(USER_ID);
	}

	@Override
	public UserInfoVO getUser(UserInfoVO userVO) {
		return bDao.getUser(userVO);
	}
	
	// 경준코딩
	@Override
	public int idCheck(String id) {
		return bDao.idCheck(id);
	}
	@Override
	public int pwCheck(UserInfoVO vo) {
		return bDao.pwCheck(vo);
	}
	
	
}
