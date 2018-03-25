package com.nantian.nfcm.bms.loan.vo;

import java.util.ArrayList;

import com.nantian.nfcm.bms.loan.entity.LoanApplication;
import com.nantian.nfcm.bms.loan.entity.LoanInfo;

public class LoanBean extends LoanApplication {

	/*
	 * 贷款类型
	 */
	private String loanType;

	/*
	 * 贷款金额
	 */
	private String LoanAmount;

	/*
	 * 贷款期限
	 */
	private String LoanTerm;

	/*
	 * 贷款详细信息
	 */
	private LoanInfo loanInfo;
	
	
    private ArrayList<Long> loanIds = new ArrayList<>();
    private ArrayList<Long> Ids = new ArrayList<>();

	public LoanInfo getLoanInfo() {
		return loanInfo;
	}

	public void setLoanInfo(LoanInfo loanInfo) {
		this.loanInfo = loanInfo;
	}

	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public String getLoanAmount() {
		return LoanAmount;
	}

	public void setLoanAmount(String loanAmount) {
		LoanAmount = loanAmount;
	}

	public String getLoanTerm() {
		return LoanTerm;
	}

	public void setLoanTerm(String loanTerm) {
		LoanTerm = loanTerm;
	}

	public ArrayList<Long> getLoanIds() {
		return loanIds;
	}

	public void setLoanIds(ArrayList<Long> loanIds) {
		this.loanIds = loanIds;
	}

	public ArrayList<Long> getIds() {
		return Ids;
	}

	public void setIds(ArrayList<Long> ids) {
		Ids = ids;
	}

}
