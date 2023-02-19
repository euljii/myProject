package org.kg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.kg.domain.E_FreqVO;
import org.kg.domain.E_OboVO;
import org.kg.domain.E_PageDTO;

public interface E_OboMapper {
	
	// 리스트 (매퍼테스트용)
	public List<E_OboVO> getOboList(E_PageDTO vo);
	
	// 총 게시글 수
	public int getOboTotalCount(E_PageDTO vo);

	// view
	public E_OboVO view(long o_num);
	
	// nickname 뽑기
	public String getNickname(long o_num);
	
	// insert 원글
	public void insertOrigin(E_OboVO vo);

	// insert 답글
	public void insertRe(E_OboVO vo);
	
	// remove
	public int remove(long o_num);
	
	// update
	public int update(E_OboVO vo);

	// 사진 삭제 - ajax
	public int makeFileNullUpdate(long o_num);
	
	// 사진 업로드  - ajax
	public int uploadFile(long o_num);
	
	// 마이페이지
	// 내가 쓴 일대일게시판 글 리스트
	public List<E_OboVO> myPageOboList(E_PageDTO dto);
	
	// 총 게시글 수
	public int getOboCount(E_PageDTO vo);
	
}
