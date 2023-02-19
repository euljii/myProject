package com.sunrise.card.service;

import java.util.List;

import org.springframework.ui.Model;

import com.sunrise.card.vo.BillVO;
import com.sunrise.card.vo.CommCodeDtlVO;
import com.sunrise.card.vo.CrdVO;
import com.sunrise.card.vo.CustVO;
import com.sunrise.card.vo.RcvApplVO;

public interface CardService {
//		List<CardVO> cardList();

	List<CommCodeDtlVO> applClasList(Model model);
	List<CommCodeDtlVO> brdList(Model model);
	List<CommCodeDtlVO> stlDdList(Model model);
	List<CommCodeDtlVO> stlMtdList(Model model);
	List<CommCodeDtlVO> bnkCdList(Model model);
	List<CommCodeDtlVO> stmtSndMtdList(Model model);
	
	
	// crud
	public int rcvApplInsert(RcvApplVO rvo);
	public int custInsert(CustVO cvo);
	
	// custNo 들고오기
	public String getCustNo (CustVO cvo);
	public int billInsert(BillVO bvo);
	
	// custNo 들고오기
	public String crdNoSeq ();
	public String custNoSeq ();
	
	public RcvApplVO getCrdNo (RcvApplVO rvo);
	public int crdInsert(CrdVO cdvo);
	
	// 조회 btn
	RcvApplVO selectBtn(RcvApplVO rvo);
	CrdVO selectCrdVO(CrdVO cdvo);

	
	// 추가신규
	public int rcvInsertAdd(RcvApplVO rvo);
	public int crdInsertAdd(CrdVO cdvo);
	
	// 재발급 위해서 수정할 기존카드vo 조회
	public CrdVO originCrd(CrdVO cdvo);
	
	// 재발급
	public int rcvInsertReAdd(RcvApplVO rvo);
	public int crdInsertReAdd(CrdVO cdvo);
	public int originCardUpd(CrdVO cdvo);
}
