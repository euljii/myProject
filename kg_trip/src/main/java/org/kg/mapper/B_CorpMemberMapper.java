package org.kg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.kg.domain.B_CorpMemberVO;
import org.kg.domain.B_PublicMemberVO;
import org.kg.domain.E_PageDTO;

public interface B_CorpMemberMapper {
	
	public List<B_CorpMemberVO> getCmemberList();
	public int insertCorp(B_CorpMemberVO CorpMember);
	public int checkIdCorp(String c_id);
	public int checkEmailCorp(String c_demail);
	public int checkPhoneCorp(String c_dphone);
	public B_CorpMemberVO getCmember(@Param("c_id") String c_id, @Param("c_pw") String c_pw);
	public int deleteCorp(String c_idx);
	public int updateIntro(@Param("c_idx")int c_idx, @Param("c_intro") String c_intro);
	public int updateImg(@Param("c_idx")int c_idx, @Param("c_img") String c_img);
	public int updateAddress(@Param("c_idx")int c_idx,@Param("c_address")String c_address,@Param("c_zipcode") String c_zipcode);
	public String loginpassword(String c_id);
	public int updatecPw(B_CorpMemberVO vo);
	public B_CorpMemberVO findCIdCode(B_CorpMemberVO vo);
	public B_CorpMemberVO findCIdPhone(B_CorpMemberVO vo);
	public B_CorpMemberVO findCIdEmail(B_CorpMemberVO vo);
	public int findCPw (B_CorpMemberVO vo);
	public int findCPwCheck (B_CorpMemberVO vo);
	public List<B_CorpMemberVO> countC();
	// 페이징 처리 전체 리스트
	public List<B_CorpMemberVO> getCmemberListPaging(E_PageDTO vo);	
	// 총 게시글 수
	public int getCmemberTotalCount(E_PageDTO vo);
}
