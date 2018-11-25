package com.springmvc.controller;

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



    @RequestMapping("/student/getStudentScore")
    @ResponseBody
    public Map<String,Object> getStuScorePredict(int pageNumber,int pageSize,String stuNumber){
       Map<String,Object> param = new HashMap<String, Object>();
       int a = (pageNumber-1)*pageSize;
       int b = pageSize;
       param.put("startIndex",a);
       param.put("pageSize",b);
       param.put("stuNumber",stuNumber);
       return studentService.getScoreLimitTable(param);

    }
    @RequestMapping("/student/getstuinfo")
    @ResponseBody
    public Postgraduate getStuInfo(@RequestBody Postgraduate postgraduate){
        String stuNum = postgraduate.getXh();

        Postgraduate postgraduate1 = studentService.getPostgraduateInfo(stuNum);

        return postgraduate1;
    }

    @RequestMapping("/student/getUndergraduateInfo")
    @ResponseBody
    public Undergraduate getStuInfo(@RequestBody Undergraduate undergraduate){
        String stuNum = undergraduate.getStudentid();

        Undergraduate undergraduate1 = studentService.getUndergraduateInfo(stuNum);

        return undergraduate1;
    }

  /*  @RequestMapping("/student/getstuinfo")
    @ResponseBody
    public  Student getStuInfo(@RequestBody Student student){
        String stuNum = student.getStuNumber();

        Student student1 = studentService.getStudentInfo(stuNum);

        return student1;
    }*/
    @RequestMapping("/getCardConsumption")
    @ResponseBody
    public NStudent getStuConsumController(@RequestBody NStudent nStudent){
        String stunum = nStudent.getXh();
        NStudent nStudent1 = studentService.getStuConsumpInfo(stunum);
        return nStudent1;

    }



 /*   @RequestMapping("/getCardConsumption")
    @ResponseBody
    public Student getStuAllInfo(@RequestBody Student student){
        String stuNum1 = student.getStuNumber();
        Student student2 = studentService.getStudentInfo(stuNum1);
        return  student2;
    }*/

    /*public Student getStuInfo(@RequestBody Map<String,String> map){

        String stuNumber = map.get("stuNumber").toString();
        Student student = studentService.getStudentInfo(stuNumber);
        return  student;


    }*/

    /*@RequestMapping("/getPie")
    @ResponseBody
    public List<StudentScore> getStuScoreController(@RequestBody Student student){
        Student studentChoosed = studentService.getStudentInfo(student.getStuNumber());
        List<StudentScore> results = new ArrayList<StudentScore>();

        BigDecimal stuscore1 =  studentChoosed.getStuScore1();
        BigDecimal stuscore2 =  studentChoosed.getStuScore2();
        BigDecimal stuscore3 =  studentChoosed.getStuScore3();
        BigDecimal stuscore4 =  studentChoosed.getStuScore4();
        BigDecimal stuscore5 =  studentChoosed.getStuScore5();

        String stusubject1 = studentChoosed.getStuSubject1();
        String stusubject2 = studentChoosed.getStuSubject2();
        String stusubject3 = studentChoosed.getStuSubject3();
        String stusubject4 = studentChoosed.getStuSubject4();
        String stusubject5 = studentChoosed.getStuSubject5();

        results.add(new StudentScore(stusubject1,stuscore1));
        results.add(new StudentScore(stusubject2,stuscore2));
        results.add(new StudentScore(stusubject3,stuscore3));
        results.add(new StudentScore(stusubject4,stuscore4));
        results.add(new StudentScore(stusubject5,stuscore5));

        return results;






        *//*List<StudentScore> results = new ArrayList<StudentScore>();

        for(Student student : studentList){
           String stuname = student.getStuName();
            BigDecimal stuscore = student.getStuScore();
            StudentScore result = new StudentScore(stuname,stuscore);
            results.add(result);
        }
        System.out.println("json数据："+results);
        return results;
*//*

    }
*/
    @RequestMapping("/getScoreDis")
    @ResponseBody
    public  StudentScore getStuScoreDisController(@RequestBody Student student){
        StudentScore studentScore = studentService.getStuScoreDisService(student.getStuNumber());

       /* int zeroFiftynine = studentScore.getZeroFiftynine();
        int sixtySixtynine = studentScore.getSixtySixtynine();
        int seventySeventynine = studentScore.getSeventySeventynine();
        int eightyEightynine= studentScore.getEightyEightynine();
        int ninetyHundred= studentScore.getNinetyHundred();*/

        return studentScore;

    }
    @RequestMapping("/getScorePredict")
    @ResponseBody
    public List<ScorePredict> getScorePredictList (@RequestBody Student student) {
        List<ScorePredict> scorePredictList = studentService.getScorePredictService(student.getStuNumber());
        return scorePredictList;

    }



}
