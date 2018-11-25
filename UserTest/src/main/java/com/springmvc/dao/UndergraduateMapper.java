package com.springmvc.dao;

import com.springmvc.entity.Undergraduate;

public interface UndergraduateMapper {
    int deleteByPrimaryKey(String studentid);

    int insert(Undergraduate record);

    int insertSelective(Undergraduate record);

    Undergraduate selectByPrimaryKey(String studentid);

    int updateByPrimaryKeySelective(Undergraduate record);

    int updateByPrimaryKey(Undergraduate record);
}