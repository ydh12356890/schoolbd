package com.springmvc.controller;

import com.springmvc.entity.Student;
import com.springmvc.service.impl.StudentServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:23
 * @Version: 1.0
 * @todo
 */
@Controller
public class studentController {
    @Resource
    StudentServiceImpl studentService;

    @RequestMapping("/student/getstuinfo")
    @ResponseBody
    public  Student getStuInfo(@RequestBody Student student){
        String stuNum = student.getStuNumber();

        Student student1 = studentService.getStudentInfo(stuNum);

        return student1;
    }
    /*public Student getStuInfo(@RequestBody Map<String,String> map){

        String stuNumber = map.get("stuNumber").toString();
        Student student = studentService.getStudentInfo(stuNumber);
        return  student;


    }*/


}
