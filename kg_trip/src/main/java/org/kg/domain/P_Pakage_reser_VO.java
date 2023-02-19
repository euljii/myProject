package org.kg.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class P_Pakage_reser_VO {
	
	private String p_rnum, p_num, p_name, p_period, m_id, m_name, m_phone, p_tid, p_mainimg;
	private int m_idx, p_rpeople, p_totalfee;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd", timezone = "GMT+9")
	private Date p_rdate;
}
