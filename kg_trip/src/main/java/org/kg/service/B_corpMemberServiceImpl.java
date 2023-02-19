package org.kg.service;

import java.util.List;

import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.E_PageDTO;
import org.kg.mapper.B_CorpMemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class B_corpMemberServiceImpl implements B_corpMemberService {
	
	@Setter(onMethod_ = @Autowired)
	private B_CorpMemberMapper mapper;
	
	@Override
	public int joinCorp(B_CorpMemberVO vo) {
		log.info("※※※※※※※※joining※※※※※※※※");
		return mapper.insertCorp(vo);
	}

	@Override
	public int corpIdCheck(String c_id) {
		log.info("중복체크");
		return mapper.checkIdCorp(c_id);
	}

	@Override
	public B_CorpMemberVO loginCorp(String c_id, String c_pw) {
		log.info("※※※※※※※※logining※※※※※※※※");
		return mapper.getCmember(c_id, c_pw);
	}

	@Override
	public List<B_CorpMemberVO> corpList() {
		log.info("회원 조회 중");
		return mapper.getCmemberList();
	}

	@Override
	public int corpEmailCheck(String c_demail) {
		log.info("중복체크");
		return mapper.checkEmailCorp(c_demail);
	}

	@Override
	public int corpPhoneCheck(String c_dphone) {
		log.info("중복체크");
		return mapper.checkPhoneCorp(c_dphone);
	}

	@Override
	public int corpDelete(String c_idx) {
		log.info("회원 탈퇴 나가신다");
		return mapper.deleteCorp(c_idx);
	}

	@Override
	public int introUpdate(int c_idx, String c_intro) {
		log.info("기업 소개 수정중");
		return mapper.updateIntro(c_idx, c_intro);
	}

	@Override
	public int imgUpdate(int c_idx, String c_img) {
		log.info("기업 이미지 수정중");
		return mapper.updateImg(c_idx, c_img);
	}

	@Override
	public int addressUpdate(int c_idx, String c_zipcode, String c_address) {
		log.info("기업 주소 수정중");
		return mapper.updateAddress(c_idx, c_address, c_zipcode);
	}

	@Override
	public String passwordlogin(String c_id) {
		log.info("비밀번호를 갖고옵니다");
		return mapper.loginpassword(c_id);
	}

	@Override
	public int cpwUpdate(B_CorpMemberVO vo) {
		log.info("비밀번호를 변경합니다");
		return mapper.updatecPw(vo);
	}

	@Override
	public B_CorpMemberVO findIdCCode(B_CorpMemberVO vo) {
		log.info("사업자등록번호로 아이디를 찾습니다.");
		return mapper.findCIdCode(vo);
	}

	@Override
	public B_CorpMemberVO findIdCPhone(B_CorpMemberVO vo) {
		log.info("전화번호로 아이디를 찾습니다.");
		return mapper.findCIdPhone(vo);
	}

	@Override
	public B_CorpMemberVO findIdCEmail(B_CorpMemberVO vo) {
		log.info("이메일로 아이디를 찾습니다.");
		return mapper.findCIdEmail(vo);
	}

	@Override
	public int findPwC(B_CorpMemberVO vo) {
		log.info("임시비밀번호를 발급합니다.");
		return mapper.findCPw(vo);
	}

	@Override
	public int findPwCCheck(B_CorpMemberVO vo) {
		log.info("비밀번호를 찾는 회원정보를 찾습니다.");
		return mapper.findCPwCheck(vo);
	}

	@Override
	public List<B_CorpMemberVO> cCount() {
		log.info("월별 기업회원 가입자");
		return mapper.countC();
	}

	@Override
	public List<B_CorpMemberVO> getListWithPaging(E_PageDTO dto) {
		log.info("전체 리스트를 가져옵니다.");
		return mapper.getCmemberListPaging(dto);
	}

	@Override
	public int getTotal(E_PageDTO dto) {
		log.info("카운트 합니다.");
		return mapper.getCmemberTotalCount(dto);
	}

	
	
	
}
