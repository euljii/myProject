package com.sunrise.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunrise.board.vo.BoardVO;
import com.sunrise.board.vo.ComCodeVO;
import com.sunrise.board.vo.LoginForm;
import com.sunrise.board.vo.UserInfoVO;

@Repository("bDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSession sqlSession; // F3 눌려서 각 메소드 사용법 확인 가능

	@Override
	public List<BoardVO> boardList() {
		return sqlSession.selectList("Board.boardList");
	}

	@Override
	public int daoTotalChk(String parameter) {
		return sqlSession.selectOne("Board.totalChkMapper");
	}

	@Override
	public int boardCount(BoardVO vo) {
		return sqlSession.selectOne("Board.boardCount");
	}

	@Override
	public List<ComCodeVO> selectPhoneCode() {
		return sqlSession.selectList("Board.selectPhoneCode");
	}

	@Override
	public int join(UserInfoVO userVO) {
		return sqlSession.insert("Board.join", userVO);
	}

	@Override
	public String checkPw(String USER_ID) {
		return sqlSession.selectOne("Board.checkPw", USER_ID);
	}

	@Override
	public UserInfoVO getUser(UserInfoVO userVO) {
		return sqlSession.selectOne("Board.getUser", userVO);
	}
	

//	@Override
//	public List<UserInfoVO> userList() {
//		return sqlSession.selectList("Board.userList");
//	}
	
	// 경준코딩
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("Board.idCheck", id);
	}
	@Override
	public int pwCheck(UserInfoVO vo) {
		return sqlSession.selectOne("Board.pwCheck", vo);
	}
}
