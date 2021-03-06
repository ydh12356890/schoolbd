package com.springmvc.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.springmvc.dao.StuScorePredictMapper;
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
    @RequestMapping("/student/getStuFilterByXhName")  //根据学院名称、姓名学号，服务端分页模糊查询出预测成绩不及格的所有学生
    @ResponseBody
    public String getStuFilterByXhNameController(int pageNumber,int pageSize,String xymc,String studentid,String name){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        param.put("studentid",studentid);
        param.put("name",name);
        String jsonstr =  JSON.toJSONString(studentService.getStuFilterByXhName(param));
        System.out.println("主表："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getStuFilterByXhNameGood")  //根据学院名称、姓名学号，服务端分页模糊查询出预测成绩优秀的所有学生
    @ResponseBody
    public String getStuFilterByXhNameGoodController(int pageNumber,int pageSize,String xymc,String studentid,String name){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        param.put("studentid",studentid);
        param.put("name",name);
        String jsonstr =  JSON.toJSONString(studentService.getStuFilterByXhNameGood(param));
        System.out.println("主表："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getSchoolFilterStudent")  //根据学院名称、姓名学号，服务端分页模糊查询出该学院的所有学生
    @ResponseBody
    public String getSchoolStuFilterController(int pageNumber,int pageSize,String xymc,String studentid,String name){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        param.put("studentid",studentid);
        param.put("name",name);
        String jsonstr =  JSON.toJSONString(studentService.getAllSchoolStudentFilterService(param));
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
    @RequestMapping("/student/getSchoolStudent")  //根据学院，查询出所有学生列表
    @ResponseBody
    public String getSchoolStudent(int pageNumber,int pageSize,String xymc){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        String jsonstr =  JSON.toJSONString(studentService.getAllSchoolStudentService (param));
        System.out.println("子表"+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getstudentsByXhName")  //根据学号、姓名，查询出相应学生S
    @ResponseBody
    public String getStuByXhNameController(int pageNumber,int pageSize,String studentid,String name){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("studentid",studentid);
        param.put("name",name);
        String jsonstr =  JSON.toJSONString(studentService.getstusByXHNameService(param));
        System.out.println("学号姓名筛选："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getPgstudentsByXhName")  //根据学号、姓名，查询出研究生相应学生S
    @ResponseBody
    public String getPgStuByXhNameController(int pageNumber,int pageSize,String studentid,String name){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("studentid",studentid);
        param.put("name",name);
        String jsonstr =  JSON.toJSONString(studentService.getPgStusByXHNameService(param));
        System.out.println("学号姓名筛选："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getPgCCOByXhNameYear")  //根据学号、姓名、年份，查询出（离群值）研究生相应学生
    @ResponseBody
    public String getPgCCOByXhNameYearController(int pageNumber,int pageSize,String xh,String name,String year){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xh",xh);
        param.put("name",name);
        param.put("year",year);
        String jsonstr =  JSON.toJSONString(studentService.getPgCCOService(param));
        System.out.println("学号姓名筛选："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getFailCoursrByXymc")  //根据xymc查询出不及格课程及人数占比
    @ResponseBody
    public String getFailCourseController(int pageNumber,int pageSize,String xymc){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        String jsonstr =  JSON.toJSONString(studentService.getFailCourseService(param));
        System.out.println("学号姓名筛选："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getSchoolAllCoursrByXymc")  //根据xymc查询出学院开设的课程
    @ResponseBody
    public String getSchoolAllCourseController(int pageNumber,int pageSize,String xymc){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xymc",xymc);
        String jsonstr =  JSON.toJSONString(studentService.getSchoolAllCourseService(param));
        System.out.println("学院开设课程："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/student/getAllFailCoursrByXymc")  //根据xymc查询出不及格课程及人数占比
    @ResponseBody
    public List<FailCourse> getAllFailCourseController(@RequestBody School school){
        return studentService.getAllFailCourseService(school.getXymc());
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
    @RequestMapping("/getInputAutocomplete")   //获取本科生学号自动输入完成
    @ResponseBody
    public List<Undergraduate> getUgInputXh(@RequestBody Undergraduate undergraduate){
        String name = undergraduate.getName();
        List<Undergraduate> undergraduateList = studentService.getAllXhByxhService(name);
        return undergraduateList;
    }
    @RequestMapping("/getCardConsumption")  //获取一卡通全年53周消费信息（研究生）
    @ResponseBody
    public List<WeekConsump> getStuConsumController(@RequestBody WeekConsump weekConsump){
        String stunum = weekConsump.getXh();
        return studentService.getStuConsumpInfo(stunum);

    }
    @RequestMapping("/getYearConsumptionOutlier")  //获取一卡通全年53周消费离群值（研究生）
    @ResponseBody
    public List <ConsumpOutlierThreeTag> getStuConsumOutlierController(@RequestBody StuConsumeOutlier stuConsumeOutlier){
        String xh = stuConsumeOutlier.getXh();
        String year = stuConsumeOutlier.getYear();
        return studentService.getStuConsumeOutlierService(xh,year);
    }
    @RequestMapping("/getWeekConsumpByXhYearWeek")
    @ResponseBody
    public List <WeekdayExp> getWeekdayConsumpController(@RequestBody StuConsumeOutlier stuConsumeOutlier){
        String xh = stuConsumeOutlier.getXh();
        String year = stuConsumeOutlier.getYear();
        String week = stuConsumeOutlier.getWeek();
        return studentService.getWeekdayConsumpService(xh,year,week);
    }
    @RequestMapping("/student/getOutlierWeek")  //获取某位学生的53周中的离群周（>0.8或者<-0.8）
    @ResponseBody
    public String getOutlierWeekController(int pageNumber,int pageSize,String xh,String year){
        Map<String,Object> param = new HashMap<String, Object>();
        int a = (pageNumber-1)*pageSize;
        int b = pageSize;
        param.put("startIndex",a);
        param.put("pageSize",b);
        param.put("xh",xh);
        param.put("year",year);
        String jsonstr =  JSON.toJSONString(studentService.getOutlierWeekService(param));
        System.out.println("学号姓名筛选："+jsonstr);
        return jsonstr;
    }
    @RequestMapping("/getTwoScore")  //获取成绩分布
    @ResponseBody
    public  List<StuScorePredict> getStuScoreDisController(@RequestBody StuScorePredict stuScorePredict){
        return studentService.getTwoScoreservice (stuScorePredict.getXh());
    }
    @RequestMapping("/getSchoolPersonNum")  //获取各学院人数
    @ResponseBody
    public  List<School> getSchoolPersonNumController(){
       List<School> schoolList = studentService.getpersonNumAllSchoolService();
       return schoolList;
    }
    @RequestMapping("/getMFRatioSingleSchool")  //获取学院男女比例
    @ResponseBody
    public  List<MFRatio> getMFRatioSingleSchoolController(@RequestBody School school){
        List<MFRatio> mfRatioList = studentService.getMFRatioSingleSchoolService(school.getXymc());
        return mfRatioList;
    }
}
