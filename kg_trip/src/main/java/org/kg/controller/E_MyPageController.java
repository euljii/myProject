package org.kg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.E_OboVO;
import org.kg.domain.E_PageDTO;
import org.kg.service.E_NoticeService;
import org.kg.service.E_OboService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor         // 보드컨트롤러는 보드서비스에 대해 의존적 > 어노테이션 이용해 생성자 만들고 자동 주입하도록
@RequestMapping("/mypage/*")
public class E_MyPageController {

	private E_NoticeService ntService;
	private E_OboService oboService;
   
   @GetMapping("/ntList")
   // 리스트를 가져와서 화면단에 던져주기 그런데 여기서 어떻게 jsp에 아래 메소드를 태우나?
   // -> 26번줄에서 get,post방식으로 던질 건지 정해서 던져준다. 그럼 19번줄의 urlmapping 값에 매칭된다.
   public String ntList(Model model, E_PageDTO dto, HttpServletRequest request,
		   @RequestParam(value="nowPage", required = false)String nowPage,
		   @RequestParam(value="cntPerPage", required = false)String cntPerPage
		   ) {
	   
	   int total = ntService.getTotal(dto);
      
	   HttpSession session = request.getSession(false);
	   // request.getSession()에서 파라미터 false로 전달하면
	   // 이미 생성된 세션이 있을 때 그 세션을 반환하고 없으면 null 반환한다
	   
	   if (session == null) {
	      return "home";
	   }
	   
	   // 관리자로 로그인해야 게시글 등록 버튼 보이게
	   B_PublicMemberVO loginPublicvo = (B_PublicMemberVO)session.getAttribute("public");
	   
	   if (loginPublicvo == null) {
	      model.addAttribute("loginPublicInfo", null);
	      log.info("loginPublicInfo??" + loginPublicvo);
	      
	   }else {
	      model.addAttribute("loginPublicInfo", loginPublicvo);
	      log.info("loginPublicInfo??" + loginPublicvo);
	   }
	   
	    if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
	    
	    
		model.addAttribute("total", total);
		
		// pageMaker라는 이름으로 pageDTO 객체 만들어서 model에 담아주기
		dto = new E_PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("pageMaker", dto);
		
	    // model.addAttribute("list", service.getListWithPaging(vo)); 랑 같은 애
	    model.addAttribute("list", ntService.getListWithPaging(dto));
		
		log.info("현재 페이지 넘버? nowPage? >> " + nowPage);
		log.info("페이지당 글 개수? cntPage? >> " + dto.getCntPage());
		log.info("페이지당 글 개수? cntPerPage? >> " + cntPerPage);
		log.info("PageDTO는? >> "+dto);
		
	   return "/notice/E_nt_mypage";
   }

	@GetMapping("/oboList")
	public String list(Model model, E_PageDTO dto, HttpServletRequest request,
			   @RequestParam(value="nowPage", required = false)String nowPage,
			   @RequestParam(value="cntPerPage", required = false)String cntPerPage,
			   @RequestParam(value="cat", required = false)String cat
			   ) {
	   
		HttpSession session = request.getSession(false);
	   
	   if (session == null) {
	      return "home";
	   }
	   
	   // 관리자로 로그인해야 게시글 등록 버튼 보이게
	   B_PublicMemberVO loginPublicvo = (B_PublicMemberVO)session.getAttribute("public");
	   
	   if (loginPublicvo == null) {
	      model.addAttribute("loginPublicInfo", null);
	      log.info("loginPublicInfo??" + loginPublicvo);
	      
	   }else {
	      model.addAttribute("loginPublicInfo", loginPublicvo);
	      log.info("loginPublicInfo??" + loginPublicvo);
	   }
	   
	   // m_idx에 현 로그인된 계정 식별번호 넣어주기 (마이페이지 리스트 where절에 필요)
//	   int m_idx = loginPublicvo.getM_idx();	// 로그인 회원 정보 담기
//	   dto.setM_idx(m_idx);						// 로그인 회원 정보 m_idx를 dto에 날리기
	   
//	   E_OboVO vo = new E_OboVO();
//	   vo.setM_idx(m_idx);						// 로그인 회원 정보 m_idx를 vo에 날리기
	   
	    if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
	    
	    
		// 카테고리 리스트
		List<String> catList = new ArrayList<String>(List.of("여행","항공권","패키지","계정","신뢰센터","기타"));
		model.addAttribute("catList", catList);
		log.info("총 글 수 ? >> " + oboService.getOboCount(dto));
		
		// pageMaker라는 이름으로 pageDTO 객체 만들어서 model에 담아주기
		dto = new E_PageDTO(oboService.getOboCount(dto), Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		int m_idx = loginPublicvo.getM_idx();	// 로그인 회원 정보 담기
		dto.setM_idx(m_idx);					// 로그인 회원 정보 m_idx를 dto에 날리기
		dto.setTotal(oboService.getOboCount(dto));
		
		model.addAttribute("pageMaker", dto);
		
		log.info("dto.toString ? >> " + dto.toString());
		
		model.addAttribute("list", oboService.myPageOboList(dto));
		System.out.println("--------------------------");
		System.out.println(oboService.myPageOboList(dto));
		System.out.println("--------------------------");
		
	    // total 구하기
	 	model.addAttribute("total", oboService.getOboCount(dto));
		
	 	int last = (int) Math.ceil((double)dto.getTotal()/(double)dto.getCntPerPage());
	 	dto.setLastPage(last);
	 	
	 	int end = ((int)Math.ceil((double)dto.getNowPage()/(double)dto.getCntPage())) * dto.getCntPerPage();
	 	dto.setEndPage(end);
	 	if(dto.getLastPage() < dto.getEndPage()) {
	 		dto.setEndPage(dto.getLastPage());
	 	}
	 	if(dto.getStartPage()< 1) {
	 		dto.setStartPage(1);
	 	}

	 	log.info("현재 페이지 넘버? nowPage? >> " + nowPage);
		log.info("페이지당 글 개수? cntPage? >> " + dto.getCntPage());
		log.info("페이지당 글 개수? cntPerPage? >> " + cntPerPage);
		log.info("PageDTO는? >> " + dto); 
		
	   return "/obo/E_obo_mypage";
	}
}
