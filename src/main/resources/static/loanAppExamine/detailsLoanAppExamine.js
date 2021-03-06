var querDetialUrl = "../loan/findById.action";

/*-------------------------页面加載------------------------------*/
var loadsoftDetInfo = function(data) {
	util.emmAjax({
		url : querDetialUrl,
		type : 'post',
		data : {
			'loanId' : data
		},
		cache : false,
		dataType : 'text',
		success : function(data) {
			var obj = util.str2Json(data); 
			if(obj.success=='true')
				{
				var object = util.str2Json(data).data.loanInfo;
				$("#borrowerName").html(object.borrowerName);
				$("#spouseName").html(object.spouseName);
				var sexDesc;
				if(object.sex=="1")
				{
					sexDesc="男";
				}
				else if(object.sex=="2")
				{
					sexDesc="女";
				}
				else {
					sexDesc=object.sex;
				}
				$("#sex").html(sexDesc);
			    $("#credentialNo").html(object.credentialNo);
			    var businessTypeDesc;
			    var remark1Desc="";
			    var remark2Desc="";
			    if(object.businessTypes=="1")
				{
			    	businessTypeDesc="商用房";
			    	if(object.syfRemark1=='1')
		    		{
			    		remark1Desc="商业房按揭-商铺、写字楼";
		    		}
			    	else if(object.syfRemark1=='2')
		    		{
			    		remark1Desc="商业房按揭-车位";
		    		}
			    	else
		    		{
			    		remark1Desc=object.syfRemark1;
		    		}
			    	//remark1Desc="";
			    	remark2Desc=object.syfRemark2;
				}
				else if(object.businessTypes=="2")
				{
					businessTypeDesc="消费贷款";
					//remark1Desc="";
					if(object.xfdkRemark=='1')
		    		{
			    		remark1Desc="消费-普通";
		    		}
			    	else if(object.xfdkRemark=='2')
		    		{
			    		remark1Desc="消费-公喜贷";
		    		}
			    	else
		    		{
			    		remark1Desc=object.xfdkRemark;
		    		}
					$("#remark2Td").hide();
					$("#remark2Val").hide();
				}else if(object.businessTypes=="3")
				{
					businessTypeDesc="经营贷款";
					if(object.jydkRemark1=='1')
		    		{
			    		remark1Desc="经营-普通";
		    		}
			    	else if(object.jydkRemark1=='2')
		    		{
			    		remark1Desc="经营-创业小额贷款";
		    		}
			    	else if(object.jydkRemark1=='3')
		    		{
			    		remark1Desc="经营-工会失业人员小额担保贷款";
		    		}
			    	else if(object.jydkRemark1=='4')
		    		{
			    		remark1Desc="经营-妇联失业人员小额担保贷款";
		    		}
			    	else if(object.jydkRemark1=='5')
		    		{
			    		remark1Desc="经营-红色信贷";
		    		}
			    	else
		    		{
			    		remark1Desc=object.xfdkRemark;
		    		}
					//remark1Desc=object.jydkRemark1;
			    	remark2Desc=object.jydkRemark2;
				}else if(object.businessTypes=="4")
				{
					businessTypeDesc="农户小额信用贷款";
					if(object.nhxexydkRemark=='1')
		    		{
			    		remark1Desc="消费";
		    		}
			    	else if(object.nhxexydkRemark=='2')
		    		{
			    		remark1Desc="经营";
		    		}
			    	else
		    		{
			    		remark1Desc=object.nhxexydkRemark;
		    		}
					$("#remark2Td").hide();
					$("#remark2Val").hide();
					//remark1Desc="";
				}else if(object.businessTypes=="5")
				{
					businessTypeDesc="二手房按揭";
					if(object.esfajRemark=='1')
		    		{
			    		remark1Desc="尊园";
		    		}
			    	else if(object.esfajRemark=='2')
		    		{
			    		remark1Desc="其他中介";
		    		}
			    	else
		    		{
			    		remark1Desc=object.esfajRemark;
		    		}
					//remark1Desc="";
					$("#remark2Td").hide();
					$("#remark2Val").hide();
				}
				else {
					businessTypeDesc=object.businessTypes;
				}
			    $("#businessTypes").html(businessTypeDesc);
			  
			    $("#remark1").html(remark1Desc);
			    $("#remark2").html(remark2Desc);
			    $("#amount").html(object.amount);
				$("#term").html(object.term);
				var guaranteeMethodDesc;
			    if(object.guaranteeMethod=="1")
				{
			    	guaranteeMethodDesc="信用";
				}
				else if(object.guaranteeMethod=="2")
				{
					guaranteeMethodDesc="保证";
				}else if(object.guaranteeMethod=="3")
				{
					guaranteeMethodDesc="抵押";
				}else if(object.guaranteeMethod=="4")
				{
					guaranteeMethodDesc="质押";
				}
				else {
					guaranteeMethodDesc=object.guaranteeMethod;
				}
				$("#guaranteeMethod").html(guaranteeMethodDesc);
				var isRenewDesc;
			    if(object.isRenew=="1")
				{
			    	isRenewDesc="新增";
				}
				else if(object.isRenew=="2")
				{
					isRenewDesc="续贷";
				}else if(object.isRenew=="3")
				{
					isRenewDesc="追加";
				}else if(object.isRenew=="4")
				{
					isRenewDesc="借新还旧";
				}
				else if(object.isRenew=="5")
				{
					isRenewDesc="展期";
				}
				else if(object.isRenew=="6")
				{
					isRenewDesc="重组贷款";
				}
				else {
					isRenewDesc=object.isRenew;
				}
				$("#isRenew").html(isRenewDesc);
				$("#marketer").html(object.marketer);
				var marketerPostDesc;
			    if(object.marketerPost=="1")
				{
			    	marketerPostDesc="白龙基社";
				}
				else if(object.marketerPost=="2")
				{
					marketerPostDesc="龙头街基社";
				}else if(object.marketerPost=="3")
				{
					marketerPostDesc="茨坝基社";
				}else if(object.marketerPost=="4")
				{
					marketerPostDesc="联盟基社";
				}
				else if(object.marketerPost=="5")
				{
					marketerPostDesc="东华基社";
				}
				else if(object.marketerPost=="6")
				{
					marketerPostDesc="龙泉基社";
				}
				else if(object.marketerPost=="7")
				{
					marketerPostDesc="营业部基社";
				}else if(object.marketerPost=="8")
				{
					marketerPostDesc="二手房按揭岗";
				}else if(object.marketerPost=="9")
				{
					marketerPostDesc="联社机关";
				}
				else if(object.marketerPost=="10")
				{
					marketerPostDesc="个金部员工";
				}
				else if(object.marketerPost=="11")
				{
					marketerPostDesc="小微中心员工";
				}
				else {
					marketerPostDesc=object.marketerPost;
				}
				$("#marketerPost").html(marketerPostDesc);
				$("#operator").html(object.operator);
				var operatorPostDesc;
			    if(object.operatorPost=="1")
				{
			    	operatorPostDesc="白龙基社";
				}
				else if(object.operatorPost=="2")
				{
					operatorPostDesc="龙头街基社";
				}else if(object.operatorPost=="3")
				{
					operatorPostDesc="茨坝基社";
				}else if(object.operatorPost=="4")
				{
					operatorPostDesc="联盟基社";
				}
				else if(object.operatorPost=="5")
				{
					operatorPostDesc="东华基社";
				}
				else if(object.operatorPost=="6")
				{
					operatorPostDesc="龙泉基社";
				}
				else if(object.operatorPost=="7")
				{
					operatorPostDesc="营业部基社";
				}else if(object.operatorPost=="8")
				{
					operatorPostDesc="二手房按揭岗";
				}else if(object.operatorPost=="9")
				{
					operatorPostDesc="联社机关";
				}
				else if(object.operatorPost=="10")
				{
					operatorPostDesc="个金部员工";
				}
				else if(object.operatorPost=="11")
				{
					operatorPostDesc="小微中心员工";
				}
				else {
					operatorPostDesc=object.operatorPost;
				}
				$("#operatorPost").html(operatorPostDesc);
			}
			else
				{
					util.sysAlert(obj.data);
				}
		}
	});
};
/*
 * 获取url参数
 */
var getUrlParam=function(name) {
	 var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	 var urlParam = window.location.search.substr(1);
	 var r = decodeURI(urlParam).match(reg);  //匹配目标参数
	 if (r != null) return unescape(r[2]); return null; //返回参数值

};

$(function(){
	var loanId = getUrlParam('loanId');
	loadsoftDetInfo(loanId);
	
});

$("#returnBtn").click(function(){
	window.location.href = "./loanAppExamine.html";
});

function approve(result){
	var approveOpinion=$("#remove_opinion").val();
	var processUser = getUrlParam('loginUserName');
	if(result=="REFUSE")
	{
		//退件
		if(approveOpinion=="")
		{
			util.sysAlert("审查意见不能为空！");
		}
		else
		{
			var id = getUrlParam('loanId');
			util.confirmView(function(){
				util.emmAjax({
					url : '../loan/updateLoanJournalRefuse.action',
					type : 'post',
					data : {
						'loanId':id,
						'curProcessFeedback':approveOpinion,
						'curProcessUser':processUser
					},
					cache : false,
					dataType : 'text',
					success : function(data) {
						var obj =str2Json(data);
						if(obj.success=='true')
						{
							util.sysAlert("审查完成");
							window.location.href = "./loanAppExamine.html";
						}
						else{
							util.sysAlert(obj.data);
						}
					}
				});
			},"确定提交吗?");
		}
	}else if(result=="RESUBMIT")
	{
		//补件
		if(approveOpinion=="")
		{
			util.sysAlert("审查意见不能为空！");
		}
		else
		{
			var id = getUrlParam('loanId');
			util.confirmView(function(){
				util.emmAjax({
					url : '../loan/updateLoanJournalResubmit.action',
					type : 'post',
					data : {
						'loanId':id,
						'curProcessFeedback':approveOpinion,
						'curProcessUser':processUser
					},
					cache : false,
					dataType : 'text',
					success : function(data) {
						var obj =str2Json(data);
						if(obj.success=='true')
						{
							util.sysAlert("审查完成");
							window.location.href = "./loanAppExamine.html";
						}
						else{
							util.sysAlert(obj.data);
						}
					}
				});
			},"确定提交吗?");
		}
	}else if(result=="REVIEW")
	{
		//审核
		var id = getUrlParam('loanId');
		util.confirmView(function(){
			util.emmAjax({
				url : '../loan/updateLoanJournalReview.action',
				type : 'post',
				data : {
					'loanId':id,
					'curProcessFeedback':approveOpinion,
					'curProcessUser':processUser
				},
				cache : false,
				dataType : 'text',
				success : function(data) {
					var obj =str2Json(data);
					if(obj.success=='true')
					{
						util.sysAlert("审查完成");
						window.location.href = "./loanAppExamine.html";
					}
					else{
						util.sysAlert(obj.data);
					}
				}
			});
		},"确定提交吗?");
	}
	
}

/**
 *将json字符串转化为json对象
 */
function str2Json(jsonStr){
	var json = eval("(" + jsonStr + ")"); 
	return json;
};