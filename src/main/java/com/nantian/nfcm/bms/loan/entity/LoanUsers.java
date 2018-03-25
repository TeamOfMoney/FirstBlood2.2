package com.nantian.nfcm.bms.loan.entity;

import java.io.Serializable;

import javax.persistence.*;

import com.nantian.nfcm.bms.auth.entity.UserInfo;

@Entity
@Table(name = "loan_user")
public class LoanUsers implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * 用户名
	 */
	private UserInfo user;
	/*
	 * 贷款ID
	 */
    private LoanApplication loanApplication;
    
    @Id
    @ManyToOne(targetEntity = UserInfo.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "user_name")
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	
	@Id
    @ManyToOne(targetEntity = LoanApplication.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "loan_id")
	public LoanApplication getLoanApplication() {
		return loanApplication;
	}
	public void setLoanApplication(LoanApplication loanApplication) {
		this.loanApplication = loanApplication;
	}
    
    

    
}
