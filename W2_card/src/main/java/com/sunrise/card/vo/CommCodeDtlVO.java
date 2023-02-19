package com.sunrise.card.vo;

public class CommCodeDtlVO {
	
	private String GROUP_CD, GROUP_NM, CODE, CODE_NM, 
	ETC_CD1, ETC_CD2, ETC_CD3, REMARK;

	public CommCodeDtlVO() {
	}

	public String getGROUP_CD() {
		return GROUP_CD;
	}

	public void setGROUP_CD(String gROUP_CD) {
		GROUP_CD = gROUP_CD;
	}

	public String getGROUP_NM() {
		return GROUP_NM;
	}

	public void setGROUP_NM(String gROUP_NM) {
		GROUP_NM = gROUP_NM;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public String getCODE_NM() {
		return CODE_NM;
	}

	public void setCODE_NM(String cODE_NM) {
		CODE_NM = cODE_NM;
	}

	public String getETC_CD1() {
		return ETC_CD1;
	}

	public void setETC_CD1(String eTC_CD1) {
		ETC_CD1 = eTC_CD1;
	}

	public String getETC_CD2() {
		return ETC_CD2;
	}

	public void setETC_CD2(String eTC_CD2) {
		ETC_CD2 = eTC_CD2;
	}

	public String getETC_CD3() {
		return ETC_CD3;
	}

	public void setETC_CD3(String eTC_CD3) {
		ETC_CD3 = eTC_CD3;
	}

	public String getREMARK() {
		return REMARK;
	}

	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}

	@Override
	public String toString() {
		return "CommCodeDtlVO [GROUP_CD=" + GROUP_CD + ", GROUP_NM=" + GROUP_NM + ", CODE=" + CODE + ", CODE_NM="
				+ CODE_NM + ", ETC_CD1=" + ETC_CD1 + ", ETC_CD2=" + ETC_CD2 + ", ETC_CD3=" + ETC_CD3 + ", REMARK="
				+ REMARK + "]";
	}

}