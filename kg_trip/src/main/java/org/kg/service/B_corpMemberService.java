package org.kg.service;

import java.util.List;

import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.E_PageDTO;

public interface B_corpMemberService {

	public int joinCorp(B_CorpMemberVO vo);
	public int corpIdCheck(String c_id);
	public int corpEmailCheck(String c_demail);
	public int corpPhoneCheck(String c_dphone);
	public B_CorpMemberVO loginCorp(String c_id, String c_pw);
	public List<B_CorpMemberVO> corpList();
	public int corpDelete(String c_idx);
	public int introUpdate(int c_idx, String c_intro);
	public int imgUpdate(int c_idx, String c_img);
	public int addressUpdate(int c_idx, String c_zipcode, String c_address);
	public String passwordlogin(String c_id);
	public int cpwUpdate(B_CorpMemberVO vo);
	public B_CorpMemberVO findIdCCode(B_CorpMemberVO vo);
	public B_CorpMemberVO findIdCPhone(B_CorpMemberVO vo);
	public B_CorpMemberVO findIdCEmail(B_CorpMemberVO vo);
	public int findPwC (B_CorpMemberVO vo);
	public int findPwCCheck (B_CorpMemberVO vo);
	public List<B_CorpMemberVO> cCount();
	// 전체 글 조회 + 페이징
	public List<B_CorpMemberVO> getListWithPaging(E_PageDTO vo);
	// 총 글 수 카운트
	public int getTotal(E_PageDTO dto); 
	
}
