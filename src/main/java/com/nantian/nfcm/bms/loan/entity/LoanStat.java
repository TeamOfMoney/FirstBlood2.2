package com.nantian.nfcm.bms.loan.entity;

public enum LoanStat {
	/**
	 * 等待进件
	 */
	WAIT("等待进件"),
	/**
	 * 已进件等待审查
	 */
	SUBMIT("已进件等待审查"),
	/**
	 * 通过审查，等待审批
	 */
	EXAMINE_SUCC("审查成功，等待审批"),
	/**
	 * 审查失败，需要补件 
	 */
	EXAMINE_UPDATE("审查失败，需要补件 "),
	/**
	 * 审查失败，退件
	 */
	EXAMINE_FAIL("审查失败，退件"),
	/**
	 * 审批成功
	 */
	APPROVAL_SUCC("审批成功"),
	/**
	 * 审批失败，退件
	 */
	APPROVAL_FAIL("审批失败，退件"),
	/**
	 * 审批失败，需要补件
	 */	
	APPROVAL_UPDATE("审批失败，需要补件");
	
	private String cnValue;
	
	private LoanStat(String cnValue) {
		this.cnValue = cnValue;
	}
	
	public String cnStr() {
		return cnValue;
	}
}
