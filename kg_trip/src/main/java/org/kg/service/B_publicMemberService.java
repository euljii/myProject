package org.kg.service;

import java.util.List;

import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.E_NoticeVO;
import org.kg.domain.E_PageDTO;

public interface B_publicMemberService {
	
	public int joinPublic(B_PublicMemberVO vo);
	public int publicIdCheck(String m_id);
	public int publicNicknameCheck(String m_nickname);
	public int publicEmailCheck(String m_email);
	public int publicPhoneCheck(String m_phone);
	public B_PublicMemberVO loginPublic(String m_id, String m_pw);
	public List<B_PublicMemberVO> publicList();
	public int publicDelete(String m_idx);
	public int publicUpdate(String m_idx);
	public int nicknameUpdate(int m_idx, String m_nickname);
	public int introUpdate(int m_idx, String m_intro);
	public int birthUpdate(int m_idx, String m_birth);
	public int genderUpdate(int m_idx, String m_gender);
	public int imgUpdate(int m_idx, String m_img);
	public String passwordlogin(String m_id);
	public int ppwUpdate(B_PublicMemberVO vo);
	public B_PublicMemberVO findIdPEmail(B_PublicMemberVO vo);
	public B_PublicMemberVO findIdPPhone(B_PublicMemberVO vo);
	public int findPwP (B_PublicMemberVO vo);
	public int findPwPCheck (B_PublicMemberVO vo);
	public List<B_PublicMemberVO> pCount();
	// 전체 글 조회 + 페이징
	public List<B_PublicMemberVO> getListWithPaging(E_PageDTO vo);
	// 총 글 수 카운트
	public int getTotal(E_PageDTO dto); 
	
	
}
