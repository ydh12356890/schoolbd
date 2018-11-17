package com.springmvc.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springmvc.entity.Msg;
import com.springmvc.entity.User;
import com.springmvc.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Author: ydh
 * @Date: 2018/11/1 11:00
 * @Version: 1.0
 * @todo
 */
@Controller

public class main {
    @Resource
    UserServiceImpl userService;

    @RequestMapping("/user/login")
    @ResponseBody
    public String Login(HttpServletRequest request,HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       // String rememberme = request.getParameter("rememberme");
        User user = userService.CheckUserExist(username, password);

        if (null ==user) {
            return "false";
        }
        else {
            request.getSession().setAttribute("user", user);
//            request.getSession().setAttribute("password",user);

            return "success";
        }




    }


    @RequestMapping("/user/register")
    @ResponseBody
    public String Register(String username,String password) {
        int a = userService.RegisterNewUser(username, password);
        if (a == 0) {
            System.out.println("注册成功！！！");
            return "register successful";
        } else
            System.out.println("注册失败，用户名已存在！！！");
            return null;

    }
  /*  @RequestMapping(value = "/user/getalluser" , method = RequestMethod.GET)
    @ResponseBody
    public List<User> getUserList () {
        List<User> userList = userService.getAllUser();
        return  userList;


    }
*/


}

