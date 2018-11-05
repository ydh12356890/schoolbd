package com.springmvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @Author: ydh
 * @Date: 2018/11/1 11:00
 * @Version: 1.0
 * @todo
 */
@Controller
public class main {
   /* @Resource
    AdminServiceImpl adminService;

    @RequestMapping(value = "/admin",method = RequestMethod.POST)
    @ResponseBody
    public int insertUser(Admin admin){

        return adminService.insertAdmin(admin);
    }

    @RequestMapping(value = "/admin/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Admin getUser(@PathVariable Integer id){
        return adminService.getAdmin(id);
    }*/


}
