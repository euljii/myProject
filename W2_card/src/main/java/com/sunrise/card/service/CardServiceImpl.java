package com.sunrise.card.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sunrise.card.dao.CardDao;
import com.sunrise.card.vo.BillVO;
import com.sunrise.card.vo.CommCodeDtlVO;
import com.sunrise.card.vo.CrdVO;
import com.sunrise.card.vo.CustVO;
import com.sunrise.card.vo.RcvApplVO;

@Service("cService")
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardDao cDao;

	@Override
	public List<CommCodeDtlVO> applClasList(Model model) {
		List<CommCodeDtlVO> applClasList = cDao.applClasList();
		return applClasList;
	}

	@Override
	public List<CommCodeDtlVO> brdList(Model model) {
		List<CommCodeDtlVO> brdList = cDao.brdList();
		return brdList;
	}

	@Override
	public List<CommCodeDtlVO> stlDdList(Model model) {
		List<CommCodeDtlVO> stlDdList = cDao.stlDdList();
		return stlDdList;
	}

	@Override
	public List<CommCodeDtlVO> stlMtdList(Model model) {
		List<CommCodeDtlVO> stlMtdList = cDao.stlMtdList();
		return stlMtdList;
	}

	@Override
	public List<CommCodeDtlVO> bnkCdList(Model model) {
		List<CommCodeDtlVO> bnkCdList = cDao.bnkCdList();
		return bnkCdList;
	}

	@Override
	public List<CommCodeDtlVO> stmtSndMtdList(Model model) {
		List<CommCodeDtlVO> stmtSndMtdList = cDao.stmtSndMtdList();
		return stmtSndMtdList;
	}

	@Override
	public int rcvApplInsert(RcvApplVO rvo) {
		return cDao.rcvApplInsert(rvo);
	}

	@Override
	public int rcvInsertAdd(RcvApplVO rvo) {
		return cDao.rcvInsertAdd(rvo);
	}

	@Override
	public int crdInsertAdd(CrdVO cdvo) {
		return cDao.crdInsertAdd(cdvo);
	}

	@Override
	public int rcvInsertReAdd(RcvApplVO rvo) {
		return cDao.rcvInsertReAdd(rvo);
	}

	@Override
	public CrdVO selectCrdVO(CrdVO cdvo) {
		return cDao.selectCrdVO(cdvo);
	}

	@Override
	public int crdInsertReAdd(CrdVO cdvo) {
		return cDao.crdInsertReAdd(cdvo);
	}

	@Override
	public int originCardUpd(CrdVO cdvo) {
		return cDao.originCardUpd(cdvo);
	}

	@Override
	public int custInsert(CustVO cvo) {
		return cDao.custInsert(cvo);
	}

	@Override
	public String custNoSeq() {
		return cDao.custNoSeq();
	}

	@Override
	public int billInsert(BillVO bvo) {
		return cDao.billInsert(bvo);
	}


	
	@Override
	public String getCustNo(CustVO cvo) {
		return cDao.getCustNo(cvo);
	}

	// custNo 들고오기
	@Override
	public String crdNoSeq() {
		return cDao.crdNoSeq();
	}

	@Override
	public RcvApplVO getCrdNo(RcvApplVO rvo) {
		return cDao.getCrdNo(rvo);
	}

	@Override
	public int crdInsert(CrdVO cdvo) {
		return cDao.crdInsert(cdvo);
	} 
	
	@Override
	public RcvApplVO selectBtn(RcvApplVO rvo) {
		return cDao.selectBtn(rvo);
	}

	// 재발급 위해 수정할 기존 카드vo
	@Override
	public CrdVO originCrd(CrdVO cdvo) {
		return cDao.originCrd(cdvo);
	}
	
	
	
	
}
