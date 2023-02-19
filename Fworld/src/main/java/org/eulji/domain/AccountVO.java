package org.eulji.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountVO {

	private int idx, birth, conn ;
	private String id, pw, nickname, name, gender, email,
		pnum, intro, mbti, img, auth;
	private Date regDate;
}
