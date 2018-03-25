package com.nantian.nfcm.bms.loan.web;

import com.nantian.nfcm.bms.loan.service.LoanApplicationService;
import com.nantian.nfcm.bms.loan.vo.LoanBean;
import com.nantian.nfcm.util.vo.GridData;
import com.nantian.nfcm.util.vo.LoginBean;
import com.nantian.nfcm.util.vo.ResultInfo;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/loan")
public class LoanApplicationController {
    private static Logger log = LoggerFactory.getLogger(LoanApplicationController.class);
    private LoanApplicationService loanApplicationService;

    public LoanApplicationController(LoanApplicationService loanApplicationService) {
        this.loanApplicationService = loanApplicationService;
    }

    @RequestMapping("/addLoan")
    @ResponseBody
    private ResultInfo addLoan(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
            LoanBean loan = loanApplicationService.addLoanApplication(loanBean);
            resultInfo.setSuccess("true");
            resultInfo.setData(loan);
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/updateLoan")
    @ResponseBody
    private ResultInfo updateLoan(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
            LoanBean loan = loanApplicationService.updateLoanApplication(loanBean);
            resultInfo.setSuccess("true");
            resultInfo.setData(loan);
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/findById")
    @ResponseBody
    private ResultInfo findById(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
            LoanBean loan = loanApplicationService.findById(loanBean.getLoanId());
            resultInfo.setSuccess("true");
            resultInfo.setData(loan);
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }
    
    
    @RequestMapping("/findByCondition")
    @ResponseBody
    private ResultInfo findByCondition(HttpServletRequest request, int page, int size, LoanBean loanJournalBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	LoginBean loginUser = (LoginBean)request.getSession().getAttribute("loginInfo");
            GridData<LoanBean> gd = loanApplicationService.findByCondition(page, size, loanJournalBean,loginUser.getUserName());
            resultInfo.setData(gd.getData());
            resultInfo.setNumber(gd.getNumber());
            resultInfo.setPage(gd.getPage());
            resultInfo.setTotalPage(gd.getTotalPage());
            resultInfo.setSuccess("true");
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/updateLoanJournalDistribution")
    @ResponseBody
    private ResultInfo updateLoanJournalDistribution(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	loanApplicationService.updateLoanJournalDistribution(loanBean);
            resultInfo.setSuccess("true");
            resultInfo.setData("");
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/updateLoanJournalReview")
    @ResponseBody
    private ResultInfo updateLoanJournalReview(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	loanApplicationService.updateLoanJournalReview(loanBean);
            resultInfo.setSuccess("true");
            resultInfo.setData("");
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/updateLoanJournalResubmit")
    @ResponseBody
    private ResultInfo updateLoanJournalResubmit(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	loanApplicationService.updateLoanJournalResubmit(loanBean);
            resultInfo.setSuccess("true");
            resultInfo.setData("");
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/updateLoanJournalRefuse")
    @ResponseBody
    private ResultInfo updateLoanJournalRefuse(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	loanApplicationService.updateLoanJournalRefuse(loanBean);
            resultInfo.setSuccess("true");
            resultInfo.setData("");
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }

    @RequestMapping("/updateLoanJournal2Review")
    @ResponseBody
    private ResultInfo updateLoanJournal2Review(LoanBean loanBean) throws Exception {
        ResultInfo resultInfo = new ResultInfo();
        try {
        	loanApplicationService.updateLoanJournal2Review(loanBean);
            resultInfo.setSuccess("true");
            resultInfo.setData("");
        } catch (Exception e) {
            log.error(e.getMessage());
            resultInfo.setSuccess("false");
            resultInfo.setData(e.getMessage());
        }
        return resultInfo;
    }
}
