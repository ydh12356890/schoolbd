package com.springmvc.service.impl;

import com.springmvc.dao.*;
import com.springmvc.entity.*;
import com.springmvc.service.interf.IStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:18
 * @Version: 1.0
 * @todo
 */
@Service("stuService")
public class StudentServiceImpl implements IStudentService {
    @Resource
    StudentMapper studentMapper;
    @Resource
    StudentScoreMapper studentScoreMapper;
    @Resource
    NStudentMapper nStudentMapper;
    @Resource
    PostgraduateMapper postgraduateMapper;
    @Resource
    UndergraduateMapper undergraduateMapper;
    @Resource
    SchoolMapper schoolMapper;

    @Resource
    StuScorePredictMapper stuScorePredictMapper;

    @Resource
    StuConsumeOutlierMapper stuConsumeOutlierMapper;

    @Override
    public List<School> getSchoolNameService(String xymc) {
        return schoolMapper.selectSchoolName(xymc);
    }

    @Override
    public List<StuScorePredict> getTwoScoreservice(String xh) {
        return stuScorePredictMapper.selectTwoScoreByXh(xh);
    }

    @Override
    public Undergraduate getUndergraduateInfo(String studentid) {
        return  undergraduateMapper.selectUndergraduateBaseInfo(studentid);
    }

    @Override
    public Postgraduate getPostgraduateInfo(String xh) {
        return postgraduateMapper.selectByPrimaryKey(xh);
    }

    @Override
    public NStudent getStuConsumpInfo(String xh) {
        return  nStudentMapper.selectByPrimaryKey(xh);
    }

    @Override
    public StuConsumeOutlier getStuConsumeOutlierService(String xh, String year) {
        StuConsumeOutlier stuConsumeOutlier = stuConsumeOutlierMapper.selectByXhAndYear(xh,year);
        return stuConsumeOutlier;
    }

    @Override
    public Student getStudentInfo(String stuNumber) {
        return studentMapper.selectByPrimaryKey(stuNumber);
    }

    @Override
    public StudentScore getStuScoreDisService(String stuNumber) {
        StudentScore studentScore =  studentScoreMapper.selectScoreDisByStuNum(stuNumber);
        return  studentScore;

    }

    @Override
    public Map<String, Object> getScoreLimitTable(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=undergraduateMapper.selectScoreLimitSize(param).size();
        List<Undergraduate> rows=undergraduateMapper.selectScoreBystuNumberLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getCourseScoreLimit(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=stuScorePredictMapper.selectCourseScoreLimitSize(param).size();
        List<StuScorePredict> rows=stuScorePredictMapper.selectCourseScoreBystudentidLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getGoodScoreStuLimitTable(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=undergraduateMapper.selectGoodScoreLimitSize(param).size();
        List<Undergraduate> rows=undergraduateMapper.selectGoodScoreStuLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
    }

    @Override
    public Map<String, Object> getGoodCourseScoreLimit(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=stuScorePredictMapper.selectGoodCourseScoreLimitSize(param).size();
        List<StuScorePredict> rows=stuScorePredictMapper.selectGoodCourseScoreBystudentidLimit(param);
        result.put("total",total);
        result.put("rows",rows);
        return result;
}



   /* @Override
    public List<Student> getStudentList() {
        List<Student> studentList = studentMapper.selectStuScore();
        return studentList;
    }*/

}
