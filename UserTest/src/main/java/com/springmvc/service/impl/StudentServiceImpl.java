package com.springmvc.service.impl;

import com.springmvc.dao.ScorePredictMapper;
import com.springmvc.dao.StudentMapper;
import com.springmvc.dao.StudentScoreMapper;
import com.springmvc.entity.ScorePredict;
import com.springmvc.entity.Student;
import com.springmvc.entity.StudentScore;
import com.springmvc.service.interf.IStudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

   /* @Override
    public List<Student> getStudentList() {
        List<Student> studentList = studentMapper.selectStuScore();
        return studentList;
    }*/

}
