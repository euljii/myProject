package org.kg.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.service.B_corpMemberService;
import org.kg.service.B_publicMemberService;
import org.kg.service.P_PakageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/KingTrip/*")
@AllArgsConstructor
public class B_MainController {

	private B_publicMemberService pm_service;
	private B_corpMemberService cm_service;
	private P_PakageService service;

	
	@GetMapping("/main")
	public String home(HttpServletRequest request, Model model) {
		
		log.info("===================main");
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_PublicMemberVO loginPublicvo = (B_PublicMemberVO) session.getAttribute("public");
		B_CorpMemberVO loginCorpvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginPublicvo != null) {
			model.addAttribute("loginPublicInfo", loginPublicvo);
			log.info(loginPublicvo);
		} else if (loginPublicvo == null) {
			if (loginCorpvo != null) {
				model.addAttribute("loginCorpInfo", loginCorpvo);
				log.info(loginCorpvo);
			} else {
				model.addAttribute("loginPublicInfo", null);
				model.addAttribute("loginCorpInfo", null);
			}
		}

		return "home";
	}

	@GetMapping("/mainhome")
	public String mainhome(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		model.addAttribute("list", service.getMainList()); // 전체 리스트 목록

//		log.info("___________" + service.getMainList());
		
		
		B_PublicMemberVO loginPublicvo = null;
		B_CorpMemberVO loginCorpvo = null;
		
		if(session.getAttribute("public") instanceof B_PublicMemberVO) {
			loginPublicvo = (B_PublicMemberVO)session.getAttribute("public");
		}
		
		if(session.getAttribute("corp") instanceof B_CorpMemberVO) {
			loginCorpvo = (B_CorpMemberVO)session.getAttribute("corp");
		}
		
//		log.warn("1111-----------------" + session.getAttribute("public"));
//		log.warn(session.getAttribute("public") instanceof B_PublicMemberVO);
//		
//		log.warn("2222-----------------" + session.getAttribute("corp"));
//		log.warn(session.getAttribute("corp") instanceof B_CorpMemberVO);
		
		
		if(loginPublicvo == null) {
			if (loginCorpvo != null) {
				model.addAttribute("loginCorpInfo", loginCorpvo);
				log.info(loginCorpvo);
			} else {
				model.addAttribute("loginPublicInfo", null);
				model.addAttribute("loginCorpInfo", null);
			}
		}else {
			model.addAttribute("loginPublicInfo", loginPublicvo);
			log.info(loginPublicvo);
			int m_idx = loginPublicvo.getM_idx();
			model.addAttribute("heart", service.getheartMain(m_idx));	// 위시리스트 read
		}
		
		
		return "main";
	}

}
