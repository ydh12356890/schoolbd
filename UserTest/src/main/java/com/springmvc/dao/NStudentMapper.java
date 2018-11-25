package com.springmvc.dao;

import com.springmvc.entity.NStudent;

public interface NStudentMapper {
    int deleteByPrimaryKey(String xh);

    int insert(NStudent record);

    int insertSelective(NStudent record);

    NStudent selectByPrimaryKey(String xh);

    int updateByPrimaryKeySelective(NStudent record);

    int updateByPrimaryKey(NStudent record);
}