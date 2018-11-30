package com.springmvc.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.springmvc.entity.*;
import com.springmvc.service.impl.StudentServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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


    @RequestMapping("/student/checkschool")  //查询学院名
    @ResponseBody
    public List<School> getSchoolNameController(@RequestBody School school){
        String xymc = school.getXymc();
        return studentService.getSchoolNameService(xymc);
    }
   /* public Map<String,Object> getStuScorePredict(int pageNumber,int pageSize,String xymc){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        return studentService.getScoreLimitTable(param);

    }*/
    /* @RequestMapping("/student/getStudentScore")
    @ResponseBody
    public Map<String,Object> getStuScorePredict(int pageNumber,int pageSize,String stuNumber){
       Map<String,Object> param = new HashMap<String, Object>();
       int a = (pageNumber-1)*pageSize;
       int b = pageSize;
       param.put("startIndex",a);
       param.put("pageSize",b);
       param.put("stuNumber",stuNumber);
       return studentService.getScoreLimitTable(param);

    }*/
   @RequestMapping("/student/getStudentScore")  //根据学院名称，服务端分页查询出预测成绩不及格的所有学生
   @ResponseBody
    public String getStuScorePredict(int pageNumber,int pageSize,String xymc){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        String jsonstr =  JSON.toJSONString(studentService.getScoreLimitTable(param));
        System.out.println("主表："+jsonstr);
        return jsonstr;

    }
    @RequestMapping("/student/getGoodStudentScore")  //根据学院名称，服务端分页查询出预测成绩优秀的所有学生
    @ResponseBody
    public String getGoodStuScorePredict(int pageNumber,int pageSize,String xymc){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        String jsonstr =  JSON.toJSONString(studentService.getGoodScoreStuLimitTable(param));
        System.out.println("主表："+jsonstr);
        return jsonstr;

    }

    @RequestMapping("/student/getCourseScore")  //根据学号，服务端分页查询出预测成绩不及格对应的所有课程
    @ResponseBody
    public String getCourseScore(int pageNumber,int pageSize,String studentid){
       Map<String,Object> param = new HashMap<String, Object>();
       int a = (pageNumber-1)*pageSize;
       int b = pageSize;
       param.put("startIndex",a);
       param.put("pageSize",b);
       param.put("studentid",studentid);
       String jsonstr =  JSON.toJSONString(studentService.getCourseScoreLimit(param));
       System.out.println("子表"+jsonstr);
       return jsonstr;

    }
    @RequestMapping("/student/getGoodCourseScore")  //根据学号，服务端分页查询出预测成绩优秀对应的所有课程
    @ResponseBody
    public String getGoodCourseScore(int pageNumber,int pageSize,String studentid){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("studentid",studentid);
        String jsonstr =  JSON.toJSONString(studentService.getGoodCourseScoreLimit (param));
        System.out.println("子表"+jsonstr);
        return jsonstr;

    }

    @RequestMapping("/student/getstuinfo")  //获取研究生的基本信息
    @ResponseBody
    public Postgraduate getStuInfo(@RequestBody Postgraduate postgraduate){
        String stuNum = postgraduate.getXh();

        Postgraduate postgraduate1 = studentService.getPostgraduateInfo(stuNum);

        return postgraduate1;
    }

    @RequestMapping("/student/getUndergraduateInfo")   //获取本科生的基本信息
    @ResponseBody
    public Undergraduate getStuInfo(@RequestBody Undergraduate undergraduate){
        String stuNum = undergraduate.getStudentid();

        Undergraduate undergraduate1 = studentService.getUndergraduateInfo(stuNum);

        return undergraduate1;
    }

    @RequestMapping("/getCardConsumption")  //获取一卡通全年52周消费信息（研究生）
    @ResponseBody
    public NStudent getStuConsumController(@RequestBody NStudent nStudent){
        String stunum = nStudent.getXh();
        NStudent nStudent1 = studentService.getStuConsumpInfo(stunum);
        return nStudent1;

    }
    @RequestMapping("/getScoreDis")  //获取成绩分布
    @ResponseBody
    public  StudentScore getStuScoreDisController(@RequestBody Student student){
        StudentScore studentScore = studentService.getStuScoreDisService(student.getStuNumber());
        return studentScore;

    }




}
