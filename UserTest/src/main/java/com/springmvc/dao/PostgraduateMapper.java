package com.springmvc.dao;

import com.springmvc.entity.Postgraduate;

public interface PostgraduateMapper {
    int deleteByPrimaryKey(String xh);

    int insert(Postgraduate record);

    int insertSelective(Postgraduate record);

    Postgraduate selectByPrimaryKey(String xh);

    int updateByPrimaryKeySelective(Postgraduate record);

    int updateByPrimaryKey(Postgraduate record);
}