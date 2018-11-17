package com.springmvc.dao;

import com.springmvc.entity.StudentScore;

public interface StudentScoreMapper {
    int deleteByPrimaryKey(Integer csid);

    int insert(StudentScore record);

    int insertSelective(StudentScore record);

    StudentScore selectByPrimaryKey(Integer csid);

    int updateByPrimaryKeySelective(StudentScore record);

    int updateByPrimaryKey(StudentScore record);

    StudentScore selectScoreDisByStuNum(String stuNumber);
}