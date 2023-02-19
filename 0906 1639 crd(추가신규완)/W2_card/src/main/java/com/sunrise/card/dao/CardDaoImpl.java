package com.sunrise.card.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sunrise.card.vo.BillVO;
import com.sunrise.card.vo.CommCodeDtlVO;
import com.sunrise.card.vo.CrdVO;
import com.sunrise.card.vo.CustVO;
import com.sunrise.card.vo.RcvApplVO;

@Repository("cDao")
public class CardDaoImpl implements CardDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CommCodeDtlVO> applClasList() {
		return sqlSession.selectList("applClasList");
	}

	@Override
	public List<CommCodeDtlVO> brdList() {
		return sqlSession.selectList("brdList");
	}

	@Override
	public List<CommCodeDtlVO> stlDdList() {
		return sqlSession.selectList("stlDdList");
	}
			
	@Override
	public List<CommCodeDtlVO> stlMtdList() {
		return sqlSession.selectList("stlMtdList");
	}

	@Override
	public List<CommCodeDtlVO> bnkCdList() {
		return sqlSession.selectList("bnkCdList");
	}

	@Override
	public List<CommCodeDtlVO> stmtSndMtdList() {
		return sqlSession.selectList("stmtSndMtdList");
	}

	// 카드번호
	@Override
	public String crdNoSeq() {
		return sqlSession.selectOne("crdNoSeq");
	}
	
	@Override
	public int rcvApplInsert(RcvApplVO rvo) {
		return sqlSession.insert("rcvApplInsert", rvo);
	}


	@Override
	public int custInsert(CustVO cvo) {
		return sqlSession.insert("custInsert",cvo);
	}

	@Override
	
	public RcvApplVO getCrdNo(RcvApplVO rvo) {
		return sqlSession.selectOne("getCrdNo", rvo);
	}

	@Override
	public int crdInsert(CrdVO cdvo) {
		return sqlSession.insert("crdInsert", cdvo);
	}

	@Override
	public int billInsert(BillVO bvo) {
		return sqlSession.insert("billInsert", bvo);
	}

	@Override
	public String getCustNo (CustVO cvo) {
		return sqlSession.selectOne("getCustNo", cvo);
	}
	
	@Override
	public RcvApplVO selectBtn(RcvApplVO rvo) {
		return sqlSession.selectOne("selectBtn", rvo);
	}

	@Override
	public int rcvInsertAdd(RcvApplVO rvo) {
		return sqlSession.insert("rcvInsertAdd", rvo);
	}

	@Override
	public int crdInsertAdd(CrdVO cdvo) {
		return sqlSession.insert("crdInsertAdd", cdvo);
	}

	@Override
	public int rcvInsertReAdd(RcvApplVO rvo) {
		return sqlSession.insert("rcvInsertReAdd", rvo);
	}

	@Override
	public int crdInsertReAdd(CrdVO cdvo) {
		return sqlSession.insert("crdInsertReAdd", cdvo);
	}

	@Override
	public int originCardUpd(CrdVO cdvo) {
		return sqlSession.update("originCardUpd", cdvo);
	}

	@Override
	public CrdVO selectCrdVO(CrdVO cdvo) {
		return sqlSession.selectOne("selectCrdVO", cdvo);
	}

	@Override
	public String custNoSeq() {
		return sqlSession.selectOne("custNoSeq");
	}

	@Override
	public CrdVO originCrd(CrdVO cdvo) {
		return sqlSession.selectOne("originCrd", cdvo);
	}
	
	

//	@Override
//	public List<CardVO> cardList() {
//		return sqlSession.selectList("Board.cardList");
//	}
	
	
}
