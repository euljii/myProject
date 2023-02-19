package org.kg.domain;

import lombok.Data;

@Data
public class LoginForm {

	private int m_idx, c_idx;
	private String m_id,c_id;
	private String m_pw,c_pw, update_mpw,update_cpw;
	
}
