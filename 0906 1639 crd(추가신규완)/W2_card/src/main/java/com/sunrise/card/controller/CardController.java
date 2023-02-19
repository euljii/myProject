package com.sunrise.card.controller;

import java.util.List;
import java.util.Locale;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunrise.card.service.CardService;
import com.sunrise.card.vo.BillVO;
import com.sunrise.card.vo.CommCodeDtlVO;
import com.sunrise.card.vo.CrdVO;
import com.sunrise.card.vo.CustVO;
import com.sunrise.card.vo.RcvApplVO;

@Controller
public class CardController {
	@Autowired
	CardService cService;

	@RequestMapping(value = "/card", method = RequestMethod.GET)
	public String card(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/cardApply", method = RequestMethod.GET)
	public String cardApply(Locale locale, Model model) {
		System.out.println("컨트롤러여요.!");
		
		// selectBox - 신청구분 list
		List<CommCodeDtlVO> applClasList = cService.applClasList(model);
		model.addAttribute("applClasList", applClasList);

		// selectBox - 카드 브랜드 list
		List<CommCodeDtlVO> brdList = cService.brdList(model);
		model.addAttribute("brdList", brdList);
		
		// selectBox - 결제일자 list
		List<CommCodeDtlVO> stlDdList = cService.stlDdList(model);
		model.addAttribute("stlDdList", stlDdList);

		// selectBox - 결제방법 list
		List<CommCodeDtlVO> stlMtdList = cService.stlMtdList(model);
		model.addAttribute("stlMtdList", stlMtdList);
		
		// selectBox - 결제은행 list
		List<CommCodeDtlVO> bnkCdList = cService.bnkCdList(model);
		model.addAttribute("bnkCdList", bnkCdList);
		
		// selectBox - 결제은행 list
		List<CommCodeDtlVO> stmtSndMtdList = cService.stmtSndMtdList(model);
		model.addAttribute("stmtSndMtdList", stmtSndMtdList);
		
		return "cardApply";
	}
	
	@RequestMapping(value = "/crdApply", method = RequestMethod.POST)
	public String crdApply(RcvApplVO rvo, CustVO cvo, BillVO bvo, CrdVO cdvo) {
		
		// 최초신규
		if(rvo.getAPPL_CLAS().equals("11")) {
			System.out.println("최초신규 타는 중");
			
			// 카드번호 생성
			String crdSeq = cService.crdNoSeq();
			System.out.println("카드 시퀀스?>> "+ crdSeq);
			System.out.println("brd?>> "+rvo.getBRD());
			
			// 브랜드별 카드번호 생성
			if(rvo.getBRD().equals("1")) {
				String crdNo = "5310"+"11"+ crdSeq + "1";
				rvo.setCRD_NO(crdNo);
				cdvo.setCRD_NO(crdNo);
			}else if(rvo.getBRD().equals("2")) {
				String crdNo = "4906"+"11"+ crdSeq + "1";
				rvo.setCRD_NO(crdNo);
				cdvo.setCRD_NO(crdNo);
			}else if(rvo.getBRD().equals("3")) {
				String crdNo = "3560"+"11"+ crdSeq + "1";
				rvo.setCRD_NO(crdNo);
				cdvo.setCRD_NO(crdNo);
			}
			
			// 고객번호 생성
			String custNoSeq = cService.custNoSeq();
			System.out.println("custNoSeq>> " + custNoSeq);
			
			cvo.setCUST_NO(custNoSeq);
			bvo.setCUST_NO(custNoSeq);
			cdvo.setCUST_NO(custNoSeq);
			
			// insert
			cService.rcvApplInsert(rvo);
			cService.custInsert(cvo);
			cService.billInsert(bvo);
			cService.crdInsert(cdvo);
		}
		
		// 추가신규
		else if(rvo.getAPPL_CLAS().equals("12")) {
			System.out.println("추가신규 타는 중");
			
			// 카드번호 생성
			String crdSeq = cService.crdNoSeq();
			System.out.println("카드 시퀀스?>> "+ crdSeq);
			System.out.println("brd?>> "+rvo.getBRD());
			
			// 카드
			if(rvo.getBRD().equals("1")) {
				String crdNo = "5310"+"11"+ crdSeq + "1";
				rvo.setCRD_NO(crdNo);
				cdvo.setCRD_NO(crdNo);
			}else if(rvo.getBRD().equals("2")) {
				String crdNo = "4906"+"11"+ crdSeq + "1";
				rvo.setCRD_NO(crdNo);
				cdvo.setCRD_NO(crdNo);
			}else if(rvo.getBRD().equals("3")) {
				String crdNo = "3560"+"11"+ crdSeq + "1";
				rvo.setCRD_NO(crdNo);
				cdvo.setCRD_NO(crdNo);
			}
			
			// 고객번호 가져오기
			String custNo = cService.getCustNo(cvo);
			System.out.println("고객번호?>> " + custNo);
			
			cvo.setCUST_NO(custNo);
			bvo.setCUST_NO(custNo);
			cdvo.setCUST_NO(custNo);
			
			cService.rcvInsertAdd(rvo);
			cService.crdInsertAdd(cdvo);
			
			System.out.println("insert된 rvo" + rvo);
			System.out.println("insert된 cvo" + cvo);
			System.out.println("insert된 bvo" + bvo);
			System.out.println("insert된 cdvo" + cdvo);
		}
		
		// 재발급
		else if(rvo.getAPPL_CLAS().equals("21")) {
			System.out.println("재발급 타는 중");
			
			// 카드번호 생성
			
			
			// 고객번호 생성
			
			// insert - rcvappl, crd
			
			// update - crd
			
			CrdVO originCrdVO = cService.originCrd(cdvo); 
			
			// originCrdVO.set
			
			
			
//			cService.rcvInsertReAdd(rvo);
//			cService.crdInsertReAdd(cdvo);
//			cService.crdInsertUpd(cdvo);

		}
		
		return "redirect:/card" ;
	}
	
	@RequestMapping(value = "/applyList", method = RequestMethod.GET)
	public String applyList(Locale locale, Model model) {
		
		return "applyList";
	}
	
	@RequestMapping(value = "/custList", method = RequestMethod.GET)
	public String custList(Locale locale, Model model) {
		
		return "custList";
	}
	
	
	@RequestMapping(value = "/applList", method = RequestMethod.GET)
	public String applList(Locale locale, Model model) {
		
	
		
		return "applList";
	}
	
	// 조회 btn
	@RequestMapping(value = "/selectBtn", method = RequestMethod.POST)
	@ResponseBody
	public RcvApplVO selectBtn(@RequestParam("SSN") String SSN, 
			@RequestParam("RCV_D") String RCV_D, @RequestParam("RCV_SEQ_NO") String RCV_SEQ_NO) {
		RcvApplVO rvo = new RcvApplVO();
		rvo.setSSN(SSN);
		rvo.setRCV_D(RCV_D);
		rvo.setRCV_SEQ_NO(RCV_SEQ_NO);
		System.out.println(rvo.getRCV_SEQ_NO());
		RcvApplVO selectBtn = cService.selectBtn(rvo);
		return selectBtn;
	}
	
	
	
	
}
