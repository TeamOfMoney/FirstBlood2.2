package com.nantian.nfcm.bms.loan.entity;

public class LoanInfo {
    /**贷款人姓名*/
    private String borrowerName;
    /**配偶姓名*/
    private String spouseName;
    /**性别*/
    private String sex;
    /**证件号码*/
    private String credentialNo;
    /**业务类型*/
    private String businessTypes;
    /**申贷金额*/
    private String amount;
    /**申贷期限*/
    private String term;
    /**担保方式*/
    private String guaranteeMethod;
    /**是否续贷*/
    private String isRenew;
    /**营销人姓名*/
    private String marketer;
    /**营销人岗位*/
    private String marketerPost;
    /**经办人姓名*/
    private String operator;
    /**经办人岗位*/
    private String operatorPost;
    /**商用房备注1*/
    private String syfRemark1;
    /**商用房备注2*/
    private String syfRemark2;
    /**经营贷款备注1*/
    private String jydkRemark1;
    /**经营贷款备注2*/
    private String jydkRemark2;
    /**农户小额贷款备注*/
    private String nhxexydkRemark;
    /**二手房按揭贷款备注*/
    private String esfajRemark;
    /**消费贷款备注*/
    private String xfdkRemark;
    
    public String getBorrowerName() {
        return borrowerName;
    }

    public void setBorrowerName(String borrowerName) {
        this.borrowerName = borrowerName;
    }

    public String getSpouseName() {
        return spouseName;
    }

    public void setSpouseName(String spouseName) {
        this.spouseName = spouseName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCredentialNo() {
        return credentialNo;
    }

    public void setCredentialNo(String credentialNo) {
        this.credentialNo = credentialNo;
    }

    public String getBusinessTypes() {
        return businessTypes;
    }

    public void setBusinessTypes(String businessTypes) {
        this.businessTypes = businessTypes;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getGuaranteeMethod() {
        return guaranteeMethod;
    }

    public void setGuaranteeMethod(String guaranteeMethod) {
        this.guaranteeMethod = guaranteeMethod;
    }

    public String getIsRenew() {
        return isRenew;
    }

    public void setIsRenew(String isRenew) {
        this.isRenew = isRenew;
    }

    public String getMarketer() {
        return marketer;
    }

    public void setMarketer(String marketer) {
        this.marketer = marketer;
    }

    public String getMarketerPost() {
        return marketerPost;
    }

    public void setMarketerPost(String marketerPost) {
        this.marketerPost = marketerPost;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperatorPost() {
        return operatorPost;
    }

    public void setOperatorPost(String operatorPost) {
        this.operatorPost = operatorPost;
    }

	public String getSyfRemark1() {
		return syfRemark1;
	}

	public void setSyfRemark1(String syfRemark1) {
		this.syfRemark1 = syfRemark1;
	}

	public String getSyfRemark2() {
		return syfRemark2;
	}

	public void setSyfRemark2(String syfRemark2) {
		this.syfRemark2 = syfRemark2;
	}

	public String getJydkRemark1() {
		return jydkRemark1;
	}

	public void setJydkRemark1(String jydkRemark1) {
		this.jydkRemark1 = jydkRemark1;
	}

	public String getJydkRemark2() {
		return jydkRemark2;
	}

	public void setJydkRemark2(String jydkRemark2) {
		this.jydkRemark2 = jydkRemark2;
	}

	public String getNhxexydkRemark() {
		return nhxexydkRemark;
	}

	public void setNhxexydkRemark(String nhxexydkRemark) {
		this.nhxexydkRemark = nhxexydkRemark;
	}

	public String getEsfajRemark() {
		return esfajRemark;
	}

	public void setEsfajRemark(String esfajRemark) {
		this.esfajRemark = esfajRemark;
	}

	public String getXfdkRemark() {
		return xfdkRemark;
	}

	public void setXfdkRemark(String xfdkRemark) {
		this.xfdkRemark = xfdkRemark;
	}
    
}
