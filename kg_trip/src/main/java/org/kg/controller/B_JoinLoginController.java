package org.kg.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kg.domain.AddressForm;
import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.BirthForm;
import org.kg.domain.LoginForm;
import org.kg.service.B_corpMemberService;
import org.kg.service.B_publicMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/Member/*")
public class B_JoinLoginController {

	private B_publicMemberService pm_service;
	private B_corpMemberService cm_service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	PasswordEncoder passwordEncoder;

	// 로그인 페이지로 단순이동
	@GetMapping("/login")
	public String loginForm(@ModelAttribute LoginForm loginform) {
		log.info("로그인페이지로 슝슝");
		return "login/loginPage";
	}

	// 로그인 할거임
	@PostMapping("/loginFormP")
	public String loginPublic(@ModelAttribute LoginForm loginform, BindingResult bindingResult,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		//암호화된 비밀번호 갖고오기 
		String encPw = pm_service.passwordlogin(loginform.getM_id()); //받아온 비밀번호 입력된비밀번호 비교
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); 
		boolean result = encoder.matches(loginform.getM_pw(), encPw); //같을경우 
		if(result) {
			loginform.setM_pw(encPw);
			
			HttpSession session = request.getSession(); // 세션이 있으면 있는 세션 반환, 없으면 신규 세션을 생성하여 반환

			B_PublicMemberVO loginvo = pm_service.loginPublic(loginform.getM_id(), loginform.getM_pw());

			// 오류나면 로그인페이지로 다시 감.
			if (loginvo == null) {
				session.setAttribute("public", null);
				bindingResult.reject("loginFail", "아이디 또는 비밀번호가 맞지 않습니다.");
				return "login/loginPage";
			}
			session.setAttribute("public", loginvo); // 세션에 로그인 회원 정보 보관

			log.info(session.getAttribute("public"));
		}
		log.info("로그인이 완료되었습니다.");
		return "redirect:/KingTrip/main";
	}

	@PostMapping("/loginFormC")
	public String loginCorp(@ModelAttribute LoginForm loginform, BindingResult bindingResult,
			HttpServletRequest request, HttpServletResponse response) {
		
		//암호화된 비밀번호 갖고오기
		String encPw = cm_service.passwordlogin(loginform.getC_id());
		//받아온 비밀번호 입력된비밀번호 비교
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean result = encoder.matches(loginform.getC_pw(), encPw);
		if(result) {
			loginform.setC_pw(encPw);
			
			HttpSession session = request.getSession(); // 세션이 있으면 있는 세션 반환, 없으면 신규 세션을 생성하여 반환
	
			B_CorpMemberVO loginvo = cm_service.loginCorp(loginform.getC_id(), loginform.getC_pw());
	
			// 오류나면 로그인페이지로 다시 감.
			if (loginvo == null) {
				session.setAttribute("corp", null);
				bindingResult.reject("loginFail", "아이디 또는 비밀번호가 맞지 않습니다.");
				return "login/loginPage";
			}
			session.setAttribute("corp", loginvo); // 세션에 로그인 회원 정보 보관
	
			log.info(session.getAttribute("corp"));
		}
		return "redirect:/KingTrip/main";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/KingTrip/main";
	}

	// 회원가입 개인/기업 선택
	@GetMapping("/join")
	public String test() {

		return "join/joinPage";
	}

	// 개인회원 가입페이지로 단순이동
	@GetMapping("/join/joinFormP")
	public String goJoinPageP() {

		return "join/joinFormP";
	}

	// 개인회원 가입 후 로그인 페이지로 이동
	@PostMapping("/join/joinFormP")
	public String joinPageP(B_PublicMemberVO publicinfo, RedirectAttributes rttr, BirthForm birthform) {
		log.info("※※※※※※※※※※※※join 성공※※※※※※※※※※※※");
		
		String year = birthform.getBirthYear();
		String month = birthform.getBirthMonth();
		String date = birthform.getBirthDate();
		publicinfo.setM_birth(year + month + date);
		log.info(publicinfo.getM_birth());
		
		String encPassword = passwordEncoder.encode(publicinfo.getM_pw());
		publicinfo.setM_pw(encPassword);
		
		pm_service.joinPublic(publicinfo);
		rttr.addFlashAttribute("result", "okay");
		return "redirect:/Member/login";
	}

	// 기업회원 가입페이지로 단순이동
	@GetMapping("/join/joinFormC")
	public String joinFormC() {

		return "join/joinFormC";
	}

	// 기업회원 가입 후 로그인 페이지로 이동
	@PostMapping("/join/joinFormC")
	public String joinPageC(B_CorpMemberVO corpinfo, RedirectAttributes rttr, AddressForm addressform) {
		log.info("※※※※※※※※※※※※join 성공※※※※※※※※※※※※");
		
		String address = addressform.getAddress();
		String detailaddress = addressform.getDetailaddress();
		
		corpinfo.setC_address(address + detailaddress);
		
		if (corpinfo.getC_type() == 100) {
			log.info(corpinfo.getC_type());
			corpinfo.setC_type(corpinfo.getC_type());
		}else {
			corpinfo.setC_aircode("");
		}
		
		String encPassword = passwordEncoder.encode(corpinfo.getC_pw());
		corpinfo.setC_pw(encPassword);
		
		cm_service.joinCorp(corpinfo);
		rttr.addFlashAttribute("result", "okay");
		return "redirect:/Member/login";
	}

	// 개인 회원가입시 아이디 중복체크
	@GetMapping(value = "/public/idCheckP", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public int publicidCheck(@RequestParam("m_id") String m_id) {
		log.info("개인회원 아이디 중복체크 : " + m_id);
		return pm_service.publicIdCheck(m_id);
	}
	
	// 개인 회원가입시 닉네임 중복체크
		@GetMapping(value = "/public/nicknameCheckP", produces = { MediaType.APPLICATION_JSON_VALUE })
		@ResponseBody
		public int publicnicknameCheck(@RequestParam("m_nickname") String m_nickname) {
			log.info("개인회원 닉네임 중복체크 : " + m_nickname);
			return pm_service.publicNicknameCheck(m_nickname);
		}

	// 개인 회원가입시 이메일 중복체크
	@GetMapping(value = "/public/emailCheckP", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public int publicEmailCheck(@RequestParam("m_email") String m_email) {
		log.info("개인회원 이메일 중복체크 : " + m_email);
		return pm_service.publicEmailCheck(m_email);
	}

	// 개인 회원가입시 핸드폰 중복체크
	@GetMapping(value = "/public/phoneCheckP", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public int publicPhoneCheck(@RequestParam("m_phone") String m_phone) {
		log.info("개인회원 핸드폰 중복체크 : " + m_phone);
		return pm_service.publicPhoneCheck(m_phone);
	}

	// 기업 회원가입시 아이디 중복체크
	@GetMapping(value = "/corp/idCheckC", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public int corpidCheck(@RequestParam("c_id") String c_id) {
		log.info("기업회원 아이디 중복체크 : " + c_id);
		return cm_service.corpIdCheck(c_id);
	}

	// 기업 회원가입시 이메일 중복체크
	@GetMapping(value = "/corp/demailCheckC", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public int corpemailCheck(@RequestParam("c_demail") String c_demail) {
		log.info("기업회원 이메일 중복체크 : " + c_demail);
		return cm_service.corpEmailCheck(c_demail);
	}

	// 기업 회원가입시 번호 중복체크
	@GetMapping(value = "/corp/dphoneCheckC", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public int corpphoneCheck(@RequestParam("c_dphone") String c_dphone) {
		log.info("기업회원 휴대폰 중복체크 : " + c_dphone);
		return cm_service.corpPhoneCheck(c_dphone);
	}
	
	/* 이메일 인증 */
	@GetMapping(value="/public/mailCheck")
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        // 인증번호(난수) 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info(checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "tpgkxmwhd2@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "my youth trip 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        return num;
    }
	
	@GetMapping("/delete")
	public String leaveMember(HttpServletRequest request, Model model) {
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

		return "/join/leaveMember";
	}
	
	@RequestMapping(value="/pwCheck" , method=RequestMethod.POST)
	@ResponseBody
	public int pwCheck(@ModelAttribute LoginForm loginform,HttpSession session) throws Exception{
		
		B_PublicMemberVO loginPublicvo = (B_PublicMemberVO) session.getAttribute("public");
		B_CorpMemberVO loginCorpvo = (B_CorpMemberVO) session.getAttribute("corp");
		
		if(loginPublicvo != null) {
			//암호화된 비밀번호 갖고오기
			String encPw = pm_service.passwordlogin(loginform.getM_id());
			//받아온 비밀번호 입력된비밀번호 비교
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(!encoder.matches(loginform.getM_pw(), encPw)) {
				log.info(loginform.getM_pw());
				log.info(encPw);
				return 0;
			}
		}
		if(loginCorpvo != null) {
			//암호화된 비밀번호 갖고오기
			String encPw = cm_service.passwordlogin(loginform.getC_id());
			//받아온 비밀번호 입력된비밀번호 비교
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(!encoder.matches(loginform.getC_pw(), encPw)) {
				return 0;
			}
		}
		return 1;
	}
	
 	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(String m_idx,String c_idx, RedirectAttributes rttr,HttpSession session)throws Exception{
	
	B_PublicMemberVO loginPublicvo = (B_PublicMemberVO) session.getAttribute("public");
	B_CorpMemberVO loginCorpvo = (B_CorpMemberVO) session.getAttribute("corp");
	 
	 if(loginPublicvo != null) {
		 pm_service.publicDelete(m_idx);
	 }
	 if(loginCorpvo != null) {
		 cm_service.corpDelete(c_idx);
	 }
		session.invalidate();
		rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
		return "redirect:/Member/login";
	}
	
 	@GetMapping("/updatePw")
 	public String pwUpdateView(HttpServletRequest request, Model model) throws Exception{
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
		return "/login/updatePw";
	}
 	
 	@RequestMapping(value="/pwUpdate" , method=RequestMethod.POST)
	public String pwUpdate(LoginForm loginform,RedirectAttributes rttr,HttpSession session)throws Exception{
 		
 		B_PublicMemberVO loginPublicvo = (B_PublicMemberVO) session.getAttribute("public");
 		B_CorpMemberVO loginCorpvo = (B_CorpMemberVO) session.getAttribute("corp");
 		
 		if(loginPublicvo != null) {
	 		String encPassword = passwordEncoder.encode(loginform.getUpdate_mpw());
	 		
	 		B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");
	 		loginvo.setM_pw(encPassword);
			session.setAttribute("public", loginvo);
			
			log.info(loginform.getM_id() + loginform.getUpdate_mpw() + encPassword);
	 		log.info(loginvo);
			pm_service.ppwUpdate(loginvo);
	 	}
 		if(loginCorpvo != null) {
 			String encPassword = passwordEncoder.encode(loginform.getUpdate_cpw());
 			
 			B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");
 			loginvo.setC_pw(encPassword);
 			session.setAttribute("corp", loginvo);
 			
 			log.info(loginform.getC_id() + loginform.getUpdate_cpw() + encPassword);
 			log.info(loginvo);
 			cm_service.cpwUpdate(loginvo);
 		}
 		session.invalidate();
 			
		return "redirect:/Member/login";
	}
 	
 	@GetMapping("/help/findIdPw")
 	public String findId() {
 		return "/login/findIdPw";
 	}
 	
 	@GetMapping("/help/findIdFormP")
 	public String findIdFormP() {
 		return "/login/findIdFormP";
 	}
 	@GetMapping("/help/findIdFormC")
 	public String findIdFormC() {
 		return "/login/findIdFormC";
 	}
 	@GetMapping("/help/findPwFormP")
 	public String findPwFormP() {
 		return "/login/findPwFormP";
 	}
 	@GetMapping("/help/findPwFormC")
 	public String findPwFormC() {
 		return "/login/findPwFormC";
 	}
 	
 	@PostMapping("/findIdFormP")
 	public String findIdFormP(B_PublicMemberVO vo, RedirectAttributes rttr, Model model) {
 		if(vo.getM_phone() != "") {
 			B_PublicMemberVO result_p = pm_service.findIdPPhone(vo);
 			model.addAttribute("findpvo", pm_service.findIdPPhone(vo));
	 		log.info(vo.getM_name());
	 		log.info(vo.getM_phone());
	 		log.info(result_p);
 		}
 		if(vo.getM_email() != "") {
 			B_PublicMemberVO result_e = pm_service.findIdPEmail(vo);
 			model.addAttribute("findpvo", pm_service.findIdPEmail(vo));
	 		log.info(vo.getM_name());
	 		log.info(vo.getM_email());
	 		log.info(result_e);
 		}
 		return "/login/foundIdPage";
 	}
 	
 	@PostMapping("/findIdFormC")
 	public String findIdFormC(B_CorpMemberVO vo, RedirectAttributes rttr, Model model) {
 		if(vo.getC_code()!= "") {
 			B_CorpMemberVO result_c = cm_service.findIdCCode(vo);
 			model.addAttribute("findcvo", cm_service.findIdCCode(vo));
	 		log.info(vo.getC_dname());
	 		log.info(vo.getC_code());
	 		log.info(result_c);
 		}
 		if(vo.getC_dphone()!= "") {
 			B_CorpMemberVO result_c = cm_service.findIdCPhone(vo);
 			model.addAttribute("findcvo", cm_service.findIdCPhone(vo));
 			log.info(vo.getC_dname());
 			log.info(vo.getC_dphone());
 			log.info(result_c);
 		}
 		if(vo.getC_demail()!= "") {
 			B_CorpMemberVO result_c = cm_service.findIdCEmail(vo);
 			model.addAttribute("findcvo", cm_service.findIdCEmail(vo));
 			log.info(vo.getC_dname());
 			log.info(vo.getC_demail());
 			log.info(result_c);
 		}
 		return "/login/foundIdPage";
 	}
 	
 	@PostMapping("/findPwFormP")
 	public String findPwFormP(B_PublicMemberVO vo, Model model) {
 		log.info(vo);
 		
 		if(pm_service.findPwPCheck(vo) == 0) {
 			log.info("회원정보 없음");
 			model.addAttribute("msg", "입력한 정보를 확인해주세요.");
 			return "/login/findPwFormP";
 		}else {
 			// 인증번호(난수) 생성
 	        Random random = new Random();
 	        String key = "";
 	        for (int i = 0; i < 4; i++) {
 				int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
 				key += (char) index;
 			}
 			int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
 			key += numIndex;
 	        log.info(key);
 	       /* 이메일 보내기 */
 	        String setFrom = "tpgkxmwhd2@naver.com";
 	        String toMail = vo.getM_email();
 	        String title = "my youth trip 임시 비밀번호 입니다.";
 	        String content = "임시 비밀번호 발급" +
 	                "<br><br>" +
 	        		vo.getM_id() + "님"+"<br>"+
 	                "인증 비밀번호는 " + key + "입니다." + 
 	                "<br>" + 
 	                "로그인 후 비밀번호 변경을 해주세요.";
 	        
 	        try {
 	            MimeMessage message = mailSender.createMimeMessage();
 	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
 	            helper.setFrom(setFrom);
 	            helper.setTo(toMail);
 	            helper.setSubject(title);
 	            helper.setText(content,true);
 	            mailSender.send(message);
 	        }catch(Exception e) {
 	            e.printStackTrace();
 	        }
 	        // 인증번호 디비에 암호화
 	        String encPassword = passwordEncoder.encode(key);
 	        vo.setM_pw(encPassword);
 	        pm_service.findPwP(vo);
 	        log.info(encPassword);
 	        log.info(vo);
 	        model.addAttribute("findpvo",vo);
 		}
 		
 		return "/login/foundPwPage";
 	}
 	
 	@PostMapping("/findPwFormC")
 	public String findPwFormC(B_CorpMemberVO vo, Model model) {
 		log.info(vo);
 		
 		if(cm_service.findPwCCheck(vo) == 0) {
 			log.info("회원정보 없음");
 			model.addAttribute("msg", "입력한 정보를 확인해주세요.");
 			return "/login/findPwFormC";
 		}else {
 			// 인증번호(난수) 생성
 	        Random random = new Random();
 	        String key = "";
 	        for (int i = 0; i < 4; i++) {
 				int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
 				key += (char) index;
 			}
 			int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
 			key += numIndex;
 	        log.info(key);
 	       /* 이메일 보내기 */
 	        String setFrom = "tpgkxmwhd2@naver.com";
 	        String toMail = vo.getC_demail();
 	        String title = "my youth trip 임시 비밀번호 입니다.";
 	        String content = "임시 비밀번호 발급" +
 	                "<br><br>" +
 	        		vo.getC_id() + "님"+"<br>"+
 	                "인증 비밀번호는 " + key + "입니다." + 
 	                "<br>" + 
 	                "로그인 후 비밀번호 변경을 해주세요.";
 	        
 	        try {
 	            MimeMessage message = mailSender.createMimeMessage();
 	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
 	            helper.setFrom(setFrom);
 	            helper.setTo(toMail);
 	            helper.setSubject(title);
 	            helper.setText(content,true);
 	            mailSender.send(message);
 	        }catch(Exception e) {
 	            e.printStackTrace();
 	        }
 	        // 인증번호 디비에 암호화
 	        String encPassword = passwordEncoder.encode(key);
 	        vo.setC_pw(encPassword);
 	        cm_service.findPwC(vo);
 	        log.info(encPassword);
 	        log.info(vo);
 	        model.addAttribute("findcvo",vo);
 		}
 		return "/login/foundPwPage";
 	}
}
