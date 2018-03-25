package com.nantian.nfcm.bms.loan.service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Predicate;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nantian.nfcm.bms.auth.dao.UserInfoDao;
import com.nantian.nfcm.bms.auth.entity.UserInfo;
import com.nantian.nfcm.bms.loan.dao.LoanApplicationDao;
import com.nantian.nfcm.bms.loan.entity.LoanApplication;
import com.nantian.nfcm.bms.loan.entity.LoanInfo;
import com.nantian.nfcm.bms.loan.entity.LoanStat;
import com.nantian.nfcm.bms.loan.vo.LoanBean;
import com.nantian.nfcm.util.DateUtil;
import com.nantian.nfcm.util.ServiceException;
import com.nantian.nfcm.util.vo.GridData;

@Service
public class LoanApplicationService {
    private LoanApplicationDao loanApplicationDao;
    private UserInfoDao userInfoDao;

    @Autowired
    public LoanApplicationService(LoanApplicationDao loanApplicationDao, UserInfoDao userInfoDao) {
        this.loanApplicationDao = loanApplicationDao;
        this.userInfoDao = userInfoDao;
    }

    public LoanBean findById(Long loanId) throws ServiceException {
        LoanApplication loanApplication = loanApplicationDao.findOne(loanId);
        LoanBean loanBean = po2vo(loanApplication);
        ObjectMapper mapper = new ObjectMapper();
        try {
            LoanInfo loanInfo = mapper.readValue(loanApplication.getDetail(), LoanInfo.class);
            loanBean.setLoanInfo(loanInfo);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return loanBean;
    }

    @Transactional
    public LoanBean addLoanApplication(LoanBean loanBean) throws ServiceException {
        LoanInfo loanInfo = loanBean.getLoanInfo();

        ObjectMapper mapper = new ObjectMapper();
        try {
            String detail = mapper.writeValueAsString(loanInfo);
            loanBean.setDetail(detail);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new ServiceException("贷款申请详细信息错误");
        }
        LoanApplication loanApplication = vo2po(loanBean);
        //设置当前回执为空
        loanApplication.setCurProcessFeedback("-");
        //设置当前进度处理人为空
        loanApplication.setCurProcessUser("-");
        //设置当前进度状态
        loanApplication.setProcessStat(LoanStat.WAIT.cnStr());
        
        String nowDate = DateUtil.getCurrentTime("yyyy-MM-dd");
        //设置贷款提交时间
        loanApplication.setInitTime(nowDate);
        //设置流程最近更新时间
        loanApplication.setCurProcessUpdateTime(nowDate);
        //设置审查人员为空
        loanApplication.setExamineHandler("-");
        //设置进件处理人员为空
        loanApplication.setSubmiteHandler("-");
        //设置审批人员为空
        loanApplication.setApprovalHandler("-");
        
        LoanApplication loanApplicationRet = loanApplicationDao.save(loanApplication);
        LoanBean loanBeanRet = po2vo(loanApplicationRet);

        return loanBeanRet;
    }

	public GridData<LoanBean> findByCondition(int page, int size, LoanBean loanBean, String loginUserID)
			throws ServiceException {
		Pageable pageable = new PageRequest(page, size);
		Specification<LoanApplication> specification = (root, query, criteriaBuilder) -> {
			List<Predicate> predicates = new ArrayList<>();

			UserInfo loginUser = userInfoDao.findOne(loginUserID);
			
			switch (loginUser.getUserType()) {
			case "1":
				//查询条件带有客户经理用户名
				if (loanBean.getOperator() != null && !loanBean.getOperator().equals("")) {
					Predicate operator = criteriaBuilder.equal(root.get("operator").as(String.class), loanBean.getOperator());
					predicates.add(operator);
				}
				break;
			//分配人
			case "2":
				//查询申请人经手的申请
				if (loanBean.getOperator() != null && !loanBean.getOperator().equals("")) {
					Predicate operator = criteriaBuilder.equal(root.get("submiteHandler").as(String.class), loanBean.getOperator());
					predicates.add(operator);
				}

				break;
			//审查人
			case "3":
				//查询审查人经手的申请
				if (loanBean.getOperator() != null && !loanBean.getOperator().equals("")) {
					Predicate operator = criteriaBuilder.equal(root.get("examineHandler").as(String.class), loanBean.getOperator());
					predicates.add(operator);
				}
				
				//查询条件带有审查人员用户名
				if (loanBean.getExamineHandler() != null && !loanBean.getExamineHandler().equals("")) {
					Predicate examineHandler = criteriaBuilder.equal(root.get("examineHandler").as(String.class), loanBean.getExamineHandler());
					predicates.add(examineHandler);
				}
				break;
				
			default:
				break;
			}
			
			
			//处理进度条件
			if (loanBean.getProcessStat() != null && !loanBean.getProcessStat().equals("")) {
				Predicate processStat = criteriaBuilder.equal(root.get("processStat").as(String.class), loanBean.getProcessStat());
				predicates.add(processStat);
			}

			query.where(criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()])));
			return query.getRestriction();
		};
		
		Page<LoanApplication> loanApplicationPage = loanApplicationDao.findAll(specification, pageable);
		List<LoanApplication> LoanApplications = loanApplicationPage.getContent();
		List<LoanBean> loanBeans = new ArrayList<>();

		for (LoanApplication loanJournal : LoanApplications) {
			
			LoanBean resultRowBean = po2vo(loanJournal);

			// 查询明细项
			Specification<LoanApplication> appDetails = (root, query, criteriaBuilder) -> {
				Predicate condition = criteriaBuilder.equal(root.get("loanId").as(Long.class), loanJournal.getLoanId());
				query.where(condition);
				return query.getRestriction();
			};
			LoanApplication perApp = loanApplicationDao.findOne(appDetails);

			ObjectMapper mapper = new ObjectMapper();
			// 贷款明细对象
			LoanInfo loanInfo = null;
			try {
				loanInfo = mapper.readValue(perApp.getDetail(), LoanInfo.class);
			} catch (IOException e) {
				e.printStackTrace();
			}

			// 获取贷款类型
			String typeName = "";
			switch (loanInfo.getBusinessTypes()) {
			case "1":
				typeName = "商用房贷款";
				break;
			case "2":
				typeName = "消费贷款";
				break;
			case "3":
				typeName = "经营贷款";
				break;
			case "4":
				typeName = "农户小额信用贷款";
				break;				
			case "5":
				typeName = "二手房按揭贷款";
				break;					

			}
			resultRowBean.setLoanType(typeName);
			
			// 获取贷款金额
			 NumberFormat nf = new DecimalFormat("#,###.#### 万元");
			 Double d = Double.valueOf(loanInfo.getAmount());
			 String formatStr = nf.format(d);
			resultRowBean.setLoanAmount(formatStr);
			// 获取贷款周期
			resultRowBean.setLoanTerm(loanInfo.getTerm() + "个月");
			//转义当前进度处理人
			UserInfo perUser = new UserInfo();
			if (resultRowBean.getCurProcessUser() != null 
					&& !resultRowBean.getCurProcessUser().equals("") 
					&& !resultRowBean.getCurProcessUser().equals("-")) {
				perUser = userInfoDao.findOne(resultRowBean.getCurProcessUser());
				resultRowBean.setCurProcessUser(perUser.getRealName());
			}
			
			//转义当前进度提交人
			if (resultRowBean.getSubmiteHandler() != null 
					&& !resultRowBean.getSubmiteHandler().equals("") 
					&& !resultRowBean.getSubmiteHandler().equals("-")) {
				perUser = userInfoDao.findOne(resultRowBean.getSubmiteHandler());
				resultRowBean.setSubmiteHandler(perUser.getRealName());
			}
			
			//转义当前进度审查人
			if (resultRowBean.getExamineHandler() != null 
					&& !resultRowBean.getExamineHandler().equals("") 
					&& !resultRowBean.getExamineHandler().equals("-")) {
				perUser = userInfoDao.findOne(resultRowBean.getExamineHandler());
				resultRowBean.setExamineHandler(perUser.getRealName());
			}
			
			//转义当前进度审批人
			if (resultRowBean.getApprovalHandler() != null 
					&& !resultRowBean.getApprovalHandler().equals("") 
					&& !resultRowBean.getApprovalHandler().equals("-")) {
				perUser = userInfoDao.findOne(resultRowBean.getApprovalHandler());
				resultRowBean.setApprovalHandler(perUser.getRealName());
			}
			loanBeans.add(resultRowBean);
		}
		GridData<LoanBean> gridData = new GridData<>();
		gridData.setData(loanBeans);
		gridData.setNumber(loanApplicationPage.getTotalElements());
		gridData.setPage(loanApplicationPage.getNumber());
		gridData.setTotalPage(loanApplicationPage.getTotalPages());
		return gridData;
	}
    
    @Transactional
    public LoanBean updateLoanApplication(LoanBean loanBean) throws ServiceException {
        Long loanId = loanBean.getLoanId();
        LoanApplication loanApplication = loanApplicationDao.findOne(loanId);
        if (loanApplication == null) {
            throw new ServiceException("贷款申请信息不存在");
        }
        
        if (loanApplication.getProcessStat().equals(LoanStat.EXAMINE_FAIL.cnStr()) || 
        		loanApplication.getProcessStat().equals(LoanStat.APPROVAL_FAIL.cnStr())) {
        	throw new ServiceException("贷款申请已退件无法编辑！");
		}
        
        LoanInfo loanInfo = loanBean.getLoanInfo();
        ObjectMapper mapper = new ObjectMapper();
        try {
            loanApplication.setDetail(mapper.writeValueAsString(loanInfo));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new ServiceException("贷款申请详细信息错误");
        }
        //设置当前回执为空
        loanApplication.setCurProcessFeedback("-");
        //设置当前进度处理人为空
        loanApplication.setCurProcessUser("-");
        //设置当前进度状态
        loanApplication.setProcessStat(LoanStat.WAIT.cnStr());
        
        String nowDate = DateUtil.getCurrentTime("yyyy-MM-dd");
        //设置贷款提交时间
        loanApplication.setInitTime(nowDate);
        //设置流程最近更新时间
        loanApplication.setCurProcessUpdateTime(nowDate);
        //设置审查人员为空
        loanApplication.setExamineHandler("-");
        //设置进件处理人员为空
        loanApplication.setSubmiteHandler("-");
        //设置审批人员为空
        loanApplication.setApprovalHandler("-");
        loanApplicationDao.save(loanApplication);
        return loanBean;
    }

    /**
     * 分配
     * @param loanlBean
     * @throws ServiceException
     */
    @Transactional
    public void updateLoanJournalDistribution(LoanBean loanlBean) throws ServiceException{
        String processUser = loanlBean.getCurProcessUser();
        List<Long> ids = loanlBean.getIds();
        if(ids==null||ids.size()==0){
            throw new ServiceException("贷款申请分配错误");
        }
        for(Long id : ids){
            //根据ID查询贷款流程流水信息，将分配的标志置为1
            LoanApplication loanApp = loanApplicationDao.findOne(id);

            loanApp.setProcessStat(LoanStat.SUBMIT.cnStr());
            loanApp.setCurProcessUser(processUser);
            loanApp.setCurProcessUpdateTime(DateUtil.getCurrentTime("yyyy-MM-dd"));
            loanApp.setSubmiteHandler(processUser);
            loanApp.setExamineHandler(loanlBean.getExamineHandler());
            loanApplicationDao.save(loanApp);

        }
    }

    /**
     * 审核
     * @param loanBean
     * @throws ServiceException
     */
    @Transactional
    public void updateLoanJournalReview(LoanBean loanBean) throws ServiceException{
        Long id = loanBean.getLoanId();
        //查询需要审查的记录
        LoanApplication loanApp = loanApplicationDao.findOne(id);

        loanApp.setProcessStat(LoanStat.EXAMINE_SUCC.cnStr());;
        loanApp.setCurProcessUpdateTime(DateUtil.getCurrentTime("yyyy-MM-dd"));
        loanApp.setCurProcessUser(loanBean.getCurProcessUser());
        loanApp.setExamineHandler(loanBean.getCurProcessUser());
        loanApp.setCurProcessFeedback(loanBean.getCurProcessFeedback());
        loanApplicationDao.save(loanApp);
    }

    /**
     * 补件
     * @param loanBean
     * @throws ServiceException
     */
    @Transactional
    public void updateLoanJournalResubmit(LoanBean loanBean) throws ServiceException{
        Long id = loanBean.getLoanId();
        //将贷款流程流水中审核的状态置为1
        LoanApplication loanApp = loanApplicationDao.findOne(id);

        if (loanApp.getProcessStat().equals(LoanStat.SUBMIT.cnStr())) {
            //如果上一个阶段是进件阶段,那么标记为审查失败需要补件
        	loanApp.setProcessStat(LoanStat.EXAMINE_UPDATE.cnStr());
		}else if (loanApp.getProcessStat().equals(LoanStat.EXAMINE_SUCC.cnStr())) {
			//如果上一个阶段是审查成功阶段，那么标记为审批失败需要补件
			loanApp.setProcessStat(LoanStat.APPROVAL_UPDATE.cnStr());
		}
        
        loanApp.setCurProcessUser(loanBean.getCurProcessUser());
        
        loanApp.setCurProcessFeedback(loanBean.getCurProcessFeedback());
        
        loanApp.setCurProcessUpdateTime(DateUtil.getCurrentTime("yyyy-MM-dd"));
        loanApplicationDao.save(loanApp);
    }

    /**
     * 退件
     * @param loanBean
     * @throws ServiceException
     */
    @Transactional
    public void updateLoanJournalRefuse(LoanBean loanBean) throws ServiceException{
        Long id = loanBean.getLoanId();

        //查询对应记录
        LoanApplication loanApp = loanApplicationDao.findOne(id);

        System.out.println("++++++++++++" + (loanApp.getProcessStat().equals(LoanStat.SUBMIT.cnStr())));
        
        //根据实际情况更新代码
        if (loanApp.getProcessStat().equals(LoanStat.SUBMIT.cnStr())) {
            //如果上一个阶段是进件阶段,那么标记为审查失败退件
        	loanApp.setProcessStat(LoanStat.EXAMINE_FAIL.cnStr());
		}else if (loanApp.getProcessStat().equals(LoanStat.EXAMINE_SUCC.cnStr())) {
			//如果上一个阶段是审查成功阶段，那么标记为审批失败退件
			loanApp.setProcessStat(LoanStat.APPROVAL_FAIL.cnStr());
		}
        loanApp.setCurProcessUser(loanBean.getCurProcessUser());
        loanApp.setCurProcessFeedback(loanBean.getCurProcessFeedback());
        
        loanApp.setCurProcessUpdateTime(DateUtil.getCurrentTime("yyyy-MM-dd"));
        loanApplicationDao.save(loanApp);

    }

    /**
     * 二审
     * @param loanBean
     * @throws ServiceException
     */
    @Transactional
    public void updateLoanJournal2Review(LoanBean loanBean) throws ServiceException{
        Long id = loanBean.getLoanId();
        
        LoanApplication loanApp = loanApplicationDao.findOne(id);

        loanApp.setCurProcessFeedback(loanBean.getCurProcessFeedback());
        loanApp.setCurProcessUser(loanBean.getCurProcessUser());
        loanApp.setProcessStat(LoanStat.APPROVAL_SUCC.cnStr());
        loanApp.setCurProcessUpdateTime(DateUtil.getCurrentTime("yyyy-MM-dd"));
        loanApp.setApprovalHandler(loanBean.getCurProcessUser());
        loanApplicationDao.save(loanApp);
	    }

    
    private LoanApplication vo2po(LoanBean loanBean) {
        LoanApplication loanApplication = new LoanApplication();
        BeanUtils.copyProperties(loanBean, loanApplication);
        return loanApplication;
    }

    private LoanBean po2vo(LoanApplication loanApplication) {
        LoanBean loanBean = new LoanBean();
        BeanUtils.copyProperties(loanApplication, loanBean);
        return loanBean;
    }
}