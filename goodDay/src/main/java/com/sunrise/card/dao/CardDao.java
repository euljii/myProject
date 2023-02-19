package com.sunrise.card.dao;

import java.util.List;

import com.sunrise.card.vo.BillVO;
import com.sunrise.card.vo.CommCodeDtlVO;
import com.sunrise.card.vo.CrdVO;
import com.sunrise.card.vo.CustVO;
import com.sunrise.card.vo.RcvApplVO;

public interface CardDao {
//	List<CardVO> cardList();
	
	// 공통코드 셀렉트박스 리스트
	List<CommCodeDtlVO> applClasList();
	List<CommCodeDtlVO> brdList();
	List<CommCodeDtlVO> stlDdList();
	List<CommCodeDtlVO> stlMtdList();
	List<CommCodeDtlVO> bnkCdList();
	List<CommCodeDtlVO> stmtSndMtdList();
	
	// crud
	// 최초신규
	public int rcvApplInsert(RcvApplVO rvo);
	public int custInsert(CustVO cvo);
	
	// custNo, crdNo 들고오기
	public String crdNoSeq ();
	public String custNoSeq ();
	
	public String getCustNo (CustVO cvo);
	public int billInsert(BillVO bvo);
	
	// crdNo 들고오기
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
