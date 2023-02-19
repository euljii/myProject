package org.kg.domain;



import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class E_OboVO {
	
	private int o_num, m_idx;
	private String o_cat, o_title, o_content;
	private Date o_regDate, o_updDate;
	
	// 이미지 파일 관련
	private String o_file, o_uploadPath, o_uuid;
	private MultipartFile UploadFile;

	// 글 공개여부 관련
	private String o_dataOpen;
	private int o_OriginM_idx;
	
	private int o_originNo,o_groupOrd, o_groupLayer ;
}
