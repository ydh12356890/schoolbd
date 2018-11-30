package com.springmvc.dao;

import com.springmvc.entity.School;

import java.util.List;

public interface SchoolMapper {
    int deleteByPrimaryKey(String xydm);

    int insert(School record);

    int insertSelective(School record);

    School selectByPrimaryKey(String xydm);

    int updateByPrimaryKeySelective(School record);

    int updateByPrimaryKey(School record);

    List<School> selectSchoolName(String xymc);
}