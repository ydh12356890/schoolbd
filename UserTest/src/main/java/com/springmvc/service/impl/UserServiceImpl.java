package com.springmvc.service.impl;

import com.springmvc.dao.UserMapper;
import com.springmvc.entity.User;
import com.springmvc.service.interf.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ydh
 * @Date: 2018/11/5 17:48
 * @Version: 1.0
 * @todo
 */
@Service("userservice")
public class UserServiceImpl implements IUserService {
    @Resource
    UserMapper userMapper;

    public User CheckUserExist(String userName, String userPassword) {
        User user = userMapper.selectUserByUsername(userName);
        if (user != null && user.getUserPassword().equals(userPassword)) {
            return user;
        }
        return null;
    }

    @Override
    public int RegisterNewUser(String userName, String userPassword) {
        User user2 = userMapper.selectUserByUsername(userName);
        if (user2 != null) {
            return 1;
        } else
            userMapper.insertNewUser(userName, userPassword);
        return 0;

    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();

    }
}
