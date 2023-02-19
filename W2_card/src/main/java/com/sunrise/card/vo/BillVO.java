package com.sunrise.card.vo;

public class BillVO {

	private String CUST_NO, STL_ACT, BNK_CD, DPS_NM, STL_MTD, STL_DD, PRCS_CLAS, STMT_SND_MTD, STMT_DENI_CLAS,
	BILLADR_ZIP, BILLADR_ADR1, BILLADR_ADR2, EMAIL_ADR, LST_OPR_TM, LST_OPR_D;

	// 계좌주인 HG_NM으로 넣어서 쿼리에서 DPS_NM으로 받을 것
	private String HG_NM;

	public String getBILLADR_ZIP() {
		return BILLADR_ZIP;
	}

	public void setBILLADR_ZIP(String bILLADR_ZIP) {
		BILLADR_ZIP = bILLADR_ZIP;
	}

	
	public String getHG_NM() {
		return HG_NM;
	}

	public void setHG_NM(String hG_NM) {
		HG_NM = hG_NM;
	}

	public String getCUST_NO() {
		return CUST_NO;
	}

	public void setCUST_NO(String cUST_NO) {
		CUST_NO = cUST_NO;
	}

	public String getSTL_ACT() {
		return STL_ACT;
	}

	public void setSTL_ACT(String sTL_ACT) {
		STL_ACT = sTL_ACT;
	}

	public String getBNK_CD() {
		return BNK_CD;
	}

	public void setBNK_CD(String bNK_CD) {
		BNK_CD = bNK_CD;
	}

	public String getDPS_NM() {
		return DPS_NM;
	}

	public void setDPS_NM(String dPS_NM) {
		DPS_NM = dPS_NM;
	}

	public String getSTL_MTD() {
		return STL_MTD;
	}

	public void setSTL_MTD(String sTL_MTD) {
		STL_MTD = sTL_MTD;
	}

	public String getSTL_DD() {
		return STL_DD;
	}

	public void setSTL_DD(String sTL_DD) {
		STL_DD = sTL_DD;
	}

	public String getPRCS_CLAS() {
		return PRCS_CLAS;
	}

	public void setPRCS_CLAS(String pRCS_CLAS) {
		PRCS_CLAS = pRCS_CLAS;
	}

	public String getSTMT_SND_MTD() {
		return STMT_SND_MTD;
	}

	public void setSTMT_SND_MTD(String sTMT_SND_MTD) {
		STMT_SND_MTD = sTMT_SND_MTD;
	}

	public String getSTMT_DENI_CLAS() {
		return STMT_DENI_CLAS;
	}

	public void setSTMT_DENI_CLAS(String sTMT_DENI_CLAS) {
		STMT_DENI_CLAS = sTMT_DENI_CLAS;
	}


	public String getBILLADR_ADR1() {
		return BILLADR_ADR1;
	}

	public void setBILLADR_ADR1(String bILLADR_ADR1) {
		BILLADR_ADR1 = bILLADR_ADR1;
	}

	public String getBILLADR_ADR2() {
		return BILLADR_ADR2;
	}

	public void setBILLADR_ADR2(String bILLADR_ADR2) {
		BILLADR_ADR2 = bILLADR_ADR2;
	}

	public String getEMAIL_ADR() {
		return EMAIL_ADR;
	}

	public void setEMAIL_ADR(String eMAIL_ADR) {
		EMAIL_ADR = eMAIL_ADR;
	}

	public String getLST_OPR_TM() {
		return LST_OPR_TM;
	}

	public void setLST_OPR_TM(String lST_OPR_TM) {
		LST_OPR_TM = lST_OPR_TM;
	}

	public String getLST_OPR_D() {
		return LST_OPR_D;
	}

	public void setLST_OPR_D(String lST_OPR_D) {
		LST_OPR_D = lST_OPR_D;
	}

	@Override
	public String toString() {
		return "BillVO [CUST_NO=" + CUST_NO + ", STL_ACT=" + STL_ACT + ", BNK_CD=" + BNK_CD + ", DPS_NM=" + DPS_NM
				+ ", STL_MTD=" + STL_MTD + ", STL_DD=" + STL_DD + ", PRCS_CLAS=" + PRCS_CLAS + ", STMT_SND_MTD="
				+ STMT_SND_MTD + ", STMT_DENI_CLAS=" + STMT_DENI_CLAS + ", BILLADR_ZIP=" + BILLADR_ZIP
				+ ", BILLADR_ADR1=" + BILLADR_ADR1 + ", BILLADR_ADR2=" + BILLADR_ADR2 + ", EMAIL_ADR=" + EMAIL_ADR
				+ ", LST_OPR_TM=" + LST_OPR_TM + ", LST_OPR_D=" + LST_OPR_D + ", HG_NM=" + HG_NM + "]";
	}


}
