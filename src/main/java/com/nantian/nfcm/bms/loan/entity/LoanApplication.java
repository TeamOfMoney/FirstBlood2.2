package com.nantian.nfcm.bms.loan.entity;

import javax.persistence.*;

@Entity
@Table(name = "loan_application")
public class LoanApplication {
	
	/*
	 * 贷款ID
	 */
    private Long loanId;
    /*
     * 机构ID
     */
    private Long orgId;
    /*
     * 贷款申请时间
     */
    private String initTime;
    /*
     * 贷款处理进度
     */
    private String processStat;
    /*
     * 当前进度处理人
     */
    private String curProcessHandler;
    /*
     * 当前进度更新时间    
     */
    private String curProcessUpdateTime;
    /*
     * 客户经理
     */
    private String operator;
    /*
     * 进件处理人
     */
    private String submiteHandler;
    /*
     * 审批人员
     */
    private String approvalHandler;
    /*
     * 审查人员
     */
    private String examineHandler;
    /*
     * 当前进度反馈
     */
    private String curProcessFeedback;
    
    /*
     * 详细内容
     */
    private String detail;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "loan_id")
    public Long getLoanId() {
        return loanId;
    }

    public void setLoanId(Long loanId) {
        this.loanId = loanId;
    }

	@Basic
    @Column(name = "org_id")
    public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	
	@Basic
    @Column(name = "init_time")
	public String getInitTime() {
		return initTime;
	}

	public void setInitTime(String initTime) {
		this.initTime = initTime;
	}
	
	@Basic
    @Column(name = "process_stat")
	public String getProcessStat() {
		return processStat;
	}

	public void setProcessStat(String processStat) {
		this.processStat = processStat;
	}

	@Basic
    @Column(name = "cur_process_handler")
	public String getCurProcessUser() {
		return curProcessHandler;
	}

	public void setCurProcessUser(String curProcessHandler) {
		this.curProcessHandler = curProcessHandler;
	}

	@Basic
    @Column(name = "cur_process_update_time")
	public String getCurProcessUpdateTime() {
		return curProcessUpdateTime;
	}

	public void setCurProcessUpdateTime(String curProcessUpdateTime) {
		this.curProcessUpdateTime = curProcessUpdateTime;
	}

	@Basic
    @Column(name = "customer_manager")
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	@Basic
    @Column(name = "submite_handler")
	public String getSubmiteHandler() {
		return submiteHandler;
	}

	public void setSubmiteHandler(String submiteHandler) {
		this.submiteHandler = submiteHandler;
	}

	@Basic
    @Column(name = "approval_handler")
	public String getApprovalHandler() {
		return approvalHandler;
	}

	public void setApprovalHandler(String approvalHandler) {
		this.approvalHandler = approvalHandler;
	}

	@Basic
    @Column(name = "examine_handler")
	public String getExamineHandler() {
		return examineHandler;
	}

	public void setExamineHandler(String examineHandler) {
		this.examineHandler = examineHandler;
	}

	@Basic
    @Column(name = "cur_process_feedback")
	public String getCurProcessFeedback() {
		return curProcessFeedback;
	}

	public void setCurProcessFeedback(String curProcessFeedback) {
		this.curProcessFeedback = curProcessFeedback;
	}

	@Basic
    @Column(name = "detail")
    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    
}
