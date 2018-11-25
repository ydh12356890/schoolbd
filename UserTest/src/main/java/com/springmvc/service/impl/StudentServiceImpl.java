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
    ScorePredictMapper scorePredictMapper;
    @Resource
    NStudentMapper nStudentMapper;
    @Resource
    PostgraduateMapper postgraduateMapper;
    @Resource
    UndergraduateMapper undergraduateMapper;


    @Override
    public Undergraduate getUndergraduateInfo(String studentid) {
        return  undergraduateMapper.selectByPrimaryKey(studentid);
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
    public Student getStudentInfo(String stuNumber) {

        return studentMapper.selectByPrimaryKey(stuNumber);
    }

    @Override
    public StudentScore getStuScoreDisService(String stuNumber) {
        StudentScore studentScore =  studentScoreMapper.selectScoreDisByStuNum(stuNumber);
        return  studentScore;

    }

    @Override
    public List<ScorePredict> getScorePredictService(String stuNumber) {
        List<ScorePredict> scorePredictList = scorePredictMapper.selectScorePredict(stuNumber);
        return scorePredictList;
    }

    @Override
    public Map<String, Object> getScoreLimitTable(Map<String, Object> param) {
        //bootstrap-table要求服务器返回的json须包含：total，rows
        Map<String,Object> result = new HashMap<String,Object>();
        int total=scorePredictMapper.selectScoreLimitSize(param).size();
        List<ScorePredict> rows=scorePredictMapper.selectScoreBystuNumberLimit(param);
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
