package org.kg.mapper;

import java.util.List;

import org.kg.domain.E_NoticeVO;
import org.kg.domain.E_PageDTO;

public interface E_NoticeMapper {
	
	// 페이징 처리 전체 리스트
	public List<E_NoticeVO> getNtListWithPaging(E_PageDTO vo);	

	// 총 게시글 수
	public int getTotalCount(E_PageDTO vo);
	
	// 공지 view
	public E_NoticeVO view(long n_num);
	
	// 공지 insert
	public void insert(E_NoticeVO vo);
	
	// 공지 delete
	public int remove(long n_num);
	
	// 데이터 수정
	public int update(E_NoticeVO vo);
	
	// update
	public int makeFileNullUpdate(E_NoticeVO vo);

	
}
