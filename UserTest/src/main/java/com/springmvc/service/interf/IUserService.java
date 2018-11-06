package com.springmvc.service.interf;

import com.springmvc.entity.User;

/**
 * @Author: ydh
 * @Date: 2018/11/5 17:48
 * @Version: 1.0
 * @todo
 */
public interface IUserService {
     User CheckUserExist(String userName,String userPassword);
     int RegisterNewUser(String userName,String usePassword);

}
