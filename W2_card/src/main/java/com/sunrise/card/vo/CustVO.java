package com.sunrise.card.vo;

public class CustVO {
	
	private String CUST_NO, SSN, REG_D, HG_NM, BIRTH_D, HDP_NO, LIST_OPR_TM, LST_OPR_D;

	public String getCUST_NO() {
		return CUST_NO;
	}

	public void setCUST_NO(String cUST_NO) {
		CUST_NO = cUST_NO;
	}

	public String getSSN() {
		return SSN;
	}

	public void setSSN(String sSN) {
		SSN = sSN;
	}

	public String getREG_D() {
		return REG_D;
	}

	public void setREG_D(String rEG_D) {
		REG_D = rEG_D;
	}

	public String getHG_NM() {
		return HG_NM;
	}

	public void setHG_NM(String hG_NM) {
		HG_NM = hG_NM;
	}

	public String getBIRTH_D() {
		return BIRTH_D;
	}

	public void setBIRTH_D(String bIRTH_D) {
		BIRTH_D = bIRTH_D;
	}

	public String getHDP_NO() {
		return HDP_NO;
	}

	public void setHDP_NO(String hDP_NO) {
		HDP_NO = hDP_NO;
	}

	public String getLIST_OPR_TM() {
		return LIST_OPR_TM;
	}

	public void setLIST_OPR_TM(String lIST_OPR_TM) {
		LIST_OPR_TM = lIST_OPR_TM;
	}

	public String getLST_OPR_D() {
		return LST_OPR_D;
	}

	public void setLST_OPR_D(String lST_OPR_D) {
		LST_OPR_D = lST_OPR_D;
	}

	@Override
	public String toString() {
		return "CustVO [CUST_NO=" + CUST_NO + ", SSN=" + SSN + ", REG_D=" + REG_D + ", HG_NM=" + HG_NM + ", BIRTH_D="
				+ BIRTH_D + ", HDP_NO=" + HDP_NO + ", LIST_OPR_TM=" + LIST_OPR_TM + ", LST_OPR_D=" + LST_OPR_D + "]";
	}


}
