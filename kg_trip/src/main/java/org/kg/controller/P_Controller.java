package org.kg.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.P_Pakage_info_VO;
import org.kg.domain.P_Pakage_list_VO;
import org.kg.domain.P_Pakage_reser_VO;
import org.kg.domain.P_Review_VO;
import org.kg.domain.P_bookInfo;
import org.kg.service.P_KakaopayPay;
import org.kg.service.P_PakageService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/pakage/*")
public class P_Controller {

	// P_pakageMain 메인페이지 이동
	private P_PakageService service;
	private P_KakaopayPay kakaopay;

	@GetMapping("/P_pakageMain")
	public String main(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_PublicMemberVO loginPublicvo = (B_PublicMemberVO) session.getAttribute("public");
		B_CorpMemberVO loginCorpvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginPublicvo != null) {
			model.addAttribute("loginPublicInfo", loginPublicvo);
			log.info(loginPublicvo);
			int m_idx = loginPublicvo.getM_idx();
			model.addAttribute("heart", service.getheartMain(m_idx));	// 위시리스트 read
			log.info("-------------"+service.getheartMain(m_idx));
		} else if (loginPublicvo == null) {
			if (loginCorpvo != null) {
				model.addAttribute("loginCorpInfo", loginCorpvo);
				log.info(loginCorpvo);
			} else {
				model.addAttribute("loginPublicInfo", null);
				model.addAttribute("loginCorpInfo", null);
			}
		}
		
		model.addAttribute("listWeu", service.getListWeu()); // 서유럽 리스트 목록
		model.addAttribute("listSai", service.getListSai()); // 사이판 리스트 목록
		model.addAttribute("listKos", service.getListKos()); // 국내섬 리스트 목록
		

		return "pakage/P_pakageMain";
	}

	// 위시리스트 insert
	@PostMapping(value = "/P_wishinsert", 
			consumes = "application/json", 
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> winsert(@RequestBody P_Pakage_info_VO board) {
		
		log.info("-----------------"+board);
		
		board.setW_num(board.getM_idx()+board.getP_num());
		
		int insertCount = service.wishinsert(board);
		
		return insertCount == 1?
				new ResponseEntity<>("success", HttpStatus.OK) :
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 위시리스트 delete
	@PostMapping(value = "/P_wishdelete", 
			consumes = "application/json", 
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> wdelete(@RequestBody P_Pakage_info_VO board) {
		
		log.info("-----------------"+board);
		
		int insertCount = service.wishdelete(board);
		
		return insertCount == 1?
				new ResponseEntity<>("success", HttpStatus.OK) :
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// P_get 상세페이지 이동, 후기
	@GetMapping("/P_get")
	public String get(HttpServletRequest request, @RequestParam("p_num") String p_num, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_PublicMemberVO loginPublicvo = (B_PublicMemberVO) session.getAttribute("public");
		B_CorpMemberVO loginCorpvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginPublicvo != null) {
			model.addAttribute("loginPublicInfo", loginPublicvo);
			log.info(loginPublicvo);
			int m_idx = loginPublicvo.getM_idx();
			P_Pakage_info_VO vo = new P_Pakage_info_VO();
			vo.setM_idx(m_idx);
			vo.setP_num(p_num);
			model.addAttribute("heart", service.getheart(vo));	// 위시리스트 read
		} else if (loginPublicvo == null) {
			model.addAttribute("heart", null);	// 위시리스트
			if (loginCorpvo != null) {
				model.addAttribute("loginCorpInfo", loginCorpvo);
				log.info(loginCorpvo);
			} else {
				model.addAttribute("loginPublicInfo", null);
				model.addAttribute("loginCorpInfo", null);
			}
		}
		
		model.addAttribute("board", service.get(p_num));		// 상세 내용
		model.addAttribute("review", service.getReview(p_num));	// 후기 리스트 목록
		model.addAttribute("star", service.star(p_num));		// 평균 별점
		
		log.info(service.getReview(p_num));
		
		return "/pakage/P_get";
	}
	



	// P_reservation 예약페이지 이동
	@RequestMapping(value = "people", method = RequestMethod.POST)
	public String reservation(HttpServletRequest request, Locale locale, Model model, String p_num, int people) {
		
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
		
		log.info("---------------" + p_num);
		log.info("---------------" + people);

		model.addAttribute("board", service.get(p_num));
		model.addAttribute("p_rpeople", people);
		model.addAttribute("p_totalfee", service.get(p_num).getP_fee() * people);

		return "/pakage/P_reservation";
	}

	// 결제 카카오페이
	@PostMapping("/kakaoPayGo")
	public String kakaoPayGo(P_bookInfo bookInfo) {
		log.info("페이지이동 : 카카오페이 결제하기...");
		log.info("결제 및 예약 정보..." + bookInfo);
		// 통신에 성공하면 결제 정보를 가지고 있는 QR코드 생성하는 URL로 redirect!
		return "redirect:" + kakaopay.kakaoPayReady(bookInfo);
	}
	
	
	// 일반회원 : QR 결제 성공 후 정상적으로 결제 요청이 완료된 경우 ! => 결제 승인 요청 API 호출 (pg_token 필수!)
	@GetMapping(value = "/P_kakaoPaySuccess")
	public String kakaoPaySuccess(P_bookInfo bookInfo, HttpServletRequest request, Model model) {
		log.info("페이지이동 : 카카오페이 결제성공...");
		log.info("결제 및 예약 정보222..." + bookInfo);
		HttpSession session = request.getSession(false);
		B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");
		if (loginvo == null) {
			model.addAttribute("loginPublicInfo", null);
		}else {
			model.addAttribute("loginPublicInfo", loginvo);
			log.info(loginvo);
		}
		
		model.addAttribute("info", kakaopay.kakaoPayInfo(bookInfo));
		return "pakage/P_reservationGO";
	}
	

	// 예약하기 P_pakage_reser_tbl 추가, P_pakage_list_VO 수정
	@PostMapping(value = "/P_preservation",
				consumes = "application/json", 
	    		produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> Register(@RequestBody P_Pakage_reser_VO board, P_Pakage_list_VO liboard) {
		
		
		log.info("sssssssssssssssssssssssss"+board);
		
		
		String p_num = board.getP_num();
		liboard = service.getp(p_num);
		
		int result1 = service.register(board);
		
		liboard.setP_people(liboard.getP_people() + board.getP_rpeople());
		liboard.setP_available(liboard.getP_available() - board.getP_rpeople());
	
		int result2 = service.update(liboard);
		
		return (result1 & result2) == 1?
        		new ResponseEntity<>("success", HttpStatus.OK) :
 					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 항공권 예약 조회
	@GetMapping(value = "getreservation/{p_rnum}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<P_Pakage_reser_VO> getreservation(@PathVariable("p_rnum") String p_rnum) {
		
		log.info(service.mread(p_rnum));
		return new ResponseEntity<>(service.mread(p_rnum), HttpStatus.OK);
	}
	
	
	// P_allList 전체 리스트 페이지 이동
	@GetMapping("/P_allList")
	public String allList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_PublicMemberVO loginPublicvo = (B_PublicMemberVO) session.getAttribute("public");
		B_CorpMemberVO loginCorpvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginPublicvo != null) {
			model.addAttribute("loginPublicInfo", loginPublicvo);
			log.info(loginPublicvo);
			int m_idx = loginPublicvo.getM_idx();
			model.addAttribute("heart", service.getheartMain(m_idx));	// 위시리스트 read
		} else if (loginPublicvo == null) {
			if (loginCorpvo != null) {
				model.addAttribute("loginCorpInfo", loginCorpvo);
				log.info(loginCorpvo);
			} else {
				model.addAttribute("loginPublicInfo", null);
				model.addAttribute("loginCorpInfo", null);
			}
		}
		
		
		
		model.addAttribute("list", service.getList()); // 전체 리스트 목록

		return "pakage/P_allList";
	}
	
	
	
	// P_wishget
	@PostMapping(value = "/P_wish", 
			consumes = "application/json", 
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> wish(@RequestParam("m_idx") int m_idx) {
		
		log.info("m_idx........." + m_idx);
		
		return new ResponseEntity<>(service.getheartMain(m_idx), HttpStatus.OK);
	}
	
	// P_allList 검색 결과
	@PostMapping(value = "/P_jebal", 
			consumes = "application/json", 
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> search(@RequestParam("region") String region) {
		
		log.info("region........." + region);
		
		region = "%"+region+"%";
		
		return new ResponseEntity<>(service.search(region), HttpStatus.OK);
	}

	
	// P_allList 가격낮은순
	@PostMapping(value = "/P_linka",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> linka() {
		
		return new ResponseEntity<>(service.linka(), HttpStatus.OK);
	}
	
	// P_allList 가격높은순
	@PostMapping(value = "/P_linkb",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> linkb() {
		
		return new ResponseEntity<>(service.linkb(), HttpStatus.OK);
	}
	
	// P_allList 날짜빠른순
	@PostMapping(value = "/P_linkc",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> linkc() {
		
		return new ResponseEntity<>(service.linkc(), HttpStatus.OK);
	}
	// P_allList 날짜느린순
	@PostMapping(value = "/P_linkd",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> linkd() {
		
		return new ResponseEntity<>(service.linkd(), HttpStatus.OK);
	}
	// P_allList 후기많은순
	@PostMapping(value = "/P_linke",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> linke() {
		
		return new ResponseEntity<>(service.linke(), HttpStatus.OK);
	}
	
	// P_allList 별점높은순
	@PostMapping(value = "/P_linkf",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> linkf() {
		
		return new ResponseEntity<>(service.linkf(), HttpStatus.OK);
	}
	
	// P_allList 유럽검색
	@PostMapping(value = "/P_slinka",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> slinka() {
		
		return new ResponseEntity<>(service.slinka(), HttpStatus.OK);
	}
	// P_allList 동남아일본검색
	@PostMapping(value = "/P_slinkb",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> slinkb() {
		
		return new ResponseEntity<>(service.slinkb(), HttpStatus.OK);
	}
	// P_allList 하와이검색
	@PostMapping(value = "/P_slinkc",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> slinkc() {
		
		return new ResponseEntity<>(service.slinkc(), HttpStatus.OK);
	}
	// P_allList 괌사이판검색
	@PostMapping(value = "/P_slinkd",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> slinkd() {
		
		return new ResponseEntity<>(service.slinkd(), HttpStatus.OK);
	}
	// P_allList 국내여행검색
	@PostMapping(value = "/P_slinke",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_Pakage_info_VO>> P_slinke() {
		
		return new ResponseEntity<>(service.slinke(), HttpStatus.OK);
	}
	
	
	/////////////////////////////////////////////////////////////
	
	// P_wishlist
	@GetMapping("/P_wishlist")
	public String wishlist(HttpServletRequest request, Model model) {
		
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
			int m_idx = loginvo.getM_idx();
			model.addAttribute("heart", service.getheartMain(m_idx));	// 위시리스트 read
		}
		
		int m_idx = loginvo.getM_idx();
		
		model.addAttribute("wishlist", service.getwishlist(m_idx));
		
		return "pakage/P_wishlist";
	}
	
	
	// P_mlist 개인 구매 패키지 리스트 페이지 이동
	@GetMapping("/P_mlist")
	public String mlist(HttpServletRequest request, Model model) {
		
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
		
		int m_idx = loginvo.getM_idx();
		
		model.addAttribute("mlist", service.getmList(m_idx));
		
		log.info(service.getmList(m_idx));
		
		return "pakage/P_mlist";
	}
	
    @PostMapping("/P_kakaoPayCancel")
    public String kakaoPayCancel(P_bookInfo bookInfo, HttpServletRequest request, Model model) {
    	log.info("항공권 예약 환불하기...");
    	log.info("환불정보..." + bookInfo);
    	HttpSession session = request.getSession(false);
    	B_PublicMemberVO loginvo = (B_PublicMemberVO) session.getAttribute("public");
    	if (loginvo == null) {
    		model.addAttribute("loginPublicInfo", null);
    	}else {
    		model.addAttribute("loginPublicInfo", loginvo);
    		log.info(loginvo);
    	}
    	
		
		model.addAttribute("refundInfo", kakaopay.kakaoPayCancel(bookInfo));
		
		
		int m_idx = loginvo.getM_idx();
		model.addAttribute("mlist", service.getmList(m_idx));
    	return "pakage/P_mlist"; 
    }
	
    
    /*
	// 개인 예약취소
	@GetMapping("/P_mdelete")
	public String mdelete(HttpServletRequest request, @RequestParam("p_rnum") String p_rnum,
			@RequestParam("p_num") String p_num, Model model) {

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

		// 개인 예약취소 update - list테이블 예약가능인원 증가
		
		P_Pakage_reser_VO board = new P_Pakage_reser_VO();
		board = service.mread(p_rnum);
		
		
		P_Pakage_list_VO liboard = new P_Pakage_list_VO();
		liboard = service.getp(p_num);
		
		log.info(liboard);
		
		liboard.setP_people(liboard.getP_people() - board.getP_rpeople());
		liboard.setP_available(liboard.getP_available() + board.getP_rpeople());
		service.mupdatea(liboard);
		
		
		// 개인 예약취소 delete
		service.mdeletea(p_rnum);
		
		model.addAttribute("listWeu", service.getListWeu()); // 서유럽 리스트 목록
		model.addAttribute("listSai", service.getListSai()); // 사이판 리스트 목록
		model.addAttribute("listkos", service.getListKos()); // 국내섬 리스트 목록
		
		return "/pakage/P_pakageMain";
	}
	
	*/
	// P_rinsert 후기 등록페이지 이동
	@GetMapping("/P_rinsert")
	public String rinsert(HttpServletRequest request, @RequestParam("p_rnum") String p_rnum,
			@RequestParam("p_num") String p_num, Model model) {
	
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
		
		model.addAttribute("p_rnum", p_rnum);
		model.addAttribute("p_num", p_num);
		
		return "pakage/P_rinsert";
	}
	
	// 후기 등록
	@PostMapping("/uploadFormAction") 
	public String uploadFormAction(HttpServletRequest request, MultipartFile[] uploadFile, P_Review_VO rboard, Model model) {
		
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
		
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile : uploadFile) {
		
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " +multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try { 
				multipartFile.transferTo(saveFile);
			 } catch(Exception e) {
				log.error(e.getMessage());
			 }
			
			rboard.setP_reviewimg(multipartFile.getOriginalFilename());	// 파일 업로드
			
			log.info(rboard);
			
			service.rregister(rboard); // 후기 등록
			
			String p_num = rboard.getP_num();
			
			model.addAttribute("board", service.get(p_num));		// 상세 내용
			model.addAttribute("review", service.getReview(p_num));	// 후기 리스트 목록
			model.addAttribute("star", service.star(p_num));		// 평균 별점
			
		}
		return "/pakage/P_get";
	}
	

	
	
	
	
	/////////////////////////////////////////////////////////////
	
	// P_clist 기업 패키지 리스트 페이지 이동
	@GetMapping("/P_clist")
	public String clist(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginvo == null) {
			model.addAttribute("loginCorpInfo", null);
		} else {
			model.addAttribute("loginCorpInfo", loginvo);
			log.info(loginvo);
		}
		
		int c_idx = loginvo.getC_idx();
		
		model.addAttribute("clist", service.getcList(c_idx));
		
		
		return "pakage/P_clist";
	}
	
	// P_cinsert 기업 패키지 등록 페이지 이동
	@GetMapping("/P_cinsert")
	public String cinsert(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}
		
		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");
		
		if (loginvo == null) {
			model.addAttribute("loginCorpInfo", null);
		} else {
			model.addAttribute("loginCorpInfo", loginvo);
			log.info(loginvo);
		}
		
		return "pakage/P_cinsert";
	}
	
	// P_cinsert p_num 중복 확인
	@GetMapping(value = "/checkp_num", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public int checkp_num(@RequestParam("p_num") String p_num) {
		log.info("기업회원 아이디 중복체크 : " + p_num);
		return service.checkp_num(p_num);
	}
	
	
	// 패키지 등록
	@PostMapping("/uploadFormGo") 
	public String uploadFormGo(HttpServletRequest request, MultipartFile[] uploadFilea, MultipartFile[] uploadFileb,
			 MultipartFile[] uploadFilec, MultipartFile[] uploadFiled, MultipartFile[] uploadFilee,
			 P_Pakage_list_VO liboard, P_Pakage_info_VO board, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginvo == null) {
			model.addAttribute("loginCorpInfo", null);
		} else {
			model.addAttribute("loginCorpInfo", loginvo);
			log.info(loginvo);
		}

		log.info("--------------------" + liboard);
		
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile1 : uploadFilea) {
		
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile1.getOriginalFilename());
			log.info("upload File Size : " +multipartFile1.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile1.getOriginalFilename());
			
			try { 
				multipartFile1.transferTo(saveFile);
			 } catch(Exception e) {
				log.error(e.getMessage());
			 }
			board.setP_mainimg(multipartFile1.getOriginalFilename());
		}
		
		for(MultipartFile multipartFile2 : uploadFileb) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile2.getOriginalFilename());
			log.info("upload File Size : " +multipartFile2.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile2.getOriginalFilename());
			
			try { 
				multipartFile2.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img1(multipartFile2.getOriginalFilename());
		}
		for(MultipartFile multipartFile3 : uploadFilec) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile3.getOriginalFilename());
			log.info("upload File Size : " +multipartFile3.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile3.getOriginalFilename());
			
			try { 
				multipartFile3.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img2(multipartFile3.getOriginalFilename());
		}
		
		for(MultipartFile multipartFile4 : uploadFiled) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile4.getOriginalFilename());
			log.info("upload File Size : " +multipartFile4.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile4.getOriginalFilename());
			
			try { 
				multipartFile4.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img3(multipartFile4.getOriginalFilename());
		}
		
		for(MultipartFile multipartFile5 : uploadFilee) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile5.getOriginalFilename());
			log.info("upload File Size : " +multipartFile5.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile5.getOriginalFilename());
			
			try { 
				multipartFile5.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img4(multipartFile5.getOriginalFilename());
		}
		
		int c_idx = loginvo.getC_idx();
		
		board.setC_idx(c_idx); 
		board.setP_period(board.getP_period1()+" ~ "+board.getP_period2());
		
		service.cinserta(board);
		
		liboard.setP_people(0);
		liboard.setP_available(0);
		liboard.setP_period(board.getP_period());
		service.cinsertb(liboard);
		
		model.addAttribute("clist", service.getcList(c_idx));
	
		return "/pakage/P_clist";
	}

	// 패키지 수정 페이지 이동
	@GetMapping("/P_cmodify")
	public String cmodify(HttpServletRequest request, @RequestParam("p_num") String p_num, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginvo == null) {
			model.addAttribute("loginCorpInfo", null);
		} else {
			model.addAttribute("loginCorpInfo", loginvo);
			log.info(loginvo);
		}
		
		model.addAttribute("board", service.get(p_num));

		return "/pakage/P_cmodify";
	}
	
	// 패키지 수정
	@PostMapping("/uploadFormMo") 
	public String uploadFormMo(HttpServletRequest request, MultipartFile[] uploadFilea, MultipartFile[] uploadFileb,
			 MultipartFile[] uploadFilec, MultipartFile[] uploadFiled, MultipartFile[] uploadFilee,
			 P_Pakage_list_VO liboard, P_Pakage_info_VO board, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginvo == null) {
			model.addAttribute("loginCorpInfo", null);
		} else {
			model.addAttribute("loginCorpInfo", loginvo);
			log.info(loginvo);
		}
		
		log.info("--------------------" + liboard);
		
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile1 : uploadFilea) {
		
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile1.getOriginalFilename());
			log.info("upload File Size : " +multipartFile1.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile1.getOriginalFilename());
			
			try { 
				multipartFile1.transferTo(saveFile);
			 } catch(Exception e) {
				log.error(e.getMessage());
			 }
			board.setP_mainimg(multipartFile1.getOriginalFilename());
		}
		
		for(MultipartFile multipartFile2 : uploadFileb) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile2.getOriginalFilename());
			log.info("upload File Size : " +multipartFile2.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile2.getOriginalFilename());
			
			try { 
				multipartFile2.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img1(multipartFile2.getOriginalFilename());
		}
		for(MultipartFile multipartFile3 : uploadFilec) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile3.getOriginalFilename());
			log.info("upload File Size : " +multipartFile3.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile3.getOriginalFilename());
			
			try { 
				multipartFile3.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img2(multipartFile3.getOriginalFilename());
		}
		
		for(MultipartFile multipartFile4 : uploadFiled) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile4.getOriginalFilename());
			log.info("upload File Size : " +multipartFile4.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile4.getOriginalFilename());
			
			try { 
				multipartFile4.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img3(multipartFile4.getOriginalFilename());
		}
		
		for(MultipartFile multipartFile5 : uploadFilee) {
			
			log.info("--------------------------");
			log.info("upload File Name : " + multipartFile5.getOriginalFilename());
			log.info("upload File Size : " +multipartFile5.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile5.getOriginalFilename());
			
			try { 
				multipartFile5.transferTo(saveFile);
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			board.setP_img4(multipartFile5.getOriginalFilename());
		}
		
		int c_idx = loginvo.getC_idx();
		
		board.setC_idx(c_idx); 
		board.setP_period(board.getP_period1()+" ~ "+board.getP_period2());
		
		service.cupdatea(board);
		
		liboard.setP_people(0);
		liboard.setP_available(0);
		liboard.setP_period(board.getP_period());
		
		service.cupdateb(liboard);
		
		model.addAttribute("clist", service.getcList(c_idx));
	
		return "/pakage/P_clist";
	}
	
	// 패키지 삭제
	@GetMapping("/P_cdelete")
	public String cdelete(HttpServletRequest request, @RequestParam("p_num") String p_num, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "home";
		}

		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");

		if (loginvo == null) {
			model.addAttribute("loginCorpInfo", null);
		} else {
			model.addAttribute("loginCorpInfo", loginvo);
			log.info(loginvo);
		}
		
		int c_idx = loginvo.getC_idx();
		service.cdeletea(p_num);
		service.cdeleteb(p_num);
		
		model.addAttribute("clist", service.getcList(c_idx));
		
		return "/pakage/P_clist";
	}
	
}
