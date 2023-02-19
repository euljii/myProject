package com.sunrise.board.vo;

public class ComCodeVO {
	private String code_type;
	private String code_id;
	private String code_name;
	private String creator;
	private String CREATE_TIME;
	private String MODIFIER;
	private String MODIFIED_TIME;
	
	public String getCode_type() {
		return code_type;
	}
	public void setCode_type(String code_type) {
		this.code_type = code_type;
	}
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCREATE_TIME() {
		return CREATE_TIME;
	}
	public void setCREATE_TIME(String cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}
	public String getMODIFIER() {
		return MODIFIER;
	}
	public void setMODIFIER(String mODIFIER) {
		MODIFIER = mODIFIER;
	}
	public String getMODIFIED_TIME() {
		return MODIFIED_TIME;
	}
	public void setMODIFIED_TIME(String mODIFIED_TIME) {
		MODIFIED_TIME = mODIFIED_TIME;
	}
	@Override
	public String toString() {
		return "ComCodeVO [code_type=" + code_type + ", code_id = " + code_id +", code_name = " + code_name 
				+ ", creator = " + creator + ", cREATE_TIME = " + CREATE_TIME + ", mODIFIER = " + MODIFIER
				+ ", MODIFIED_TIME = " + MODIFIED_TIME + "]";
	}
	
	

}
