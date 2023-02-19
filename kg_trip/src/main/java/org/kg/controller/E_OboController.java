package org.kg.controller;

import java.io.File;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.E_OboVO;
import org.kg.domain.E_PageDTO;
import org.kg.service.E_OboService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor         
@RequestMapping("/obo/*")
public class E_OboController {
	
	private E_OboService service;
	
	@GetMapping("/list")
	public String list(Model model, E_PageDTO dto, HttpServletRequest request,
			   @RequestParam(value="nowPage", required = false)String nowPage,
			   @RequestParam(value="cntPerPage", required = false)String cntPerPage,
			   @RequestParam(value="searchType", required = false)String searchType,
			   @RequestParam(value="searchName", required = false)String searchName,
			   @RequestParam(value="cat", required = false)String cat
			   ) {
	   
		HttpSession session = request.getSession(false);
	   
	   if (session == null) {
	      return "home";
	   }
	   
	   // 로그인해야 게시글 등록 버튼 보이게
	   B_PublicMemberVO loginPublicvo = (B_PublicMemberVO)session.getAttribute("public");
	   B_CorpMemberVO loginCorpVo = (B_CorpMemberVO)session.getAttribute("corp");
	   
	   // 개인회원 로그인
	   if (loginPublicvo == null) {
	      model.addAttribute("loginPublicInfo", null);
	      log.info("loginPublicInfo??" + loginPublicvo);
	      
	   }else {
	      model.addAttribute("loginPublicInfo", loginPublicvo);
	      log.info("loginPublicInfo??" + loginPublicvo);
	   }
	   
	   // 기업회원 로그인
	   if (loginCorpVo == null) {
		      model.addAttribute("loginCorpInfo", null);
		      log.info("loginCorpInfo??" + loginCorpVo);
		      
		   }else {
		      model.addAttribute("loginCorpInfo", loginCorpVo);
		      log.info("loginCorpInfo??" + loginCorpVo);
		   }
	   
	    if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
	    
	    // total 구하기
	    int total = service.getOboTotalCount(dto);
		model.addAttribute("total", total);
		log.info("총 글 수 ? >> " + dto.getTotal());
	    
		// 카테고리 리스트
		List<String> catList = new ArrayList<String>(List.of("여행","항공권","패키지","계정","신뢰센터","기타"));
		model.addAttribute("catList", catList);
		
		// 페이징DTO 객체 선언
	   	dto = new E_PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("pageMaker", dto);
		model.addAttribute("list", service.getOboList(dto));
		
		
		log.info("현재 페이지 넘버? nowPage? >> " + nowPage);
		log.info("페이지당 글 개수? cntPage? >> " + dto.getCntPage());
		log.info("페이지당 글 개수? cntPerPage? >> " + cntPerPage);
		log.info("PageDTO는? >> " + dto);
		
	   return "/obo/E_obo_list";
	}
	
	// view
   @GetMapping("/view")
   public String view(@RequestParam("o_num") long o_num, Model model,
 		  E_PageDTO dto, HttpServletRequest request) {
	   
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

	   log.info("선택된 글의 o_num"+o_num);
	   model.addAttribute("nick", service.getNickname(o_num));
	   
	   log.info("닉네임 무엇인지 ? >> " + service.getNickname(o_num));
	   
	   model.addAttribute("obo", service.view(o_num));
	   model.addAttribute("dto" , dto);
      
         return "/obo/E_obo_view";
      }
   
   // 원글 register 페이지 가기
   @GetMapping("/register")
   public String register(HttpServletRequest request, Model model) {
	   
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
		
      log.info("/registerOrigin 가는 중");
         return "/obo/E_obo_registerOrigin";
      }
   
   // 답글 register 페이지 가기
   @GetMapping("/registerRe")
   public String registerRe(@RequestParam("o_num") long o_num,HttpServletRequest request, Model model, E_PageDTO dto) {
	   log.info("registerRe 페이지 가는 중");
	   
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
		
		// o_num 넣어주기
		model.addAttribute("o_num", o_num);
		model.addAttribute("obo", service.view(o_num));
		log.info("o_num 받는지 확인 레쓰고 >> " + o_num);
		log.info("/registerRe 가는 중");
       
	   return "/obo/E_obo_registerRe";
   }

   // 원글 insert (파일 업로드 O)
   @PostMapping("/registerOrigin")
   public String registerOrigin(E_OboVO vo, RedirectAttributes rttr, HttpServletRequest request) throws IOException {
      
      log.info("답글register 중");
      log.info("o_num 받는지 확인 레쓰고 >> " + vo.getO_num());
      
      // 세션 처리
      HttpSession session = request.getSession(false);
      
      if (session == null) {
         return "home";
      }

      B_PublicMemberVO loginPublicvo = (B_PublicMemberVO)session.getAttribute("public");   // 세션에 저장되어있는 관리자 정보 꺼내오기 
      vo.setM_idx(loginPublicvo.getM_idx());                        // 관리자 식별번호 넣어주기 
      
            
      // 파일 업로드
      String o_file = null;
      MultipartFile uploadFile = vo.getUploadFile();
      
      
      if(!uploadFile.isEmpty()) {
         String originalFileName = uploadFile.getOriginalFilename();
         log.info("originalFileName은?! >> " + originalFileName);
         String ext = FilenameUtils.getExtension(originalFileName);   // 확장자 구하기
         log.info("ext(확장자)은?! >> " + ext);
         UUID uuid = UUID.randomUUID();   // uuid 구하기
         
         o_file = uuid + "." + ext ;
         uploadFile.transferTo(new File("C:\\upload\\"+o_file));

         vo.setO_file(o_file);
      }
      
      log.info("파일 업로드 준비 완!");

      // 카테고리 넣어주기
      
      vo.setO_cat(request.getParameter("o_cat"));
      
      // insert
      service.insertOrigin(vo);
      rttr.addFlashAttribute("result", "success");
      
      return "redirect:/obo/list"; 
   }
   
   // 답글 insert (파일 업로드 O)
   @PostMapping("/registerRe")
   public String registerRe(E_OboVO vo, RedirectAttributes rttr, Model model, HttpServletRequest request) throws IOException {
	   
	   log.info("답글 register 중");
	   
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
	   }                     // 관리자 식별번호 넣어주기 

	   vo.setM_idx(loginPublicvo.getM_idx());
	   
	   
	   // 파일 업로드
	   String o_file = null;
	   MultipartFile uploadFile = vo.getUploadFile();
	   
	   if(!uploadFile.isEmpty()) {
		   String originalFileName = uploadFile.getOriginalFilename();
		   log.info("originalFileName은?! >> " + originalFileName);
		   String ext = FilenameUtils.getExtension(originalFileName);   // 확장자 구하기
		   log.info("ext(확장자)은?! >> " + ext);
		   UUID uuid = UUID.randomUUID();   // uuid 구하기
		   
		   o_file = uuid + "." + ext ;
		   uploadFile.transferTo(new File("C:\\upload\\"+o_file));
		   
		   vo.setO_file(o_file);
	   }
	   
	   log.info("파일 업로드 준비 완!");
	   
	   // o_num 넣어주기
	   model.addAttribute("o_num", vo.getO_num());
	   log.info("답글 register중) o_num ?? >> " + vo.getO_num());
	   
	   // 원글 정보 확
	   log.info("originNo? >> " + vo.getO_originNo());
	   log.info("groupOrd? >> " + vo.getO_groupOrd());
	   log.info("groupLayer? >> " + vo.getO_groupLayer());
	   
	   log.info(vo);
	   // insert
	   service.insertRe(vo);
	   rttr.addFlashAttribute("result", "success");
	   
	   return "redirect:/obo/list"; 
   }
   
   // 글 삭제 ajax
   @DeleteMapping(value="/{o_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> remove(@PathVariable("o_num") Long o_num, E_OboVO vo, Model model, HttpServletRequest request){
	   
	   log.info("삭제할 거야.");
	   
	   HttpSession session = request.getSession(false);
	   // request.getSession()에서 파라미터 false로 전달하면
	   // 이미 생성된 세션이 있을 때 그 세션을 반환하고 없으면 null 반환한다
	   
	   // 관리자로 로그인해야 게시글 등록 버튼 보이게
	   B_PublicMemberVO loginPublicvo = (B_PublicMemberVO)session.getAttribute("public");
	   
	   if (loginPublicvo == null) {
	      model.addAttribute("loginPublicInfo", null);
	      log.info("loginPublicInfo??" + loginPublicvo);
	      
	   }else {
	      model.addAttribute("loginPublicInfo", loginPublicvo);
	      log.info("loginPublicInfo??" + loginPublicvo);
	   }                     // 관리자 식별번호 넣어주기 
	   
	   
	   // 로그인한 유저와 글 작성자가 일치할 경우 글 삭제
	   long usersIdx = loginPublicvo.getM_idx(); // 유저의 idx
	   long writersIdx = vo.getM_idx();			// 글쓴이의 idx
	   
	   int result = 0 ;
	   
	   if(usersIdx == writersIdx) {
		   service.remove(vo.getO_num());
		   
		   result = 1 ;
	   }else {
		   log.info("작성자가 일치하지 않습니다.");
	   }
	   
	   //return result;
	   return service.remove(o_num) == 1
	            ? new ResponseEntity<>("success", HttpStatus.OK)
	                  : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   // modify 페이지 가기
   @GetMapping("/modify")
   public String modify(@RequestParam("o_num") long o_num, Model model,E_OboVO vo, E_PageDTO dto, HttpServletRequest request) {
	   log.info("modify 페이지 가는 중");
	   
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
	   }                     // 관리자 식별번호 넣어주기 
	   
	   
	   // 카테고리 리스트
	   List<String> catList = new ArrayList<String>(List.of("여행","항공권","패키지","계정","신뢰센터","기타"));
	   model.addAttribute("catList", catList); 
	   
       model.addAttribute("obo", service.view(o_num));
       log.info("/modify 타고 있느뇽?");
       log.info("modify 페이지 갈 때 가져가는 vo값 ? " + vo.toString());
       
	   return "/obo/E_obo_modify";
   }

   // modify 수정하기 
   @PostMapping("/modify")
   public String modify(@RequestParam("o_num") long o_num, E_OboVO vo, RedirectAttributes rttr, HttpServletRequest request) throws IOException {
      log.info("modify" + vo);
      
      // 세션 처리
      HttpSession session = request.getSession(false);
      
      if (session == null) {
         return "home";
      }

      B_PublicMemberVO loginPublicvo = (B_PublicMemberVO)session.getAttribute("public");	// 세션에 저장되어있는 관리자 정보 꺼내오기 
      vo.setM_idx(loginPublicvo.getM_idx());                        						// 관리자 식별번호 넣어주기
      
      log.info("(이미지 업로드 전) o_file 값 ? >> " + vo.getO_file());
      
      // 파일 업로드
      String o_file = null;
      MultipartFile uploadFile = vo.getUploadFile();
      
      if(!uploadFile.isEmpty()) {	
    	  // o_file O input O -> 새값 교체
    	  
         String originalFileName = uploadFile.getOriginalFilename();
         log.info("originalFileName은?! >> " + originalFileName);
         String ext = FilenameUtils.getExtension(originalFileName);   // 확장자 구하기
         log.info("ext(확장자)은?! >> " + ext);
         UUID uuid = UUID.randomUUID();   // uuid 구하기
         
         o_file = uuid + "." + ext ;
         uploadFile.transferTo(new File("C:\\upload\\"+o_file));
         
         log.info("혹시 이걸 타나요 ?");
         
         vo.setO_file(o_file);
      }
      
      log.info("파일 업로드 준비 완!");
      log.info("(이미지 업로드 후) o_file 값 ? >> " + vo.getO_file());

      service.update(vo);
      log.info("o_num 찍히는지 확인? " + vo.getO_num());
      
      rttr.addFlashAttribute("vovo", vo);
      
      return "redirect:/obo/view?o_num="+vo.getO_num();   // redirect : 모델 안 쓰고 (따로 값 저장해서 페이지 이동해서) 쓰려고 
   }

   
   // 사진 삭제 ajax
   @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
		   value="/removeImg/{o_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> removeImg(@PathVariable("o_num") Long o_num, HttpServletRequest request){
	   
	   int result = 0 ;
	   
	   return service.makeFileNullUpdate(o_num) == 1
	            ? new ResponseEntity<>("success", HttpStatus.OK)
	                  : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
}
