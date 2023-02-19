package org.kg.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class B_CorpMemberVO {

	private int c_idx, c_type, c_connect, c_joinSum;
	private String c_id,c_pw, c_dname, c_dphone, c_demail, c_name, c_zipcode, c_address, c_intro, c_code, c_auth, c_aircode, c_img,
					address, detailaddress, extraaddress,c_regmonth;
	private Date c_regdate;
	
}
