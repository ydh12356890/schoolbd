package com.springmvc.service.interf;

import com.springmvc.entity.*;

import java.util.List;
import java.util.Map;

/**
 * @Author: ydh
 * @Date: 2018/11/12 18:17
 * @Version: 1.0
 * @todo
 */
public interface IStudentService {

    Undergraduate getUndergraduateInfo(String studentid);
    Postgraduate getPostgraduateInfo(String xh);
    NStudent getStuConsumpInfo(String xh);
    Student getStudentInfo(String stunumber);
    //List<Student> getStudentList();
    StudentScore getStuScoreDisService(String stuNumber);

    List<ScorePredict> getScorePredictService(String stuNumber);

    Map<String,Object> getScoreLimitTable (Map<String,Object> param);
}
