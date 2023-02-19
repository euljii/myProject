package org.kg.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.service.B_corpMemberService;
import org.kg.service.B_publicMemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/Partner/*")
public class B_CorpController {

	private B_corpMemberService cm_service;
	
	// 기업페이지
	@GetMapping("/corpPage")
	public String corpPage(HttpServletRequest request, Model model) {

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
		log.info("기업 페이지로 갑니다");
		return "corp/corpAccountPage";
	}
	
	@PostMapping(value = "/introUpdate", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> corpIntroUpdate(@RequestBody B_CorpMemberVO vo, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");
		
		loginvo.setC_intro(vo.getC_intro());
		
		session.setAttribute("corp", loginvo);
		
		log.info(vo.getC_idx() + vo.getC_intro());
		
		return cm_service.introUpdate(vo.getC_idx(), vo.getC_intro()) == 1 ? 
				new ResponseEntity<String> ("success", HttpStatus.OK) : 
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/addressUpdate", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> corpAddressUpdate(@RequestBody B_CorpMemberVO vo, Model model,HttpServletRequest request) {
		
		String address = vo.getAddress();
		String detailaddress = vo.getDetailaddress();
		
		vo.setC_address(address + detailaddress);
		log.info(vo.getC_address());
		
		HttpSession session = request.getSession(false);
		
		B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");
		
		loginvo.setC_zipcode(vo.getC_zipcode());
		loginvo.setC_address(vo.getC_address());
		
		session.setAttribute("corp", loginvo);
		
		log.info(vo.getC_idx() + vo.getC_intro());
		
		return cm_service.addressUpdate(vo.getC_idx(), vo.getC_zipcode(), vo.getC_address()) == 1 ? 
				new ResponseEntity<String> ("success", HttpStatus.OK) : 
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/imgUpdate", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<B_CorpMemberVO> corpImgUpdate(Model model,HttpServletRequest request,HttpSession session, MultipartFile uploadFile,@RequestParam("c_idx") int c_idx) {
		
		log.info("file upload success..............!!!!!"+uploadFile+"와 "+c_idx);
		
		B_CorpMemberVO vo = new B_CorpMemberVO();
		
		String uploadFolder = "C:\\upload";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = new Date();
	    String str = sdf.format(date);
	    String datePath = str.replace("-", File.separator);
	      
	    File uploadPath = new File(uploadFolder, datePath);
	    log.info("uploadPath : "+uploadPath);
	    
	    if(! uploadPath.exists()) {
			uploadPath.mkdirs();
			log.info(uploadPath.mkdirs());
		}

	    String uploadFileName = uploadFile.getOriginalFilename();
	    String uuid = UUID.randomUUID().toString();
	    uploadFileName = uuid.toString() + "_" + uploadFileName;
	    vo.setC_img("\\"+datePath+"\\"+uploadFileName);
	    vo.setC_idx(c_idx);
	    log.info(vo.getC_img());
	    
	    File saveFile = new File(uploadPath, uploadFileName);

	    try {
	    	uploadFile.transferTo(saveFile);
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	    //-------------------
	    session = request.getSession(false);
		
	    B_CorpMemberVO loginvo = (B_CorpMemberVO) session.getAttribute("corp");
		
		loginvo.setC_img(vo.getC_img());
		
		session.setAttribute("corp", loginvo);
		
		log.info(vo.getC_idx() + vo.getC_img());
		
		cm_service.imgUpdate(vo.getC_idx(), vo.getC_img());
	    
	    ResponseEntity<B_CorpMemberVO> result = new ResponseEntity<B_CorpMemberVO>(vo,HttpStatus.OK);
	    log.info(result);
		
		return result;
	}
}
