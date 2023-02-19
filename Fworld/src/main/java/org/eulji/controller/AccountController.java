package org.eulji.controller;

import java.io.IOException;

import org.eulji.domain.AccountVO;
import org.eulji.service.accountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor         // 보드컨트롤러는 보드서비스에 대해 의존적 > 어노테이션 이용해 생성자 만들고 자동 주입하도록
@RequestMapping("/account/*")
public class AccountController {
	
	private accountService service;
	
	@GetMapping("/loginPage")
	public String loginPage() {
		log.info("~login 페이지 가는 중 ~");
		return "/account/login";
	}
	
	@GetMapping("/joinPage")
	public String joinPage() {
		log.info("~join 페이지 가는 중 ~");
		return "/account/join";
	}
	
	@PostMapping("/letsJoin")
	public String join(AccountVO vo) throws IOException{
		
		log.info("가입중");
		
		service.join(vo);
		
		log.info("가입완료");
		return "home";
	}

}
