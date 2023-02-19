package org.eulji.service;

import org.eulji.domain.AccountVO;
import org.eulji.mapper.accountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Repository
public class accountServiceImpl implements accountService {

	@Setter(onMethod_ = @Autowired)
	private accountMapper mapper;

	@Override
	public void join(AccountVO vo) {
		mapper.join(vo);
	}
	
	
}
