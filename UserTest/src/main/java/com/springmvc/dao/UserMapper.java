package com.springmvc.dao;

import com.springmvc.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);



    User selectUserByUsername(String userName); //登录
    void insertNewUser(String userName,String userPassword); //注册
}