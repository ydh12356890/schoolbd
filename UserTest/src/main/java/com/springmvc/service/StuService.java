package com.springmvc.service;

import com.springmvc.dao.UserMapper;
import com.springmvc.entity.User;

import javax.annotation.Resource;

/**
 * @Author: ydh
 * @Date: 2018/11/1 11:17
 * @Version: 1.0
 * @todo
 */
public class StuService {

    private UserMapper userMapper;

    public User getStuId(int stuId){
        User u = this.userMapper.selectByPrimaryKey(stuId);
        if (u!=null){
            return u;
        }
        return  null;

    }
    public int insertStu(User user){
        return this.userMapper.insert(user);
    }
}
