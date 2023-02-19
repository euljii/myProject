package com.sunrise.board.controller;

import java.util.List;

import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunrise.board.service.BoardService;
import com.sunrise.board.vo.BoardVO;
import com.sunrise.board.vo.ComCodeVO;
import com.sunrise.board.vo.LoginForm;
import com.sunrise.board.vo.UserInfoVO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class BoardController extends HttpServlet{
	
	@Autowired
	BoardService bbService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String board(Locale locale, Model model, BoardVO vo) {
		
		List<BoardVO> list = bbService.boardList();
		model.addAttribute("list",list);

		int total = 0;
		total = bbService.boardCount(vo);
		model.addAttribute("total", total);
		
		return "boardList";
	}
	
	/* AJAX */
	@RequestMapping(value = "/totalChecker", produces = "application/json; charset=utf8")
	@ResponseBody
	public int totalCheck(@RequestParam("param") String parameter) {
		int result = 0;
		result = bbService.totalCheckerLogic(parameter);
		return result;
	}
	
	/* 0822 */
	/* 회원가입 */
	@RequestMapping(value = "/goJoin", method = RequestMethod.GET)
	public String goJoin(Locale locale, Model model) {
		
		
		List<ComCodeVO> phoneList = bbService.selectPhoneCode();
		model.addAttribute("phoneList",phoneList);
		
		return "join";
	}
	
	
	/* login */
	@RequestMapping(value = "/goLogin", method = RequestMethod.GET)
	public String goLogin(Locale locale, Model model) {
		
		return "login";
	}
	
	
	/* boardWrite */
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) {
		
		return "boardWrite";
	}
	
	
	/* boardView */
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model) {
		
		return "boardView";
	}
	
	/* update */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Locale locale, Model model) {
		
		return "update";
	}
	
	
	/* 폼 작성 후 회원가입 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Locale locale, Model model, UserInfoVO userVO, String USER_ID) {
		
		System.out.println("타나요");
		bbService.join(userVO);
		System.out.println(userVO.toString());
		
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		System.out.println("id = " + id);
		int cnt = bbService.idCheck(id);
		
		return cnt;
	}
	
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public int pwCheck(@RequestParam("id") String id, @RequestParam("pw") String pw) {
		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		
		UserInfoVO vo = new UserInfoVO();
		vo.setUSER_ID(id);
		vo.setUSER_PW(pw);
		int cnt = bbService.pwCheck(vo);
		return cnt;
	}
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.POST)
	public String loginSuccess(UserInfoVO vo, HttpSession session) {
		UserInfoVO userVO = bbService.getUser(vo);
		System.out.println(userVO.getUSER_ID());
		System.out.println(userVO.getUSER_PW());
		System.out.println(userVO.getUSER_NAME());
		System.out.println(userVO.getUSER_PHONE1());
		System.out.println(userVO.getUSER_PHONE2());
		System.out.println(userVO.getUSER_PHONE3());
		System.out.println(userVO.getCREATE_TIME());
		
		session.setAttribute("userInfo", userVO);
		/* session.removeAttribute("userInfo"); // 로그아웃 */
		return "redirect:/list";
	}
	
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login (UserInfoVO userVO) {
		
		System.out.println("타나요?");
		
		String id = userVO.getUSER_ID();
		String pw = userVO.getUSER_PW();
		
		System.out.println("여까진 타나요?");
		
		// id 넣고 맞는 비번 가져오기 
		String rightPw = bbService.checkPw(id);
		
		System.out.println("여기도 타나요?");
		System.out.println("rightPw? >> "+ rightPw);

		
		
		// 로그인 정보 가져오기
		UserInfoVO userInfo = bbService.getUser(userVO);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 내 코드..
		
//		if(pw.equals(rightPw)) {	// ㅂㅣ교하기
//			
//			if(userInfo != null) {	// 아이디와 비번이 마
//			
//				/* HttpSession session = request.getSession(); */			// 세션 객체 생성
//				// 세션 객체 생성 > 세션 있으면 기존 세션 반환, 없으면 새로운 세션 생성
//				
//				session.setAttribute("userInfo", userInfo);				// 유저 정보를 세션 데이터로 저장
//				
//				return "redirect:/list";
//			}
//		}else {
//			
//			return "redirect:/goLogin";
//		}
		
		/* String userPw = bbService.checkPw(userVO.getUSER_ID()); */
		
		/*
//		if(pw.equals(userPw)) {	// 입력한 비번이 디비상 회원 비번과 같으면
//			
//			HttpSession session = request.getSession(true);			// 세션 객체 생성
//			session.setAttribute("userInfo", session);				// 세션 데이터 저장
//			
//		}
			서버에서 해당 사용자 있는지 확인.
		(스크립트에서 입력한 비번과 디비상 비번 비교)
		> 
		if(맞으면){
		
		   임의의 세션ID를 생성하여 키밸류 형식으로 저장
		   (uuid 사용해 세션ID 만듦-추정불가)
		   : 세션 데이터 저장 (세션.셋어트리뷰트)
		
		   서버에서 생성된 세션ID를 클라이언트에게 전달,
		   클라이언트는 쿠키 저장소에 세션ID를 보관   
		
		}else{
		   빠꾸
		}

		
		*/
		return "redirect:/list";
	}
		
	
	
}
