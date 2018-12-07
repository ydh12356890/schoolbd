package com.springmvc.dao;

import com.springmvc.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


    User selectUserByUsername(String userName); //登录

    void insertNewUser(@Param("userName") String userName, @Param("userPassword") String userPassword); //注册 insertNewUser

    int updatePasswordByUsername(@Param("userName") String userName,@Param("userPassword") String userPassword); //修改密码

    int updateLastSchoolByUsername(@Param("userName") String userName,@Param("lastschool")String lastschool);

    /*查询所有用户*/
    List<User> getAllUser();
}