package com.springmvc.service.interf;

import com.springmvc.entity.ScorePredict;
import com.springmvc.entity.Student;
import com.springmvc.entity.StudentScore;

import java.util.List;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:17
 * @Version: 1.0
 * @todo
 */
public interface IStudentService {
    Student getStudentInfo(String stunumber);
    //List<Student> getStudentList();
    StudentScore getStuScoreDisService(String stuNumber);

    List<ScorePredict> getScorePredictService(String stuNumber);
}
