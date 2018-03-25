package com.nantian.nfcm.bms.auth.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.nantian.nfcm.bms.auth.entity.UserInfo;

import java.util.List;

public interface UserInfoDao extends JpaRepository<UserInfo, String>,JpaSpecificationExecutor<UserInfo>{
    public  UserInfo findFirstByUserType(String userType);
    
    public  List<UserInfo> findByUserType(String userType);
}
