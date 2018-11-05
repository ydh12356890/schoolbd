package com.springmvc.service.interf;

import com.springmvc.entity.Admin;

/**
 * @Author: ydh
 * @Date: 2018/11/5 17:02
 * @Version: 1.0
 * @todo
 */
public interface IAdminService {

       Admin getAdmin(int id);

       int insertAdmin(Admin admin);

       //通过用户名及密码核查用户登录




    }



