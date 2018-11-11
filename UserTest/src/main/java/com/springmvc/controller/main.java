package com.springmvc.controller;


import com.alibaba.fastjson.JSONObject;
import com.springmvc.entity.User;
import com.springmvc.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Author: ydh
 * @Date: 2018/11/1 11:00
 * @Version: 1.0
 * @todo
 */
@Controller
@RequestMapping("/user")
public class main {
    @Resource
    UserServiceImpl userService;

    @RequestMapping("/login")
    public void Login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("userName");
        String password = request.getParameter("userPassword");
        JSONObject json = new JSONObject();
        User user = userService.CheckUserExist(username, password);
        if (user != null) {
            json.put("result","success");
        }
        else {
            json.put("result","error");
        }
        out.println(json);



    }

    @RequestMapping("/register")
    public String Register(User user) {
        int a = userService.RegisterNewUser(user.getUserName(), user.getUserPassword());
        if (a == 0) {
            System.out.println("注册成功！！！");
            return "index";
        } else
            System.out.println("注册失败，用户名已存在！！！");
            return null;

    }


}
