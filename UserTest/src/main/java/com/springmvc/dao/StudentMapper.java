package com.springmvc.dao;

import com.springmvc.entity.Student;

public interface StudentMapper {
    int deleteByPrimaryKey(String stuNumber);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String stuNumber);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}