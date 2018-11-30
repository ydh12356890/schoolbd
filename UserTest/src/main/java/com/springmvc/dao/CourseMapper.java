package com.springmvc.dao;

import com.springmvc.entity.Course;

public interface CourseMapper {
    int insert(Course record);

    int insertSelective(Course record);
}