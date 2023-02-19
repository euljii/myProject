package org.kg.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.E_PageDTO;
import org.kg.service.B_corpMemberService;
import org.kg.service.B_publicMemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/Admin/*")
public class B_AdminController {
	
	private B_publicMemberService pm_service;
	private B_corpMemberService cm_service;

	// 마이페이지
	@GetMapping("/adminPage")
	public String sdfsdf(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");
		String birth_year = "";
		String birth_month = "";
		String birth_date = "";
		
		if (loginvo == null) {
			model.addAttribute("loginPublicInfo", null);
		} else{
			birth_year = loginvo.getM_birth().substring(0, 4);
			birth_month = loginvo.getM_birth().substring(4, 6);
			birth_date = loginvo.getM_birth().substring(6);
			
			model.addAttribute("loginPublicInfo", loginvo);
			model.addAttribute("birthYear", birth_year);
			model.addAttribute("birthMonth", birth_month);
			model.addAttribute("birthDate", birth_date);
			log.info(loginvo);
		}
		log.info("마이페이지로 갑니다");
		return "admin/adminAccountPage";
	}
	
	@GetMapping("/managePublic")
	public String plist(HttpServletRequest request, Model model,E_PageDTO dto,
			@RequestParam(value="nowPage", required = false)String nowPage,
			@RequestParam(value="cntPerPage", required = false)String cntPerPage,
			@RequestParam(value="searchType", required = false)String searchType,
			@RequestParam(value="searchName", required = false)String searchName
			) {
		int total = pm_service.getTotal(dto);
	
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		
		B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");

		if (loginvo == null) {
			model.addAttribute("loginPublicInfo", null);
		}else {
			model.addAttribute("loginPublicInfo", loginvo);
			log.info(loginvo);
		}
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		model.addAttribute("total", total);
		dto = new E_PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		dto.setSearchName(searchName);
		dto.setSearchType(searchType);
		model.addAttribute("pageMaker", dto);
		
		model.addAttribute("publicList", pm_service.getListWithPaging(dto)); // 전체 리스트 목록
		
		log.info("현재 페이지 넘버? nowPage? >> " + nowPage);
		log.info("페이지당 글 개수? cntPage? >> " + dto.getCntPage());
		log.info("페이지당 글 개수? cntPerPage? >> " + cntPerPage);
		log.info("PageDTO는? >> "+dto);
		log.info("searchName >> " + searchName);
		log.info("searchType >> " + searchType);
		
		return "admin/publicmemberlist";
	}
	
	@GetMapping("/manageAdmin")
	public String alist(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		
		B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");
		
		if (loginvo == null) {
			model.addAttribute("loginPublicInfo", null);
		}else {
			model.addAttribute("loginPublicInfo", loginvo);
			log.info(loginvo);
		}
		
		model.addAttribute("publicList", pm_service.publicList()); // 전체 리스트 목록
		
		return "admin/adminmemberlist";
	}
	
	@GetMapping("/manageCorp")
	public String clist(HttpServletRequest request, Model model,E_PageDTO dto,
			@RequestParam(value="nowPage", required = false)String nowPage,
			@RequestParam(value="cntPerPage", required = false)String cntPerPage,
			@RequestParam(value="searchType", required = false)String searchType,
			@RequestParam(value="searchName", required = false)String searchName
			) {
		
		int total = cm_service.getTotal(dto);
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		
		B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");

		if (loginvo == null) {
			model.addAttribute("loginPublicInfo", null);
		}else {
			model.addAttribute("loginPublicInfo", loginvo);
			log.info(loginvo);
		}
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		model.addAttribute("total", total);
		dto = new E_PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		dto.setSearchName(searchName);
		dto.setSearchType(searchType);
		model.addAttribute("pageMaker", dto);
		
		model.addAttribute("corpList", cm_service.getListWithPaging(dto)); // 전체 리스트 목록
		
		log.info("현재 페이지 넘버? nowPage? >> " + nowPage);
		log.info("페이지당 글 개수? cntPage? >> " + dto.getCntPage());
		log.info("페이지당 글 개수? cntPerPage? >> " + cntPerPage);
		log.info("PageDTO는? >> "+dto);
		log.info("searchName >> " + searchName);
		log.info("searchType >> " + searchType);
		
		return "admin/corpmemberlist";
	}
	
	// 계정관리
	@GetMapping("/adminaccount")
	public String trew(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");
		String birth_year = "";
		String birth_month = "";
		String birth_date = "";
		
		if (loginvo == null) {
			model.addAttribute("loginPublicInfo", null);
		} else{
			birth_year = loginvo.getM_birth().substring(0, 4);
			birth_month = loginvo.getM_birth().substring(4, 6);
			birth_date = loginvo.getM_birth().substring(6);
			
			model.addAttribute("loginPublicInfo", loginvo);
			model.addAttribute("birthYear", birth_year);
			model.addAttribute("birthMonth", birth_month);
			model.addAttribute("birthDate", birth_date);
			log.info(loginvo);
		}
		log.info("마이페이지로 갑니다");
		return "admin/adminAccountPage";
	}
	
	@ResponseBody
	@PostMapping(value = "/pmemberDelete")
	public Object rjdaf(HttpSession session, HttpServletRequest req) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		String[] arr = req.getParameterValues("m_idx");
		
		try {
			if(arr != null && arr.length > 0) {
				for(int i=0; i<arr.length; i++) {
					System.out.println(i + ":" + arr[i]);
					System.out.println(arr[i]);
					pm_service.publicDelete(arr[i]);
				}
				resultMap.put("result", "success");
			}else {
				resultMap.put("result", "false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	@ResponseBody
	@PostMapping(value = "/pmemberUpdate")
	public Object sldfk(HttpSession session, HttpServletRequest req) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		String[] arr = req.getParameterValues("m_idx");
		
		try {
			if(arr != null && arr.length > 0) {
				for(int i=0; i<arr.length; i++) {
					System.out.println(i + ":" + arr[i]);
					System.out.println(arr[i]);
					pm_service.publicUpdate(arr[i]);
				}
				resultMap.put("result", "success");
			}else {
				resultMap.put("result", "false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	@ResponseBody
	@PostMapping(value = "/corpDelete")
	public Object awed(HttpSession session, HttpServletRequest req) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		String[] arr = req.getParameterValues("c_idx");
		
		try {
			if(arr != null && arr.length > 0) {
				for(int i=0; i<arr.length; i++) {
					System.out.println(i + ":" + arr[i]);
					System.out.println(arr[i]);
					cm_service.corpDelete(arr[i]);
				}
				resultMap.put("result", "success");
			}else {
				resultMap.put("result", "false");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	@RequestMapping(value = "/countPmember", method = RequestMethod.GET)
	public @ResponseBody List<B_PublicMemberVO> pmembercount(Model model, B_PublicMemberVO vo){
		
		List<B_PublicMemberVO> pcount = pm_service.pCount();
		model.addAttribute("pcount",pcount);
		List<B_CorpMemberVO> ccount = cm_service.cCount();
		model.addAttribute("ccount",ccount);
		
		log.info(pcount);
		
		return pcount;
	}
	
	@RequestMapping(value = "/countCmember", method = RequestMethod.GET)
	public @ResponseBody List<B_CorpMemberVO> cmembercount(Model model, B_CorpMemberVO vo){
		
		List<B_CorpMemberVO> ccount = cm_service.cCount();
		model.addAttribute("ccount",ccount);
		
		log.info(ccount);
		
		return ccount;
	}
}
