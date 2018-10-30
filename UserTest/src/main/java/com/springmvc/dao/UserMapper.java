package com.springmvc.dao;

import com.springmvc.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer stuId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer stuId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}